import-module au

$releases = 'https://www.python.org/downloads/windows/'

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

    $url64 = $download_page.Links.Where{
        $_.href.EndsWith("amd64.exe")
    }[0].href

    $url32 = $download_page.Links.Where{
        $_.href.EndsWith("exe") -and ( -not $_.href.Contains("amd64"))
    }[0].href

    $version = (Split-Path -Path ($url64) -Leaf)
    $version = $version.Replace("-amd64.exe", "")
    $version = $version.Replace("python-", "")

    @{
        URL32   = $url32
        URL64   = $url64
        Version = $version
    }
}

update