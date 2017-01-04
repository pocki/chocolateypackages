$packageName = 'logitechgaming'
$installerType = 'EXE'
$url = "https://www.logitech.com/pub/techsupport/gaming/LGS_8.90.117_x86_Logitech.exe"
$url64 = "https://www.logitech.com/pub/techsupport/gaming/LGS_8.90.117_x64_Logitech.exe"
$silentArgs = '/S'
$checksum = '4914e508f182714504b7683462b1be8328c0a123bd0998a668f5fb7fd9942d35'
$checksum64 = '1039b00c8af3059301832add78963414fba359a606b3677533122059e30a3467'
$checksumType = 'sha256'
$validExitCodes = @(0)
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64" -Checksum "$checksum" -ChecksumType "$checksumType" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType" -validExitCodes $validExitCodes