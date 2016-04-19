$packageName = 'vcredist2015'
$installerType = 'exe'
$url = 'http://download.microsoft.com/download/f/3/9/f39b30ec-f8ef-4ba3-8cb4-e301fcf0e0aa/vc_redist.x86.exe'
$checksum = '7cfea915a9da0fc76eb583d2913f0cb8352ad906'
$checksumType = 'sha1'
$url64 = 'http://download.microsoft.com/download/4/c/b/4cbd5757-0dd4-43a7-bac0-2a492cedbacb/vc_redist.x64.exe'
$checksum64 = '05d912fd411e895e0376e10f0c20519200345f14'
$checksumType64 = 'sha1'
$silentArgs = '/Q /norestart'
$validExitCodes = @(0,3010)

$osVersion = (Get-WmiObject Win32_OperatingSystem).Version
if(($osVersion -ge [version]"6.3.9600") -AND ($osVersion -lt [version]"6.4")) {
  $hotfix = Get-HotFix | where hotfixID -eq KB2919355
  if($hotfix -eq $null) {
    throw "$packageName need Update KB2919355 installed first."
    return;
  }
}

Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -Url "$url" `
                          -Url64bit "$url64" `
                          -SilentArgs "$silentArgs" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType" `
                          -Checksum64 "$checksum64" `
                          -ChecksumType64 "$checksumType64"

if (Get-ProcessorBits 64) {
	Write-Verbose "Install also 32bit version on 64bit operation system."
  Install-ChocolateyPackage -PackageName "${packageName}_x86" `
                            -FileType "$installerType" `
                            -Url "$url" `
                            -SilentArgs "$silentArgs" `
                            -ValidExitCodes $validExitCodes `
                            -Checksum "$checksum" `
                            -ChecksumType "$checksumType"
}