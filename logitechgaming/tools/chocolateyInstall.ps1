$packageName = 'logitechgaming'
$installerType = 'EXE'
$url = "https://www.logitech.com/pub/techsupport/gaming/LGS_9.02.65_x86_Logitech.exe"
$url64 = "https://www.logitech.com/pub/techsupport/gaming/LGS_9.02.65_x64_Logitech.exe"
 
$packageArgs = @{
  packageName   = $packageName
  fileType      = $installerType
  url           = $url
  url64bit      = $url64
  silentArgs    = '/S'
  validExitCodes= @(0)
  softwareName  = 'logitechgaming*'
  checksum      = 'FD70176DDEEEE0A24BBACEEF67A67004DEBF53ED437DB7D7C06786F8D4FD8EEB'
  checksumType  = 'sha256'
  checksum64      = 'E037727F2E571F41864D93FBCC094E124EDA3E1DCD2D56973F1F65C5A577BF55'
  checksumType64  = 'sha256'
};
 
Install-ChocolateyPackage @packageArgs;