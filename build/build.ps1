[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    param (
        [string]$SqlInstance
    )

$SqlDatabase = "wapo-data-police-shootings"
$SchemaFile = Join-Path $PSScriptRoot "schema.sql"
$PopulateFile = Join-Path $PSScriptRoot "populate.sql"
$DataPath = Join-Path $PSScriptRoot "fatal-police-shootings-data.csv"
$ImportTable = "PoliceShootings"
$ImportSchema = "stage"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$BackupDest = (Join-Path $RepoRoot "db")
$WapoRoot = (Join-Path $RepoRoot "data-police-shootings")

Install-Module DbaTools -Force

# Update submodule
Set-Location -Path $WapoRoot
git fetch
git merge origin/master -q

#Build database
Set-Location $RepoRoot
Stop-DbaProcess -SqlInstance $SqlInstance -Database $SqlDatabase | Out-Null
Remove-DbaDatabase -SqlInstance $SqlInstance -Database $SqlDatabase -Confirm:$false | Out-Null
New-DbaDatabase -SqlInstance $SqlInstance -Database $SqlDatabase -Recoverymodel Simple -Owner "sa" | Out-Null
Invoke-DbaQuery -SqlInstance $SqlInstance -Database $SqlDatabase -File $SchemaFile
Import-DbaCsv -Path $DataPath -SqlInstance $SqlInstance -Database $SqlDatabase -Table $ImportTable -Schema $ImportSchema -AutoCreateTable | Out-Null
Invoke-DbaQuery -SqlInstance $SqlInstance -Database $SqlDatabase -File $PopulateFile

#Create backups
Remove-Item -Path (Join-Path $BackupDest *.bak) -Force
Backup-DbaDatabase -SqlInstance $SqlInstance -Database $SqlDatabase -Path $BackupDest -CompressBackup -Verify -FileCount 1 -IgnoreFileChecks -BuildPath