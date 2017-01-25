$packageName = 'nvidianotebook'
$version = '378.49'
$fileType = 'exe'
$silentArgs = '-s -noreboot -nogfexp /passive /nosplash /noeula'
$unpackDir = New-Item "${ENV:TEMP}\nvidiadriver" -ItemType Directory -Force
$unpackFile = Join-Path "$unpackDir" "nvidiadriver.zip"
$file = Join-Path "$unpackDir" "setup.exe"

$osVersion = (Get-WmiObject Win32_OperatingSystem).Version
if($osVersion -ge [version]"10.0.10240.0") {
	$url = "https://de.download.nvidia.com/Windows/$version/$version-notebook-win10-32bit-international-whql.exe"
	$url64 = "https://de.download.nvidia.com/Windows/$version/$version-notebook-win10-64bit-international-whql.exe"
} else {
	$url = "https://de.download.nvidia.com/Windows/$version/$version-notebook-win8-win7-winvista-32bit-international-whql.exe"
	$url64 = "https://de.download.nvidia.com/Windows/$version/$version-notebook-win8-win7-winvista-64bit-international-whql.exe"
}

Get-ChocolateyWebFile $packageName $unpackFile $url $url64
Get-ChocolateyUnzip $unpackFile $unpackDir
Remove-Item $unpackDir\Update.Core -Recurse -Force
Remove-Item $unpackDir\Display.Update -Recurse -Force
Remove-Item $unpackDir\ShadowPlay -Recurse -Force
Remove-Item $unpackDir\GFExperience -Recurse -Force
Remove-Item $unpackDir\GFExperience.NvStreamSrv -Recurse -Force
Remove-Item $unpackDir\GfExperienceService -Recurse -Force
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
Remove-Item $unpackDir -Recurse -Force
