$packageName = 'logitechgaming'
$installerType = 'EXE'
$url = "https://www.logitech.com/pub/techsupport/gaming/LGS_9.00.42_x86_Logitech.exe"
$url64 = "https://www.logitech.com/pub/techsupport/gaming/LGS_9.00.42_x64_Logitech.exe"
$silentArgs = '/S'
$checksum = 'f189bdf5ed4647996e796fdb3212e368317039a3be94773023aa10098dcffeeb'
$checksum64 = '1368ccef7d5e936ca52ff90482c4f24dba3c46988f3a165006a99b2a302b4693'
$checksumType = 'sha256'
$validExitCodes = @(0)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -Checksum "$checksum" -ChecksumType "$checksumType" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType" -validExitCodes $validExitCodes
