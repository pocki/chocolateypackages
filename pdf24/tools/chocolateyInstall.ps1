$packageName = 'pdf24'
$installerType = 'MSI'
$url = 'https://stx.pdf24.org/products/pdf-creator/download/pdf24-creator-8.7.0.msi'
$checksum = 'fd6b3c0908b7d8a6903c3566b5240ea87104bfd1914e03b7b9be1b2eb33f0988';
$checksumType = 'sha256';
$silentArgs = 'DESKTOPICONS=No FAXPRINTER=No /qn';
$validExitCodes = @(0,3010)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes -checksum $checksum -checksumType $checksumType
