$packageName = 'pdf24'
$installerType = 'MSI'
$url = 'https://stx.pdf24.org/products/pdf-creator/download/pdf24-creator-8.6.1.msi'
$checksum = '008c1441d1ffcb57636107fd8aa660c79b1e14044988593c64808d121db18b16';
$checksumType = 'sha256';
$silentArgs = 'DESKTOPICONS=No FAXPRINTER=No /qn';
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes -checksum $checksum -checksumType $checksumType
