# SET PARAMS & VARS #
#####################

param (

    [string]$rootDir = "C:\Data\mlb\Retrosheet",
    [string]$repoDir = "C:\Users\jonat\source\repos\Retrosheet",
    [string]$procFileDir = "Z:\mlb\Retrosheet"

)


### TO DO ###
# Include downloads of static data in automated script -> ParkMaster, PlayerMaster, TeamMaster, FranchiseMaster


try {

    $startTime = (Get-Date)
    Write-Host "||MSG" $startTime "|| STARTING RAW DATA PROCESSING"


    $today = (Get-Date)
    $dataDir = "$($rootdir)\data\run"
    $extractDir = "$($rootdir)\data\extracts"
    $outDir = "$($procFileDir)\data\processed\$($today.Year)-$($today.Month)-$($today.Day)@$($today.Hour).$($today.Minute).$($today.Second)"
    $downloadsDir = "$($rootdir)\data\downloads"





    # FILESYSTEM SETUP AND ARCHIVE PREVIOUSLY DOWNLOADED DATA #
    ###########################################################

    try {

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

        Write-Host "||MSG" $(Get-Date) "|| COPYING STATIC DATA FROM LOCAL GIT REPO"

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




    # PROCESS NEWLY DOWNLOADED FILES #
    ##################################

    try {

        Write-Host "||MSG" $(Get-Date) "|| COPYING EXTRACTED DATA TO $dataDir"

        Get-ChildItem $extractDir |
        ForEach-Object {

            $folder = $_

            Get-ChildItem "$($extractDir)\$($_)" |
            ForEach-Object {

                Copy-Item -Path "$($extractDir)\$($folder)\$($_)" -Destination $dataDir -Recurse -Force

            }

        }

        Write-Host "||MSG" $(Get-Date) "|| PROCESSING .EVA/.EVE/.EVN FILES"

        # Process .EVA/.EVE/.EVN files
        $outDirEvent = "$($dataDir)\event"
        $outDirGame = "$($dataDir)\game"

        New-Item -Path $outDirEvent -ItemType directory
        New-Item -Path $outDirGame -ItemType directory

        Get-ChildItem $dataDir\* -Include *.EVA, *.EVE, *.EVN |
        Foreach-Object {

            $fileName = $_.BaseName
            $fileExt = $_.Extension
            $year = $fileName.Substring(0,4)

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
    Write-Host "||ERR" $(Get-Date) "|| PROCESSING COMPLETED WITH ERRORS"
    Write-Host "||MSG" $endTime "|| RUNTIME: $($runTimeH):$($runTimeM):$($runTimeS).$($runTimeMS)"
    exit 1

}

