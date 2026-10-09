param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("OPEN","RESOLVE")]
    [string]$Action,

    [Parameter(Mandatory=$true)]
    [string]$BlockerId,

    [string]$Type = "",
    [string]$RaisedBy = "",
    [string]$Owner = "",
    [string]$Issue = "",
    [string]$Evidence = "",
    [string]$Resolution = ""
)

$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$StatusPath = Join-Path $ProjectRoot "runtime\status\status.json"

if (-not (Test-Path $StatusPath)) {
    Write-Error "Status Registry not found."
    exit 2
}

$Status = Get-Content $StatusPath -Raw | ConvertFrom-Json

$Blockers = @()
foreach ($B in $Status.open_blockers) {
    $Blockers += $B
}

if ($Action -eq "OPEN") {
    if ([string]::IsNullOrWhiteSpace($Type) -or
        [string]::IsNullOrWhiteSpace($RaisedBy) -or
        [string]::IsNullOrWhiteSpace($Owner) -or
        [string]::IsNullOrWhiteSpace($Issue)) {
        Write-Error "OPEN requires Type, RaisedBy, Owner and Issue."
        exit 3
    }

    $Blockers += [pscustomobject]@{
        id = $BlockerId
        type = $Type
        raised_by = $RaisedBy
        owner = $Owner
        issue = $Issue
        evidence = $Evidence
        status = "OPEN"
        opened_at = (Get-Date).ToString("o")
    }

    $Status.current_gate = "BLOCKED"
}
else {
    $Found = $false
    $Remaining = @()

    foreach ($B in $Blockers) {
        if ($B.id -eq $BlockerId) {
            $Found = $true
        }
        else {
            $Remaining += $B
        }
    }

    if (-not $Found) {
        Write-Error "Blocker not found: $BlockerId"
        exit 4
    }

    $Blockers = $Remaining
}

$Status.open_blockers = $Blockers
$Status.updated_at = (Get-Date).ToString("o")
$Status | ConvertTo-Json -Depth 10 | Set-Content -Encoding UTF8 $StatusPath

Write-Output "BLOCKER REGISTRY UPDATED"
