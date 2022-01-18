$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. $toolsDir\helpers.ps1

$pp = Get-PackageParameters
$silentArgs = "/qn", "/norestart", "/l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"", (Get-InstallComponents $pp)

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = 'https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u312-b07/OpenJDK8U-jdk_x86-32_windows_hotspot_8u312b07.msi'
  url64bit       = 'https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u302-b08.1/OpenJDK8U-jdk_x64_windows_hotspot_8u302b08.msi'
  softwareName   = 'Eclipse Temurin JDK with Hotspot 8u*'
  checksum       = 'bd19ec2d8194477fd5b473e4dc9244e800e7cbbec03883481b0db49e1eac520b'
  checksumType   = 'sha256'
  checksum64     = 'fe3546a8e8dd7d4e929028ef3794431748caddf7fc1cf481618e8d6f8aa15427'
  checksumType64 = 'sha256'
  silentArgs     = $silentArgs
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
