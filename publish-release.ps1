# Publish backend JARs to GitHub Releases
# Prerequisites:
#   1. winget install --id GitHub.cli
#   2. gh auth login
# Usage (from repo root):
#   .\publish-release.ps1
#   .\publish-release.ps1 -Tag v1.0.0 -Target cuizhen

param(
    [string]$Tag = "v1.0.0",
    [string]$Target = "cuizhen",
    [string]$Title = "Backend JARs $Tag"
)

$ErrorActionPreference = "Stop"

$jars = @(
    "file/rct-eureka-0.0.1.jar",
    "file/rct-service-0.0.1.jar",
    "file/rct-zuul-0.0.1.jar"
)

foreach ($jar in $jars) {
    if (-not (Test-Path $jar)) {
        throw "Missing JAR: $jar"
    }
}

gh auth status
if ($LASTEXITCODE -ne 0) {
    Write-Host "Not logged in. Run: gh auth login"
    exit 1
}

$notes = @"
## Backend JARs

Place these files into the ``file/`` directory before ``docker-compose build``:

- ``rct-eureka-0.0.1.jar``
- ``rct-service-0.0.1.jar``
- ``rct-zuul-0.0.1.jar``

See README for install steps.
"@

gh release create $Tag @jars `
    --repo ruictec/edwei `
    --target $Target `
    --title $Title `
    --notes $notes

Write-Host "Release created: https://github.com/ruictec/edwei/releases/tag/$Tag"
