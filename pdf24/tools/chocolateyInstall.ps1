$packageName = 'pdf24'
$installerType = 'MSI'
$url = 'http://stx.pdf24.org/products/pdf-creator/download/pdf24-creator-7.8.0.msi'
$checksum = '684169ab37bfe15833b8122fa9796c0928c4a2fa';
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