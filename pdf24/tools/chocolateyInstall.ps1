$packageName = 'pdf24'
$installerType = 'MSI'
$url = 'http://stx.pdf24.org/products/pdf-creator/download/pdf24-creator-8.4.1.msi'
$checksum = '56b46fd0bd23d6373652609ca03448afb564cbcbcd5e5a3c3ac4e83a975788e2';
$checksumType = 'sha256';
$silentArgs = 'DESKTOPICONS=No FAXPRINTER=No /qn';
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes -checksum $checksum -checksumType $checksumType
