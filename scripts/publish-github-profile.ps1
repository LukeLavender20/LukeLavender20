param(
    [string]$Owner = "LukeLavender20",
    [string]$Repository = "LukeLavender20",
    [string]$Token = $env:GITHUB_TOKEN
)

$ErrorActionPreference = "Stop"

function Get-GitHubCredential {
    param(
        [string]$ExplicitToken
    )

    if (-not [string]::IsNullOrWhiteSpace($ExplicitToken)) {
        return [pscustomobject]@{
            Username = $Owner
            Token = $ExplicitToken
        }
    }

    $inputText = "protocol=https`nhost=github.com`n`n"
    $credentialOutput = $inputText | git credential-manager get --no-ui
    $username = $null
    $password = $null

    foreach ($line in $credentialOutput) {
        if ($line -like "username=*") { $username = $line.Substring("username=".Length) }
        if ($line -like "password=*") { $password = $line.Substring("password=".Length) }
    }

    if ([string]::IsNullOrWhiteSpace($username) -or [string]::IsNullOrWhiteSpace($password)) {
        throw "No GitHub credential found. Run: git credential-manager github login --device --username $Owner, or set GITHUB_TOKEN for this process."
    }

    [pscustomobject]@{
        Username = $username
        Token = $password
    }
}

function Invoke-GitHubApi {
    param(
        [string]$Method,
        [string]$Uri,
        [object]$Body = $null,
        [string]$Token
    )

    $headers = @{
        Authorization = "Bearer $Token"
        Accept = "application/vnd.github+json"
        "X-GitHub-Api-Version" = "2022-11-28"
        "User-Agent" = "public-profile-publisher"
    }

    if ($null -eq $Body) {
        Invoke-RestMethod -Method $Method -Uri $Uri -Headers $headers
    } else {
        Invoke-RestMethod -Method $Method -Uri $Uri -Headers $headers -ContentType "application/json" -Body ($Body | ConvertTo-Json -Depth 10)
    }
}

if (-not (Test-Path -LiteralPath ".git")) {
    throw "Run this script from the root of the local profile repository."
}

$credential = Get-GitHubCredential -ExplicitToken $Token
$repoFullName = "$Owner/$Repository"
$repoUrl = "https://github.com/$repoFullName.git"

$repoExists = $false
try {
    Invoke-GitHubApi -Method Get -Uri "https://api.github.com/repos/$repoFullName" -Token $credential.Token | Out-Null
    $repoExists = $true
} catch {
    $statusCode = $null
    if ($_.Exception.Response -and $_.Exception.Response.StatusCode) {
        $statusCode = [int]$_.Exception.Response.StatusCode
    }
    if ($statusCode -ne 404) {
        throw
    }
}

if (-not $repoExists) {
    Invoke-GitHubApi -Method Post -Uri "https://api.github.com/user/repos" -Token $credential.Token -Body @{
        name = $Repository
        description = "Public GitHub profile and sanitized IT operations portfolio."
        homepage = "https://github.com/$Owner"
        private = $false
        has_issues = $true
        has_projects = $false
        has_wiki = $false
        auto_init = $false
    } | Out-Null
}

$existingOrigin = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($existingOrigin)) {
    git remote add origin $repoUrl
} elseif ($existingOrigin -ne $repoUrl) {
    git remote set-url origin $repoUrl
}

git push -u origin main

Write-Host "Published https://github.com/$repoFullName"
