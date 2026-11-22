# PASO 2 - VERDE: copia el código (lib) y vuelve a correr las pruebas (deben PASAR)
$origen = $PSScriptRoot
Set-Location (Join-Path (Split-Path $origen -Parent) 'loteria_push_app')
Copy-Item "$origen\app\lib\*" lib\ -Recurse -Force
Write-Host "`n===== VERDE: ya existe el codigo, las pruebas pasan =====`n" -ForegroundColor Green
flutter test test\partida_test.dart --reporter expanded
flutter test
Set-Location "$origen\server"
npm test
