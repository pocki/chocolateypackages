$packageName = 'logitechgaming'
$installerType = 'EXE'
$url = "https://www.logitech.com/pub/techsupport/gaming/LGS_8.89.68_x86_Logitech.exe"
$url64 = "https://www.logitech.com/pub/techsupport/gaming/LGS_8.89.68_x64_Logitech.exe"
$silentArgs = '/S'
$checksum = '2536916800cef0a82adec9baa7205cac5ad884402b33bc13a5610653d496d811'
$checksum64 = 'f087e9caf89183463d9ae62e6d31aae621f54da7c2d4faf720e65e31b3b0c058'
$checksumType = 'sha256'
$validExitCodes = @(0)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -Checksum "$checksum" -ChecksumType "$checksumType" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType" -validExitCodes $validExitCodes