$packageName = 'mouseclickcounter'
$url = 'http://pock-programming.net/MouseClickCounter/MouseClickCounter%20v2.0.4.3.zip' 

try {
  $targetPath = Join-Path $env:APPDATA $packageName
  if(Test-Path $targetPath) {
    $backupFile = Join-Path $targetPath 'Daten\Daten.sdf'
    $tempFile = Join-Path $env:TEMP 'Daten.sdf'
    while(Get-Process "$packageName v2" -ErrorAction SilentlyContinue) {
      Get-Process "$packageName v2" -ErrorAction SilentlyContinue | stop-process –force -ErrorAction SilentlyContinue
    }

    if(Test-Path $backupFile) {
      Copy-Item -Path $backupFile -Destination $tempFile -Force | Out-Null
      Install-ChocolateyZipPackage "$packageName" "$url" "$targetPath" 
      Copy-Item -Path $tempFile -Destination $backupFile -Force | Out-Null
    }
    else {
      Install-ChocolateyZipPackage "$packageName" "$url" "$targetPath" 
    }
  }
  else {
    New-Item -ItemType directory -Path "$targetPath" | Out-Null
    Install-ChocolateyZipPackage "$packageName" "$url" "$targetPath" 

    $target = Join-Path $targetPath 'MouseClickCounter v2.exe'
    Install-ChocolateyDesktopLink -TargetFilePath "$target"
  }
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}