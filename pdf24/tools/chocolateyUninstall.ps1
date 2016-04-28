$packageName = 'pdf24'
 
$key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
$key64 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
$entries = (Get-ChildItem $key) + (Get-ChildItem $key64)
$target = $entries|?{$_.GetValue('DisplayName') -match 'PDF24 Creator'}

if (-not $target) {
    Write-Output "$packageName is not installed."
    return
}

$uninst = $target.GetValue('UninstallString') -replace "/I","/X"
Write-Output "Uninstall $packageName by [$uninst]"
& cmd /c $uninst /qn
