$packageName = 'pdf24'
$installerType = 'MSI'
$url = 'https://stx.pdf24.org/products/pdf-creator/download/pdf24-creator-8.6.0.msi'
$checksum = '5d36178436fc69c141af7d147c43464559a183efd95d98190d8a20bb5cc3478f';
$checksumType = 'sha256';
$silentArgs = 'DESKTOPICONS=No FAXPRINTER=No /qn';
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes -checksum $checksum -checksumType $checksumType
