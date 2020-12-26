# SET PARAMS & VARS #
#####################

param (

    [string]$rootDir = "C:\Data\mlb\Retrosheet",
    [string]$repoDir = "C:\Users\jonat\source\repos\Retrosheet",
    [string]$procFileDir = "Z:\mlb\Retrosheet"

)


### TO DO ###
# All-star and playoff data -> .EVE files?
# Include downloads of static data in automated script -> ParkMaster, PlayerMaster, TeamMaster, FranchiseMaster


try {

    Add-Type -AssemblyName System.IO.Compression.FileSystem


    $startTime = (Get-Date)
    Write-Host "||MSG" $startTime "|| STARTING DOWNLOAD AND PROCESSING"


    $today = (Get-Date)
    $dataDir = "$($rootdir)\data\run"
    $extractDir = "$($rootdir)\data\extracts"
    $outDir = "$($procFileDir)\data\processed\$($today.Year)-$($today.Month)-$($today.Day)@$($today.Hour).$($today.Minute).$($today.Second)"
    $downloadsDir = "$($rootdir)\data\downloads"
    # $logsDir = "$($rootdir)\logs"

    $rootUriEvents = "https://www.retrosheet.org/events/"
    $URIRosters = "https://www.retrosheet.org/"
    # $eventFilesRegSeason = @("1910seve.zip","1920seve.zip","1930seve.zip","1940seve.zip","1950seve.zip","1960seve.zip","1970seve.zip","1980seve.zip","1990seve.zip","2000seve.zip","2010seve.zip","2020seve.zip")
    # $boxFilesRegSeason = @("1900sbox.zip","1910sbox.zip","1920sbox.zip","1930sbox.zip","1940sbox.zip", "1950sbox.zip")
    # $eventFilesAllStar = @("allas.zip")
    # $eventFilesPostSeason = @("allpost.zip")
    # $discrepancyFiles = @("1900sdis.zip","1910sdis.zip","1920sdis.zip","1930sdis.zip","1940sdis.zip","1950sdis.zip","1960sdis.zip","1970sdis.zip")
    # $zips = $eventFilesRegSeason += $boxFilesRegSeason += $eventFilesAllStar += $eventFilesPostSeason += $discrepancyFiles += $rosterFiles
    $zipsRoster = @("Rosters.zip")

    ### REDUCE DATA VOLUME FOR DEBUGGING ###
    ### \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ ###
    $zips = @("2020seve.zip")
    




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

            Remove-Item -Path $outDir -Recurse -Force

        }

        $metadataDir = "$($rootDir)\data\metadata"
        if(!(Test-Path $metadataDir)) {

            New-Item -Path $metadataDir -ItemType directory

        }
        else {

            Remove-Item -Path $metadataDir -Recurse -Force
            New-Item -Path $metadataDir -ItemType directory

        }

        $supplementalDir = "$($rootDir)\data\supplemental"
        if(!(Test-Path $supplementalDir)) {

            New-Item -Path $supplementalDir -ItemType directory

        }
        else {

            Remove-Item -Path $supplementalDir -Recurse -Force
            New-Item -Path $supplementalDir -ItemType directory

        }

    }
    catch {

        $errMessage = $_.Exception.Message

        Write-Host "||ERR" $(Get-Date) "|| $errMessage"

    }




    # COPY STATIC DATA FROM REPO #
    ##############################

    try {

        $staticDataRoot = "$($repoDir)\Data"
        $staticDataDest = "$($rootDir)\data"

        Get-ChildItem $staticDataRoot |
        ForEach-Object {

            $staticDataDir = "$($staticDataRoot)\$($_)"
            $staticDataDirName = $_

            Get-ChildItem $staticDataDir |
            ForEach-Object {
                $source = "$($staticDataDir)\$($_)"
                $dest = "$($staticDataDest)\$($staticDataDirName)\$($_)"
                Copy-Item -Path $source -Destination $dest -Recurse -Force
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

        Write-Host "||MSG" $(Get-Date) "|| DOWNLOADING AND EXTRACTING EVENT DATA TO $extractDir"

        # Dowload and extract to $dataDir
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

                Get-ChildItem $extractPath |
                ForEach-Object {

                    Copy-Item -Path "$($extractPath)\$($_)" -Destination $dataDir -Recurse -Force

                }

                $unzip.Dispose()

            }
            catch {

                $errMessage = $_.Exception.Message

                Write-Host "||MSG" $(Get-Date) "|| $errMessage"

            }

        }

    }
    catch {

        $errMessage = $_.Exception.Message

        Write-Host "||MSG" $(Get-Date) "|| $errMessage"

    }


    try {

        Write-Host "||MSG" $(Get-Date) "|| DOWNLOADING AND EXTRACTING ROSTER DATA TO $extractDir"

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

                Get-ChildItem $extractPath |
                ForEach-Object {

                    Copy-Item -Path "$($extractPath)\$($_)" -Destination $dataDir -Recurse -Force

                }

                $unzip.Dispose()

            }
            catch {

                $errMessage = $_.Exception.Message

                Write-Host "||MSG" $(Get-Date) "|| $errMessage"

            }

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

        # Process .EVA/.EVE/.EVN files
        $outDirEvent = "$($dataDir)\event"
        $outDirGame = "$($dataDir)\game"

        New-Item -Path $outDirEvent -ItemType directory
        New-Item -Path $outDirGame -ItemType directory

        Get-ChildItem $dataDir\* -Include *.EVA, *.EVE, *.EVN |
        Foreach-Object {

            $fileName = $_.BaseName
            $fileExt = $_.Extension
            $year = $fileName -replace "\D+", ""
            $outFileEvent = $outDirEvent + "\event_" + $fileName + $fileExt + ".csv"
            $outFileGame = $outDirGame + "\game_" + $fileName + $fileExt + ".csv"

            $cmd_event = "bevent -f 0-96 -y $year -s 0101 -e 1231 $_ > $outFileEvent"
            $cmd_game = "bgame -y $year -s 0101 -e 1231 $_ > $outFileGame"

            Invoke-Expression $cmd_event
            Invoke-Expression $cmd_game

        }

        New-Item "$($outDir)\event" -ItemType directory
        New-Item "$($outDir)\game" -ItemType directory

        Copy-Item -Path $outDirEvent\* -Destination "$($outDir)\event"
        Copy-Item -Path $outDirGame\* -Destination "$($outDir)\game"

    }
    catch  {

        $errMessage = $_.Exception.Message
        Write-Host "||ERR" $(Get-Date) "|| $errMessage"

    }

    $endTime = (Get-Date)
    $runTimeH = ($endTime - $startTime).Hours
    $runTimeM = ($endTime - $startTime).Minutes
    $runTimeS = ($endTime - $startTime).Seconds
    $runTimeMS = ($endTime - $startTime).Milliseconds
    Write-Host "||MSG" $endTime "|| DOWNLOAD AND PROCESSING COMPLETED"
    Write-Host "||MSG" $endTime "|| RUNTIME: $($runTimeH):$($runTimeM):$($runTimeS).$($runTimeMS)"

}
catch {

    $errMessage = $_.Exception.Message
    Write-Host "||ERR" $(Get-Date) "|| $errMessage"
    Write-Host "||ERR" $(Get-Date) "|| DOWNLOAD AND PROCESSING COMPLETED WITH ERRORS"

    try {

        Write-Host "||MSG" $(Get-Date) "|| CLEANING UP"

        Get-ChildItem $dataDir |
        ForEach-Object {
            Remove-Item "$($dataDir)\$($_)" -Recurse -Force
        }

        Remove-Item $downloadsDir -Recurse -Force
        Remove-Item $extractDir -Recurse -Force

    }
    catch {

        $errMessage = $_.Exception.Message
        Write-Host "||ERR" $(Get-Date) "|| $errMessage"
        Write-Host "||MSG" $endTime "|| RUNTIME: $($runTimeH):$($runTimeM):$($runTimeS).$($runTimeMS)"
        exit 1

    }

    Write-Host "||MSG" $endTime "|| RUNTIME: $($runTimeH):$($runTimeM):$($runTimeS).$($runTimeMS)"
    exit 1

}

