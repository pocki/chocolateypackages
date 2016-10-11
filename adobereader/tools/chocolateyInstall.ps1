$packageName = 'adobereader'
$installerType = 'EXE'
#Command Line Switches for the Bootstrap Web Installer: https://forums.adobe.com/message/3291894#3291894
$silentArgs = '/sAll /msi /norestart /quiet ALLUSERS=1 EULA_ACCEPT=YES SUPPRESS_APP_LAUNCH=YES'
$url = 'http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/1502020039/AcroRdrDC1502020039_MUI.exe'
$checksumType = 'sha256'
$checksum = '74465717921db22a256107af5effbd37d7c52d87de4d04241d1f5e1deef41a40'
$validExitCodes = @(0, 3010)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -Checksum "$checksum" -ChecksumType "$checksumType" -validExitCodes $validExitCodes
