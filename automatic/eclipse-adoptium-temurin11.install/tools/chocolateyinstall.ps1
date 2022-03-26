$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. $toolsDir\helpers.ps1

$pp = Get-PackageParameters
$silentArgs = "/qn", "/norestart", "/l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"", (Get-InstallComponents $pp)

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.13%2B8/OpenJDK11U-jdk_x86-32_windows_hotspot_11.0.13_8.msi'
  url64bit       = 'https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.13%2B8/OpenJDK11U-jdk_x64_windows_hotspot_11.0.13_8.msi'
  softwareName   = 'Eclipse Temurin JDK with Hotspot 11*'
  checksum       = '52c3de8eb38cd559091bc07d264a27e6ba28df0067443e30c15511fe4ae70679'
  checksumType   = 'sha256'
  checksum64     = 'b0edea638fd58c94d80abffd10bbb27731bf6fe1e2b3a9214fb68ab18237deed'
  checksumType64 = 'sha256'
  silentArgs     = $silentArgs
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
