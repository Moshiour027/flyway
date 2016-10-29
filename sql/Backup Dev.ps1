Push-Location; Import-Module sqlps -DisableNameChecking; Pop-Location

$serverPath = "SQLSERVER:\SQL\Rahman\MOSHIOUR_DB"
$databaseName = "Payroll"
$backupTo = join-path (Get-Location) "$databaseName.bak"
Backup-SqlDatabase -Path $serverPath  -Database $databaseName  -BackupFile $backupTo