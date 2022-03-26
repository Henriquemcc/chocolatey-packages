import-module au

$releases = 'https://github.com/adoptium/temurin8-binaries/releases/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    # Generic Url
    $url   = $download_page.links | Where-Object href -match '.msi$'

    $url32 = $url.Where{$_.href.Contains('x86-32')}[0].href
    $url64 = $url.Where{$_.href.Contains('x64')}[0].href

    $version = (Split-Path ( Split-Path $url32 ) -Leaf)
    $left = $version.IndexOf("u") + 1
    $version = $version.Substring($left)
    $version = $version.Replace("-b", ".")

    @{
        URL32   = 'https://github.com' + $url32
        URL64   = 'https://github.com' + $url64
        Version = $version
    }
}

update