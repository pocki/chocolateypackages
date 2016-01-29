$packageName = 'pdf24'
 
try {
  $key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
  $key64 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
  $entries = (Get-ChildItem $key) + (Get-ChildItem $key64)
  $target = $entries|?{$_.GetValue('DisplayName') -match 'PDF24 Creator'}
 
  if (-not $target) {
    Write-Host "$packageName is not installed."
    return
  }
 
  $uninst = $target.GetValue('UninstallString') -replace "/I","/X"
  Write-Host "Uninstall $packageName by [$uninst]"
  & cmd /c $uninst /qn
 
  Write-ChocolateySuccess $packageName
} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw
}