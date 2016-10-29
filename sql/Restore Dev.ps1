Push-Location; Import-Module sqlps -DisableNameChecking; Pop-Location

$serverPath = "SQLSERVER:\SQL\Rahman\MOSHIOUR_DB"
$databaseName = "Payroll"
$restoreFrom = join-path (Get-Location) "$databaseName.bak"

#logic to blow away the databaseName

$databasePath=join-path $serverPath "Databases\$databaseName"

if(Test-Path $databasePath){
    #to simply drop this is the command
    # Invoke-SqlCmd "DROP DATABASE[$databaseName]"
    # but to kill all the existing connecitons..

    Invoke-SqlCmd "USE [master]; ALTER DATABASE[$databaseName] SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE[$databaseName]"
}
Restore-SqlDatabase -Path $serverPath  -Database $databaseName  -BackupFile $restoreFrom
