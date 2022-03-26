$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. $toolsDir\helpers.ps1

# Getting package parameters
$pp = Get-PackageParameters
$silentArgs = "/quiet $(Get-InstallComponents $pp)"

# Getting software name
$softwareName = "Python $($env:ChocolateyPackageVersion)"
if (Get-OSArchitectureWidth -eq 64) {
  $softwareName += " (64-bit)"
}
elseif (Get-OSArchitectureWidth -eq 32) {
  $softwareName += " (32-bit)"
}


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://www.python.org/ftp/python/3.10.4/python-3.10.4.exe'
  url64bit       = 'https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe'
  softwareName   = $softwareName
  checksum       = '977b91d2e0727952d5e8e4ff07eee34e'
  checksumType   = 'md5'
  checksum64     = '53fea6cfcce86fb87253364990f22109'
  checksumType64 = 'md5'
  validExitCodes = @(0, 3010, 1641)
  silentArgs     = $silentArgs
}

if ($pp.RemoveMaxPathLimitation) {
  Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1
}

Install-ChocolateyPackage @packageArgs