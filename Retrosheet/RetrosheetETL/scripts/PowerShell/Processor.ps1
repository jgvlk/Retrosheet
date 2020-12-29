# SET PARAMS & VARS #
#####################

param (

    [string]$rootDir = "C:\Data\mlb\Retrosheet",
    [string]$repoDir = "C:\Users\jonat\source\repos\Retrosheet",
    [string]$procFileDir = "Z:\mlb\Retrosheet"

)


$startTime = (Get-Date)
Write-Host "||MSG" $startTime "|| STARTING RAW DATA PROCESSING"


$today = (Get-Date)
$dataDir = "$($rootdir)\data\run"
$extractDir = "$($rootdir)\data\extracts"
$outDir = "$($procFileDir)\data\processed\$($today.Year)-$($today.Month)-$($today.Day)@$($today.Hour).$($today.Minute).$($today.Second)"


try {

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

    # COPY EXTRACTED ROSTER DATA #
    try {

        Write-Host "||MSG" $(Get-Date) "|| COPYING EXTRACTED ROSTER DATA TO $dataDir"

        Get-ChildItem $extractDir -Filter 'Rosters' |
        ForEach-Object {

            $folder = $_

            Get-ChildItem "$($extractDir)\$($folder)" |
            ForEach-Object {

                Copy-Item -Path "$($extractDir)\$($folder)\$($_)" -Destination $dataDir -Recurse -Force

            }

        }

    }
    catch {

        $errMessage = $_.Exception.Message

        Write-Host "||ERR" $(Get-Date) "|| $errMessage"

    }


    # REGULAR SEASON #
    try {

        Write-Host "||MSG" $(Get-Date) "|| COPYING EXTRACTED REGULAR SEASON DATA TO $dataDir"

        Get-ChildItem $extractDir -Exclude 'allas', 'allpost' |
        ForEach-Object {

            Get-ChildItem $_\* -Exclude *.ROS |
            ForEach-Object {

                Copy-Item -Path $_ -Destination $dataDir -Recurse -Force

            }

        }

        Write-Host "||MSG" $(Get-Date) "|| PROCESSING REGULAR SEASON .EVA/.EVE/.EVN FILES"

        # Process .EVA/.EVE/.EVN files
        $outDirEventReg = "$($dataDir)\event\reg"
        $outDirGameReg = "$($dataDir)\game\reg"

        New-Item -Path $outDirEventReg -ItemType directory
        New-Item -Path $outDirGameReg -ItemType directory

        Get-ChildItem $dataDir\* -Include *.EVA, *.EVE, *.EVN |
        Foreach-Object {

            $fileName = $_.BaseName
            $fileExt = $_.Extension
            $year = $fileName.Substring(0,4)

            $outFileEventReg = $outDirEventReg + "\event_" + $fileName + $fileExt + ".csv"
            $outFileGameReg = $outDirGameReg + "\game_" + $fileName + $fileExt + ".csv"

            $cmd_event = "bevent -f 0-96 -y $year -s 0101 -e 1231 $_ > $outFileEventReg"
            $cmd_game = "bgame -y $year -s 0101 -e 1231 $_ > $outFileGameReg"

            Invoke-Expression $cmd_event
            Invoke-Expression $cmd_game

        }

        New-Item "$($outDir)\event\reg" -ItemType directory
        New-Item "$($outDir)\game\reg" -ItemType directory

        Copy-Item -Path $outDirEventReg\* -Destination "$($outDir)\event\reg"
        Copy-Item -Path $outDirGameReg\* -Destination "$($outDir)\game\reg"

        Get-ChildItem $dataDir\* -Exclude *.ROS, 'event', 'game' |
        Foreach-Object {

            Remove-Item -Path $_ -Recurse -Force

        }

    }
    catch  {

        $errMessage = $_.Exception.Message

        Write-Host "||ERR" $(Get-Date) "|| $errMessage"

    }


    # POSTSEASON #
    try {

        Write-Host "||MSG" $(Get-Date) "|| COPYING EXTRACTED POSTSEASON DATA TO $dataDir"

        Get-ChildItem $extractDir -Filter 'allpost' |
        ForEach-Object {

            # $folder = $_


            Get-ChildItem "$($extractDir)\$($_)" -Exclude *.ROS |
            ForEach-Object {

                Copy-Item -Path $_ -Destination $dataDir -Recurse -Force

            }

        }

        Write-Host "||MSG" $(Get-Date) "|| PROCESSING POSTSEASON .EVA/.EVE/.EVN FILES"

        # Process .EVA/.EVE/.EVN files
        $outDirEventPost = "$($dataDir)\event\post"
        $outDirGamePost = "$($dataDir)\game\post"

        New-Item -Path $outDirEventPost -ItemType directory
        New-Item -Path $outDirGamePost -ItemType directory

        Get-ChildItem $dataDir\* -Include *.EVA, *.EVE, *.EVN |
        Foreach-Object {

            $fileName = $_.BaseName
            $fileExt = $_.Extension
            $year = $fileName.Substring(0,4)

            $outFileEventPost = $outDirEventPost + "\event_" + $fileName + $fileExt + ".csv"
            $outFileGamePost = $outDirGamePost + "\game_" + $fileName + $fileExt + ".csv"

            $cmd_event = "bevent -f 0-96 -y $year -s 0101 -e 1231 $_ > $outFileEventPost"
            $cmd_game = "bgame -y $year -s 0101 -e 1231 $_ > $outFileGamePost"

            Invoke-Expression $cmd_event
            Invoke-Expression $cmd_game

        }

        New-Item "$($outDir)\event\post" -ItemType directory
        New-Item "$($outDir)\game\post" -ItemType directory

        Copy-Item -Path $outDirEventPost\* -Destination "$($outDir)\event\post"
        Copy-Item -Path $outDirGamePost\* -Destination "$($outDir)\game\post"

        Get-ChildItem $dataDir\* -Exclude *.ROS, 'event', 'game' |
        Foreach-Object {

            Remove-Item -Path $_ -Recurse -Force

        }

    }
    catch  {

        $errMessage = $_.Exception.Message

        Write-Host "||ERR" $(Get-Date) "|| $errMessage"

    }


    # ALL-STAR #
    try {

        Write-Host "||MSG" $(Get-Date) "|| COPYING EXTRACTED ALL-STAR DATA TO $dataDir"

        Get-ChildItem $extractDir -Filter "allas" |
        ForEach-Object {

            Get-ChildItem "$($extractDir)\$($_)" -Exclude *.ROS |
            ForEach-Object {

                Copy-Item -Path $_ -Destination $dataDir -Recurse -Force

            }

        }

        Write-Host "||MSG" $(Get-Date) "|| PROCESSING ALL-STAR .EVA/.EVE/.EVN FILES"

        # Process .EVA/.EVE/.EVN files
        $outDirEventAS = "$($dataDir)\event\as"
        $outDirGameAS = "$($dataDir)\game\as"

        New-Item -Path $outDirEventAS -ItemType directory
        New-Item -Path $outDirGameAS -ItemType directory

        Get-ChildItem $dataDir\* -Include *.EVA, *.EVE, *.EVN |
        Foreach-Object {

            $fileName = $_.BaseName
            $fileExt = $_.Extension
            $year = $fileName.Substring(0,4)

            $outFileEventAS = $outDirEventAS + "\event_" + $fileName + $fileExt + ".csv"
            $outFileGameAS = $outDirGameAS + "\game_" + $fileName + $fileExt + ".csv"

            $cmd_event = "bevent -f 0-96 -y $year -s 0101 -e 1231 $_ > $outFileEventAS"
            $cmd_game = "bgame -y $year -s 0101 -e 1231 $_ > $outFileGameAS"

            Invoke-Expression $cmd_event
            Invoke-Expression $cmd_game

        }

        New-Item "$($outDir)\event\as" -ItemType directory
        New-Item "$($outDir)\game\as" -ItemType directory

        Copy-Item -Path $outDirEventAS\* -Destination "$($outDir)\event\as"
        Copy-Item -Path $outDirGameAS\* -Destination "$($outDir)\game\as"

        Get-ChildItem $dataDir\* -Exclude 'event', 'game' |
        Foreach-Object {

            Remove-Item -Path $_ -Recurse -Force

        }

    }
    catch  {

        $errMessage = $_.Exception.Message

        Write-Host "||ERR" $(Get-Date) "|| $errMessage"

    }


    Write-Host "||MSG" $endTime "|| WRITING DATA TO MASTER .csv FILES TO PREP FOR LOAD TO [Retrosheet] DB"

    Invoke-Command -ScriptBlock {C:\ProgramData\Miniconda3\envs\py38-mldev\python.exe C:\Users\jonat\source\repos\Retrosheet\Retrosheet\RetrosheetETL\scripts\Python\Loader.py}


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

