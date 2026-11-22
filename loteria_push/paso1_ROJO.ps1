# PASO 1 - ROJO: crea un proyecto aparte, copia SOLO las pruebas y ejecútalas (deben FALLAR)
# Uso: abre PowerShell en esta carpeta (loteria_push) y ejecuta:  .\paso1_ROJO.ps1
$origen = $PSScriptRoot
Set-Location (Split-Path $origen -Parent)
flutter create loteria_push_app --project-name loteria_push
Set-Location loteria_push_app
Copy-Item "$origen\app\pubspec.yaml" . -Force
Remove-Item test\widget_test.dart -ErrorAction SilentlyContinue
Copy-Item "$origen\app\test\*.dart" test\ -Force
flutter pub get
Write-Host "`n===== ROJO: las pruebas fallan porque todavia no existe el codigo =====`n" -ForegroundColor Red
flutter test test\partida_test.dart
