# # SET PARAMS & VARS #
# #####################
# param (

#     [string]$rootDir

# )

# $dataDir = "$($rootdir)\run"
# $metadataDir = "$($rootDir)\metadata"
# $supplementalDir = "$($rootDir)\supplemental"


# # CLEAUP #
# ##########

# try {
#     Write-Host "|| MSG" $(Get-Date) "|| CLEANING UP"
#     Remove-Item $datadir -Recurse -Force
#     Remove-Item $metadataDir -Recurse -Force
#     Remove-Item $supplementalDir -Recurse -Force

# }
# catch {
#     $errMessage = $_.Exception.Message
#     Write-Host "|| ERR" $(Get-Date) "|| $errMessage"
#     Write-Host "|| ERR" $(Get-Date) "|| CLEANUP COMPLETED WITH ERRORS"
#     exit 1
# }
