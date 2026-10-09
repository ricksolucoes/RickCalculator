param(
    [Parameter(Mandatory=$true)]
    [string]$Request,

    [string]$TaskId = ""
)

$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$RuntimeRoot = Join-Path $ProjectRoot "runtime"
$StatusDir = Join-Path $RuntimeRoot "status"
$TasksDir = Join-Path $RuntimeRoot "tasks"

New-Item -ItemType Directory -Force -Path $StatusDir | Out-Null
New-Item -ItemType Directory -Force -Path $TasksDir | Out-Null

if ([string]::IsNullOrWhiteSpace($TaskId)) {
    $TaskId = "TASK-" + (Get-Date -Format "yyyyMMdd-HHmmss")
}

$TaskRoot = Join-Path $TasksDir $TaskId
$TaskSpecs = Join-Path $TaskRoot "specs"
$TaskEvidence = Join-Path $TaskRoot "evidence"
$TaskLogs = Join-Path $TaskRoot "logs"

New-Item -ItemType Directory -Force -Path $TaskSpecs | Out-Null
New-Item -ItemType Directory -Force -Path $TaskEvidence | Out-Null
New-Item -ItemType Directory -Force -Path $TaskLogs | Out-Null

$Status = [ordered]@{
    schema_version = 1
    task_id = $TaskId
    original_request = $Request
    task_status = "IN_PROGRESS"
    current_stage = "FLOW_COORDINATOR"
    current_agent = "FLOW_COORDINATOR"
    current_gate = "PENDING"
    open_blockers = @()
    approved_artifacts = @()
    last_handoff = $null
    human_decision_required = $false
    build_specs_runtime_dependency = $false
    updated_at = (Get-Date).ToString("o")
}

$StatusPath = Join-Path $StatusDir "status.json"
$Status | ConvertTo-Json -Depth 10 | Set-Content -Encoding UTF8 $StatusPath

Write-Output "RUNTIME INITIALIZED"
Write-Output "TaskId=$TaskId"
Write-Output "Status=$StatusPath"
Write-Output "NextAgent=FLOW_COORDINATOR"
