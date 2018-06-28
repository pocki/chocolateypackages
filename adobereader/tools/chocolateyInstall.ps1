$packageName = 'adobereader'
$installerType = 'EXE'
#Command Line Switches for the Bootstrap Web Installer: https://forums.adobe.com/message/3291894#3291894
$silentArgs = '/sAll /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES SUPPRESS_APP_LAUNCH=YES'
$url = 'ftp://ftp.adobe.com/pub/adobe/reader/win/AcrobatDC/1502320053/AcroRdrDC1502320053_de_DE.exe'
$checksumType = 'sha256'
$checksum = '8e68811071839f1f066e3760a8e8f1fee9df85168187a2961cf87c3708451419'
$validExitCodes = @(0, 3010)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -Checksum "$checksum" -ChecksumType "$checksumType" -validExitCodes $validExitCodes
