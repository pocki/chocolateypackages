$packageName = 'pdf24'
$installerType = 'MSI'
$url = 'http://stx.pdf24.org/products/pdf-creator/download/pdf24-creator-7.6.4.msi'
$checksum = 'fe6a1fda5c75c1c4f2f153738ad2e84e530087b2';
$checksumType = 'sha1';
$silentArgs = 'DESKTOPICONS=No FAXPRINTER=No /qn' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" 
$validExitCodes = @(0)

if((Get-WmiObject Win32_OperatingSystem).ProductType -ne 1) {
	throw "$packageName not supported on Windows Server.";
	return;
}
else {
	Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes -checksum $checksum -checksumType $checksumType
}