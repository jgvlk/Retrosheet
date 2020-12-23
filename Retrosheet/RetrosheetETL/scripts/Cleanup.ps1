# SET PARAMS & VARS #
#####################

param (

    [string]$rootDir = "C:\Data\mlb\Retrosheet"
    
)


$dataDir = "$($rootdir)\data\run"
$extractDir = "$($rootdir)\data\extracts"
$downloadsDir = "$($rootdir)\data\downloads"





# CLEAUP #
##########

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
    Write-Host "||ERR" $(Get-Date) "|| CLEANUP COMPLETED WITH ERRORS"
    exit 1

}

