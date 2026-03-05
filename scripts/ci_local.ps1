# Script para rodar os mesmos checks do CI localmente, antes de abrir PR
# Uso: .\scripts\ci_local.ps1

param(
    [string]$AndroidDeviceId = "emulator-5554"
)

$ErrorActionPreference = "Stop"
$projectRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $projectRoot

Write-Host "=== 1/4 flutter analyze ===" -ForegroundColor Cyan
flutter analyze
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "`n=== 2/4 flutter test (unit + widget) ===" -ForegroundColor Cyan
flutter test
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "`n=== 3/4 flutter test integration_test/app_test.dart -d chrome ===" -ForegroundColor Cyan
flutter test integration_test/app_test.dart -d chrome
if ($LASTEXITCODE -ne 0) {
    Write-Host "`nIntegration test Web falhou." -ForegroundColor Yellow
    exit $LASTEXITCODE
}

Write-Host "`n=== 4/4 flutter test integration_test/app_test.dart -d $AndroidDeviceId ===" -ForegroundColor Cyan
flutter test integration_test/app_test.dart -d $AndroidDeviceId
if ($LASTEXITCODE -ne 0) {
    Write-Host "`nIntegration test Android falhou. Verifique se o emulador/dispositivo está conectado." -ForegroundColor Yellow
    exit $LASTEXITCODE
}

Write-Host "`n=== Todos os checks passaram ===" -ForegroundColor Green
