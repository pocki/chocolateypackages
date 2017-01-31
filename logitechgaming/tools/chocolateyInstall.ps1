$packageName = 'logitechgaming'
$installerType = 'EXE'
$url = "https://www.logitech.com/pub/techsupport/gaming/LGS_8.91.48_x86_Logitech.exe"
$url64 = "https://www.logitech.com/pub/techsupport/gaming/LGS_8.91.48_x64_Logitech.exe"
$silentArgs = '/S'
$checksum = 'cc23a3cc5ef0cf69a6b14c21bd9006a12e17ceece66a1c919434af7c4f26ce60'
$checksum64 = 'b9f7b2f20d48e0e75af1ad11ac80edf124156569eed0b9a564d5b9b844272bd7'
$checksumType = 'sha256'
$validExitCodes = @(0)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -Checksum "$checksum" -ChecksumType "$checksumType" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType" -validExitCodes $validExitCodes
