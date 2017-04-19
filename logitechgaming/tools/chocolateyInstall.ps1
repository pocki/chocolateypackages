$packageName = 'logitechgaming'
$installerType = 'EXE'
$url = "https://www.logitech.com/pub/techsupport/gaming/LGS_8.92.67_x86_Logitech.exe"
$url64 = "https://www.logitech.com/pub/techsupport/gaming/LGS_8.92.67_x64_Logitech.exe"
$silentArgs = '/S'
$checksum = 'f4f50d48ee587692d4ecee256b9a5175f111c6e88919d87d0aac9c1b07662f4d'
$checksum64 = '6b9542da1623d1818288c756069f45c58538c34c9045ca702af58041b1a3d8f8'
$checksumType = 'sha256'
$validExitCodes = @(0)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -Checksum "$checksum" -ChecksumType "$checksumType" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType" -validExitCodes $validExitCodes
