$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$StatusPath = Join-Path $ProjectRoot "runtime\status\status.json"

if (-not (Test-Path $StatusPath)) {
    Write-Error "Status Registry not found: $StatusPath"
    exit 2
}

Get-Content $StatusPath -Raw
