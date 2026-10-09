param(
  [Parameter(Mandatory=$true)]
  [string]$LogPath
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $LogPath)) {
  Write-Error "Build log not found: $LogPath"
  exit 2
}

$lines = Get-Content -LiteralPath $LogPath
$matches = @()

foreach ($line in $lines) {
  $isDelphiWarning = $line -match '\bW\d{4}\b'
  $isToolWarning = $line -match '(?i):\s*warning\s+[A-Z0-9]+'
  $isPositiveSummary = $line -match '(?i)^\s*[1-9]\d*\s+(warning|warnings|aviso|avisos)\b'
  if ($isDelphiWarning -or $isToolWarning -or $isPositiveSummary) {
    $matches += $line
  }
}

if ($matches.Count -gt 0) {
  Write-Output "Warnings: $($matches.Count)"
  $matches | ForEach-Object { Write-Output $_ }
  exit 1
}

Write-Output 'Warnings: 0'
exit 0
