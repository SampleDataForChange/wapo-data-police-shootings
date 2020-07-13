[CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]$SqlInstance,
        [Parameter()]
        [String]$SqlLogin,
        [Parameter()]
        [String]$SqlPass
    )

If (!(Get-Module DbaTools)) {
    Install-Module DbaTools -Force
}

[PSCredential]$SqlCred = $null
$SqlDatabase = "wapo-data-police-shootings"
$SchemaFile = Join-Path $PSScriptRoot "schema.sql"
$PopulateFile = Join-Path $PSScriptRoot "populate.sql"
$ImportTable = "PoliceShootings"
$ImportSchema = "stage"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$BackupDest = (Join-Path $RepoRoot "db")
$WapoRoot = (Join-Path $RepoRoot "data-police-shootings")
$CsvFile = (Join-Path $WapoRoot "fatal-police-shootings-data.csv")

# Create credential if SQL Auth is being used
If ($PSBoundParameters.ContainsKey('SqlLogin') -and $PSBoundParameters.ContainsKey('SqlPass')) {
    [SecureString]$SqlSecurePass = ConvertTo-SecureString $SqlPass -AsPlainText -Force
    $SqlCred = New-Object -Typename PSCredential $SqlLogin, $SqlSecurePass
}

# Update submodule


#Build database
Set-Location $RepoRoot
Stop-DbaProcess -SqlInstance $SqlInstance -Database $SqlDatabase -SqlCredential $SqlCred | Out-Null
Remove-DbaDatabase -SqlInstance $SqlInstance -Database $SqlDatabase -Confirm:$false -SqlCredential $SqlCred | Out-Null
New-DbaDatabase -SqlInstance $SqlInstance -Database $SqlDatabase -Recoverymodel Simple -Owner "sa" -SqlCredential $SqlCred | Out-Null
Invoke-DbaQuery -SqlInstance $SqlInstance -Database $SqlDatabase -File $SchemaFile -SqlCredential $SqlCred -EnableException
Import-DbaCsv -Path $CsvFile -SqlInstance $SqlInstance -Database $SqlDatabase -Table $ImportTable -Schema $ImportSchema `
    -AutoCreateTable -SqlCredential $SqlCred -EnableException
Invoke-DbaQuery -SqlInstance $SqlInstance -Database $SqlDatabase -File $PopulateFile -SqlCredential $SqlCred -EnableException

#Create backups
Remove-Item -Path (Join-Path $BackupDest *.bak) -Force
Backup-DbaDatabase -SqlInstance $SqlInstance -Database $SqlDatabase -Path $BackupDest -Verify -FileCount 1 `
    -IgnoreFileChecks -BuildPath -SqlCredential $SqlCred