$packageName = 'vcredist2015'
$installerType = 'exe'
$url = 'http://download.microsoft.com/download/9/a/2/9a2a7e36-a8af-46c0-8a78-a5eb111eefe2/vc_redist.x86.exe'
$checksum = '89f20df555625e1796a60bba0fbd2f6bbc627370'
$checksumType = 'sha1'
$url64 = 'http://download.microsoft.com/download/2/a/2/2a2ef9ab-1b4b-49f0-9131-d33f79544e70/vc_redist.x64.exe'
$checksum64 = 'cd2fce1bf61637b2536b66ee52a9662473bbdc82'
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
  Install-ChocolateyPackage -PackageName "$packageName" `
                            -FileType "$installerType" `
                            -Url "$url" `
                            -SilentArgs "$silentArgs" `
                            -ValidExitCodes $validExitCodes `
                            -Checksum "$checksum" `
                            -ChecksumType "$checksumType"
}