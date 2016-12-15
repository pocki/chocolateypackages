$packageName = 'pdf24'
$installerType = 'MSI'
$url = 'http://stx.pdf24.org/products/pdf-creator/download/pdf24-creator-8.0.3.msi'
$checksum = 'e503a7d2001da0c9b5ece6f6a55185e4a5b1b049a8d6471eb0a0b654ccab10df';
$checksumType = 'sha256';
$silentArgs = 'DESKTOPICONS=No FAXPRINTER=No /qn';
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes -checksum $checksum -checksumType $checksumType
