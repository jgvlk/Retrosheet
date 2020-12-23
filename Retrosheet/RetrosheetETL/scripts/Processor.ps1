# SET PARAMS & VARS #
#####################

param (

    [string]$rootDir = "C:/Data/mlb/Retrosheet"
)


$startTime = (Get-Date)
Write-Host "||MSG" $startTime "|| STARTING DOWNLOAD AND PROCESSING"


Add-Type -AssemblyName System.IO.Compression.FileSystem


$today = (Get-Date)
$archiveDir = "$($rootdir)/data/archive/$($today.Year)-$($today.Month)-$($today.Day)@$($today.Hour)-$($today.Minute)-$($today.Second)"
$dataDir = "$($rootdir)/data/current"
$extractDir = "$($rootdir)/data/extracts"
$outDir = "$($rootdir)/data/processed"
$downloadsDir = "$($rootdir)/data/downloads"
# $logsDir = "$($rootdir)/logs"

$rootUri = "https://www.retrosheet.org/events/"
$eventFilesRegSeason = @("1910seve.zip","1920seve.zip","1930seve.zip","1940seve.zip","1950seve.zip","1960seve.zip","1970seve.zip","1980seve.zip","1990seve.zip","2000seve.zip","2010seve.zip","2020seve.zip")
$boxFilesRegSeason = @("1900sbox.zip","1910sbox.zip","1920sbox.zip","1930sbox.zip","1940sbox.zip", "1950sbox.zip")
$eventFilesAllStar = @("allas.zip")
$eventFilesPostSeason = @("allpost.zip")
$discrepancyFiles = @("1900sdis.zip","1910sdis.zip","1920sdis.zip","1930sdis.zip","1940sdis.zip","1950sdis.zip","1960sdis.zip","1970sdis.zip")
$zips = $eventFilesRegSeason += $boxFilesRegSeason += $eventFilesAllStar += $eventFilesPostSeason += $discrepancyFiles





# FILESYSTEM SETUP AND ARCHIVE PREVIOUSLY DOWNLOADED DATA #
###########################################################

try {

    # Setup directories in addition to user-created directories from user setup instructions
    # if (!(Test-Path $logsDir)) {

    #     New-Item -Path $logsDir -ItemType directory

    # }

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

    if(!(Test-Path $outDir)) {

        New-Item -Path $outDir -ItemType directory

    }
    else {

        Remove-Item -Path $outDir -ItemType directory

    }


    # Archive current data and clear $dataDir
    $currentFileCount = (Get-ChildItem $dataDir).Length

    if ($currentFileCount -gt 0) {

        New-Item -Path $archiveDir -ItemType directory

        Get-ChildItem $dataDir |
        ForEach-Object {

            Copy-Item -Path "$($dataDir)/$($_)" -Destination $archiveDir
            Remove-Item -Path "$($dataDir)/$($_)" -Recurse -Force

        }

    }

}
catch {

    $errMessage = $_.Exception.Message

    Write-Host "||ERR" $(Get-Date) "|| $errMessage"

}







# DOWNLOAD AND EXTRACT RAW DATA #
#################################

try {

    Write-Host "||MSG" $(Get-Date) "|| DOWNLOADING AND EXTRACTING DATA TO $extractDir"

    # Dowload and extract to $dataDir
    foreach ($zip in $zips) {

        try {
    
            $Uri = "$($rootUri)$($zip)"
            $outFile = "$($downloadsDir)/$(Split-Path -Path $Uri -Leaf)"
            Invoke-WebRequest -Uri $Uri -OutFile $outfile
    
        }
        catch {
    
            $errMessage = $_.Exception.Message
            Write-Host "||MSG" $(Get-Date) "|| $errMessage"    
    
        }
    
        try {
    
            $zipOutDir = [IO.Path]::GetFileNameWithoutExtension($zip)
            $extractPath = "$($extractDir)/$($zipOutDir)"
            New-Item -Path $extractPath -ItemType directory
    
        }
        catch {
    
            $errMessage = $_.Exception.Message
            Write-Host "||MSG" $(Get-Date) "|| $errMessage"
    
        }
    
        try {
    
            $unzip = [System.IO.Compression.ZipFile]::OpenRead("$($downloadsDir)/$($zip)")
            
            foreach ($item in $unzip.Entries) {
    
                [System.IO.Compression.ZipFileExtensions]::ExtractToFile($item, (Join-Path -Path $extractPath -ChildPath $item.FullName), $true)
    
            }
    
        }
        catch {
    
            $errMessage = $_.Exception.Message
            Write-Host "||MSG" $(Get-Date) "|| $errMessage"
            
        }
    
        Get-ChildItem $extractPath |
        ForEach-Object {
    
            Copy-Item -Path "$($extractPath)/$($_)" -Destination $dataDir -Recurse -Force
    
        }
    
        $unzip.Dispose()
    
    }
    
}
catch {

    $errMessage = $_.Exception.Message
    Write-Host "||MSG" $(Get-Date) "|| $errMessage"

}




# PROCESS NEWLY DOWNLOADED FILES #
##################################

try {

    Write-Host "||MSG" $(Get-Date) "|| PROCESSING .EVA FILES"

    # Process .EVA files
    Get-ChildItem $dataDir -Filter *.EVA | 
    Foreach-Object {

        [string]$fileName = $_.BaseName
        [string]$year = $fileName -replace "/D+", ""
        [string]$outFileEvent = $outDir + "/Event_" + $fileName + ".csv"
        [string]$outFileGame = $outDir + "/Game_" + $fileName + ".csv"

        $cmd_event = "bevent -f 0-96 -y $year -s 0101 -e 1231 $($dataDir + "/" + $_) > $outFileEvent"
        $cmd_game = "bgame -y $year -s 0101 -e 1231 $($dataDir + "/" + $_) > $outFileGame"

        Invoke-Expression $cmd_event
        Invoke-Expression $cmd_game

    }

    Write-Host "||MSG" $(Get-Date) "|| .EVA FILES PROCESSED SUCCESSFULLY AND SAVED TO $outDir"

}
catch  {

    $errMessage = $_.Exception.Message
    Write-Host "||MSG" $(Get-Date) "|| $errMessage"

}





# CLEAUP #
##########

Write-Host "||MSG" $(Get-Date) "|| CLEANING UP"

Remove-Item "$($downloadsDir)/" -Recurse -Force
Remove-Item "$($extractDir)/" -Recurse -Force


$endTime = (Get-Date)
$runTimeH = ($endTime - $startTime).Hours
$runTimeM = ($endTime - $startTime).Minutes
$runTimeS = ($endTime - $startTime).Seconds
$runTimeMS = ($endTime - $startTime).Milliseconds
Write-Host "||MSG" $endTime "|| DOWNLOAD AND PROCESSING COMPLETED SUCCESSFULLY"
Write-Host "||MSG" $endTime "|| RUNTIME: $($runTimeH):$($runTimeM):$($runTimeS).$($runTimeMS)"

