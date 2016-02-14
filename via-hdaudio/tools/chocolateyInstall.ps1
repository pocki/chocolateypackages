$packageName = 'via-hdaudio';
$version = 'v11_1100e';
$fileType = 'exe';
$silentArgs = '-s -noreboot';

$WindowsVersion = (Get-WmiObject -Class Win32_OperatingSystem).Caption
if ( $WindowsVersion -match 'Windows 10' ) {
	$url = "https://d34vhvz8ul1ifj.cloudfront.net/Driver/VIA_HD_Aud_v11_1100e_01282016.zip"
}
else {
	$url = "https://d34vhvz8ul1ifj.cloudfront.net/Driver/v10_1200a.zip"
}

$unpackDir = "${ENV:TEMP}\via-hdaudio"
New-Item "$unpackDir" -ItemType Directory -Force
$unpackFile = "$unpackDir\via-hdaudio.zip"
Get-ChocolateyWebFile $packageName $unpackFile $url
Get-ChocolateyUnzip $unpackFile $unpackDir
$file = "$unpackDir\VIAHDAud_v11_1100e_01282016\setup.exe"
Install-ChocolateyInstallPackage $packageName $fileType $silentArgs $file 
Remove-Item $unpackDir -Recurse -Force
