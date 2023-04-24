# SET PARAMS & VARS #
#####################
param (
    [string]$rootDir,
    [string]$logDir
)


$startTime = (Get-Date)
Write-Host "|| MSG" $startTime "|| STARTING RAW DATA PROCESSING"


$today = (Get-Date)
$dataDir = "$($rootdir)\run"
$extractDir = "$($rootdir)\extracts"
$outDir = "$($rootdir)\processed\$($today.Year)-$($today.Month)-$($today.Day)@$($today.Hour).$($today.Minute).$($today.Second)"


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
    }
    catch {
        $errMessage = $_.Exception.Message
        Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
    }


    # PROCESS NEWLY DOWNLOADED FILES #
    ##################################
    # COPY EXTRACTED ROSTER DATA #
    try {
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
        Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
    }

    # REGULAR SEASON #
    try {
        Get-ChildItem $extractDir -Exclude 'allas', 'allpost' |
        ForEach-Object {
            Get-ChildItem $_\* -Exclude *.ROS |
            ForEach-Object {
                Copy-Item -Path $_ -Destination $dataDir -Recurse -Force
            }
        }

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
        Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
    }

    # POSTSEASON #
    try {
        Get-ChildItem $extractDir -Filter 'allpost' |
        ForEach-Object {
            Get-ChildItem "$($extractDir)\$($_)" -Exclude *.ROS |
            ForEach-Object {
                Copy-Item -Path $_ -Destination $dataDir -Recurse -Force
            }
        }

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
        Write-Host "|| ERR" $(Get-Date) "|| $errMessage"

    }

    # ALL-STAR #
    try {
        Get-ChildItem $extractDir -Filter "allas" |
        ForEach-Object {
            Get-ChildItem "$($extractDir)\$($_)" -Exclude *.ROS |
            ForEach-Object {
                Copy-Item -Path $_ -Destination $dataDir -Recurse -Force
            }
        }

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
        Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
    }
}
catch {
    $errMessage = $_.Exception.Message
    Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
    Write-Host "|| ERR" $(Get-Date) "|| PROCESSING COMPLETED WITH ERRORS"
    exit 1
}
