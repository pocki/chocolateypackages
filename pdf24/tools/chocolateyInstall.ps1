$packageName = 'pdf24'
$installerType = 'MSI'
$url = 'https://stx.pdf24.org/products/pdf-creator/download/pdf24-creator-8.4.2.msi'
$checksum = 'acd488242459caf5f9f354e5d60a3f6095d470de7bdd911edeca7de752a2be0a';
$checksumType = 'sha256';
$silentArgs = 'DESKTOPICONS=No FAXPRINTER=No /qn';
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes -checksum $checksum -checksumType $checksumType
