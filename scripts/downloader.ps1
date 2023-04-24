# SET PARAMS & VARS #
#####################
param (
    [string]$rootDir
)


try {
    Add-Type -AssemblyName System.IO.Compression.FileSystem

    $startTime = (Get-Date)

    $extractDir = "$($rootdir)\extracts"
    $downloadsDir = "$($rootdir)\downloads"
    $rootUriEvents = "https://www.retrosheet.org/events/"
    $URIRosters = "https://www.retrosheet.org/"
    $eventFilesRegSeason = @("1910seve.zip","1920seve.zip","1930seve.zip","1940seve.zip","1950seve.zip","1960seve.zip","1970seve.zip","1980seve.zip","1990seve.zip","2000seve.zip","2010seve.zip","2020seve.zip")
    $boxFilesRegSeason = @("1900sbox.zip","1910sbox.zip","1920sbox.zip","1930sbox.zip","1940sbox.zip", "1950sbox.zip")
    $eventFilesAllStar = @("allas.zip")
    $eventFilesPostSeason = @("allpost.zip")
    $discrepancyFiles = @("1900sdis.zip","1910sdis.zip","1920sdis.zip","1930sdis.zip","1940sdis.zip","1950sdis.zip","1960sdis.zip","1970sdis.zip")
    $zips = $eventFilesRegSeason += $boxFilesRegSeason += $eventFilesAllStar += $eventFilesPostSeason += $discrepancyFiles
    $zipsRoster = @("Rosters.zip")


    # FILESYSTEM SETUP AND ARCHIVE PREVIOUSLY DOWNLOADED DATA #
    ###########################################################
    try {
        if (!(Test-Path $downloadsDir)) {
            New-Item -Path $downloadsDir -ItemType directory
        }
        else {
            Remove-Item -Path $downloadsDir -Recurse -Force
            New-Item -Path $downloadsDir -ItemType directory
        }
        if (!(Test-Path $extractDir)) {
            New-Item -Path $extractDir -ItemType directory
        }
        else {
            Remove-Item -Path $extractDir -Recurse -Force
            New-Item -Path $extractDir -ItemType directory
        }
    }
    catch {
        $errMessage = $_.Exception.Message
        Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
    }


    # DOWNLOAD AND EXTRACT RAW DATA #
    #################################

    try {
        # Download and extract to $dataDir
        foreach ($zip in $zips) {
            try {
                $Uri = "$($rootUriEvents)$($zip)"
                $outFile = "$($downloadsDir)\$(Split-Path -Path $Uri -Leaf)"
                Invoke-WebRequest -Uri $Uri -OutFile $outfile
                $zipOutDir = [IO.Path]::GetFileNameWithoutExtension($zip)
                $extractPath = "$($extractDir)\$($zipOutDir)"
                New-Item -Path $extractPath -ItemType directory
                $unzip = [System.IO.Compression.ZipFile]::OpenRead("$($downloadsDir)\$($zip)")
                foreach ($item in $unzip.Entries) {
                    [System.IO.Compression.ZipFileExtensions]::ExtractToFile($item, (Join-Path -Path $extractPath -ChildPath $item.FullName), $true)
                }
                $unzip.Dispose()
            }
            catch {
                $errMessage = $_.Exception.Message
                Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
            }
        }
    }
    catch {
        $errMessage = $_.Exception.Message
        Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
    }
    try {
        # Dowload and extract to $dataDir
        foreach ($zip in $zipsRoster) {
            try {
                $Uri = "$($URIRosters)$($zip)"
                $outFile = "$($downloadsDir)\$(Split-Path -Path $Uri -Leaf)"
                Invoke-WebRequest -Uri $Uri -OutFile $outfile
                $zipOutDir = [IO.Path]::GetFileNameWithoutExtension($zip)
                $extractPath = "$($extractDir)\$($zipOutDir)"
                New-Item -Path $extractPath -ItemType directory
                $unzip = [System.IO.Compression.ZipFile]::OpenRead("$($downloadsDir)\$($zip)")
                foreach ($item in $unzip.Entries) {
                    [System.IO.Compression.ZipFileExtensions]::ExtractToFile($item, (Join-Path -Path $extractPath -ChildPath $item.FullName), $true)
                }
                $unzip.Dispose()
            }
            catch {
                $errMessage = $_.Exception.Message
                Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
            }
        }
    }
    catch {
        $errMessage = $_.Exception.Message
        Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
    }
}
catch {
    $errMessage = $_.Exception.Message
    Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
    Write-Host "|| ERR" $(Get-Date) "|| DOWNLOAD COMPLETED WITH ERRORS"
    exit 1
}
