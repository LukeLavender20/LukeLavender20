$ErrorActionPreference = "Stop"

$literalPatterns = @(
    "SMKK",
    "Keith",
    "Keith's",
    "Kitchens",
    "keith",
    "keithskitchenswv",
    "pafds",
    "172\.",
    "192\.168",
    "07eb",
    "\\172.",
    "\\192.168",
    "\\10.",
    "\\files\",
    "\\server\"
)

$regexPatterns = @(
    "[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}",
    "172\.",
    "192\.168",
    "\bShatter\b",
    "\bGriffin\b",
    "\bEva\b",
    "\bMarry\b",
    "\bMary\b",
    "\bClint\b",
    "\bJJ\b",
    "\bBrandon\b",
    "\bCharles\b",
    "\bMichael\s+Roberts\b",
    "\bLuke\s+Lavender\b"
)

$escapedLiterals = $literalPatterns | ForEach-Object { [regex]::Escape($_) }
$regex = (($escapedLiterals + $regexPatterns) -join "|")
$hits = rg -n -i $regex . --glob "!.git/**" --glob "!scripts/scan-public-content.ps1" 2>$null

if ($LASTEXITCODE -eq 1) {
    Write-Host "PASS: no private identifiers found."
    exit 0
}

if ($LASTEXITCODE -ne 0) {
    throw "Scan failed with exit code $LASTEXITCODE."
}

Write-Host "FAIL: review public-content findings before publishing."
$hits
exit 2
