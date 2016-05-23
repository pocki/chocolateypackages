$packageName = 'pdf24'
$installerType = 'MSI'
$url = 'http://stx.pdf24.org/products/pdf-creator/download/pdf24-creator-7.8.1.msi'
$checksum = '9c827cd17889e7e7cd97428a241d5748d4e88ebf';
$checksumType = 'sha1';
$silentArgs = 'DESKTOPICONS=No FAXPRINTER=No /qn';
$validExitCodes = @(0)

if((Get-WmiObject Win32_OperatingSystem).ProductType -ne 1) {
	throw "$packageName not supported on Windows Server.";
	return;
}
else {
	Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes -checksum $checksum -checksumType $checksumType
}