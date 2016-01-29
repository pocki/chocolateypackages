$packageName = 'pdf24'
$installerType = 'MSI'
$url = 'http://stx.pdf24.org/products/pdf-creator/download/pdf24-creator-7.6.1.msi'
$checksum = 'eebb6473c452f56131b63c9f53b9b786604477a8';
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