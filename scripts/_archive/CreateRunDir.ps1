# SET PARAMS & VARS #
#####################

param (

    [string]$rootDir = "C:\Data\mlb\Retrosheet"

)


try {

    New-Item -Path "$($rootDir)\data\run" -ItemType directory
}
catch {

    $errMessage = $_.Exception.Message

    Write-Host "||ERR" $(Get-Date) "|| $errMessage"

}

