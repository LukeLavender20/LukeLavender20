$ErrorActionPreference = "Stop"

$patterns = @(
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
    "Shatter",
    "Griffin",
    "Eva",
    "Marry",
    "Mary",
    "Clint",
    "JJ",
    "Brandon",
    "Charles",
    "Michael Roberts",
    "Luke Lavender",
    "[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}",
    "\\\\"
)

$regex = ($patterns -join "|")
$hits = rg -n $regex . --glob "!.git/**" --glob "!scripts/scan-public-content.ps1" 2>$null

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
