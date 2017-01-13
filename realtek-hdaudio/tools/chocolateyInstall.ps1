$packageName = 'realtek-hdaudio'
$version = 'R281'
$installerType = 'exe'
$url = "http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/pc/audio/0008-32bit_Win7_Win8_Win81_Win10_$version.exe"
$url64 = "http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/pc/audio/0008-64bit_Win7_Win8_Win81_Win10_$version.exe"
$silentArgs = '/S /norestart'
$validExitCodes = @(0,3010);  # http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx


Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -Url "$url" `
                          -Url64bit "$url64" `
                          -SilentArgs "$silentArgs" `
                          -ValidExitCodes $validExitCodes
