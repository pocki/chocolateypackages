 Function IsInstalled {
    $ver = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full').Release
    return (!($ver -eq $null) -and ($ver -ge 379893))
}

if (IsInstalled) {
    Write-Host "Microsoft .NET Framework 4.5.2 or later is already installed"
}
else {
    $packageName = 'DotNet452'
    $installerType = 'exe'
    $Url = 'http://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe'
    $silentArgs = "/Passive /NoRestart /Log ""$env:temp\net452.log"""
    $validExitCodes = @(
        0, # success
        3010 # success, restart required
    )
 
    Install-ChocolateyPackage $packageName $installerType $silentArgs $Url -validExitCodes $validExitCodes
 
    if (-Not (IsInstalled)) {
        Write-Host "A restart is required to finalise the Microsoft .NET Framework 4.5.2 installation"
    }
}