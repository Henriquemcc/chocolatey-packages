# Getting project root folder
$projectRootFolder = [System.IO.DirectoryInfo]::new((Get-Location))

# Getting source folder
$sourceFolder = $projectRootFolder

# Getting all sourceFiles inside source folder
$sourceFiles = Get-ChildItem -Path $sourceFolder -Recurse -File

# Getting all files which its' name ends with '.nuspec'
$nuspecFiles = $sourceFiles.Where{$_.FullName.EndsWith(".nuspec")}

# Getting out folder
$outFolder = [System.IO.Path]::Combine($projectRootFolder, "out")

# Creating out folder if it does not exist.
if (-not (Test-Path -Path $outFolder)) {
    New-Item -Path $outFolder -ItemType Directory
}

# Moving to out folder
Set-Location -Path $outFolder

# Creating tools dir if not exits and packing each nuspec file
foreach ($nuspecFile in $nuspecFiles) {

    # Creating tools dir
    $toolsDir = [System.IO.Path]::Combine([System.IO.Directory]::GetParent($nuspecFile.FullName).FullName, "tools")
    if (-not (Test-Path -Path $toolsDir -PathType Container)) {
        New-Item -Path $toolsDir -ItemType Directory
    }
    
    # Packing
    Invoke-Expression -Command "choco pack $($nuspecFile.FullName)"
}

# Going back to project root folder
Set-Location -Path $projectRootFolder
