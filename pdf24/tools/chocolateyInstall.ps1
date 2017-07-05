$packageName = 'pdf24'
$installerType = 'MSI'
$url = 'http://stx.pdf24.org/products/pdf-creator/download/pdf24-creator-8.2.1.msi'
$checksum = 'f48d6abb91377c91e854a5122f834b1033eea9f05a1292cf8991641d834853f1';
$checksumType = 'sha256';
$silentArgs = 'DESKTOPICONS=No FAXPRINTER=No /qn';
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes -checksum $checksum -checksumType $checksumType
