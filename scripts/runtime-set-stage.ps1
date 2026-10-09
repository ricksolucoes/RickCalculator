param(
    [Parameter(Mandatory=$true)]
    [string]$Stage,

    [Parameter(Mandatory=$true)]
    [string]$Agent,

    [ValidateSet("PENDING","PASS","FAIL","BLOCKED")]
    [string]$Gate = "PENDING"
)

$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$StatusPath = Join-Path $ProjectRoot "runtime\status\status.json"

if (-not (Test-Path $StatusPath)) {
    Write-Error "Status Registry not found."
    exit 2
}

$Status = Get-Content $StatusPath -Raw | ConvertFrom-Json

if ($Status.open_blockers.Count -gt 0 -and $Gate -eq "PASS") {
    Write-Error "Cannot set PASS while blockers are open."
    exit 3
}

$Status.current_stage = $Stage
$Status.current_agent = $Agent
$Status.current_gate = $Gate
$Status.updated_at = (Get-Date).ToString("o")

$Status | ConvertTo-Json -Depth 10 | Set-Content -Encoding UTF8 $StatusPath
Write-Output "STATUS UPDATED"
