$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. $toolsDir\helpers.ps1

$pp = Get-PackageParameters
$silentArgs = "/qn", "/norestart", "/l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"", (Get-InstallComponents $pp)

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17%2B35/OpenJDK17-jdk_x86-32_windows_hotspot_17_35.msi'
  url64bit       = 'https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17%2B35/OpenJDK17-jdk_x64_windows_hotspot_17_35.msi'
  softwareName   = 'Eclipse Temurin JDK with Hotspot 17*'
  checksum       = '3a88572a0f0f48b754890383f500ba6e932215d973ac3fe2610e68edd09722a2'
  checksumType   = 'sha256'
  checksum64     = '4a0350a9e3e0cf3bba9a57890bb0b223b7c47883169730f122100fc31d61d486'
  checksumType64 = 'sha256'
  silentArgs     = $silentArgs
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
