﻿[CmdletBinding()]
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

Write-Verbose "Generating SQL Server database..."

[PSCredential]$SqlCred = $null
$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$SqlDatabase = "wapo-data-police-shootings"
$ImportTable = "PoliceShootings_stg"
$ImportSchema = "dbo"
$DateFormat = "yyyyMMdd"

$SchemaFile = Join-Path $PSScriptRoot "schema.sql"
$PopulateFile = Join-Path $PSScriptRoot "populate.sql"
$WapoRoot = (Join-Path $RepoRoot "data-police-shootings")
$CsvFile = (Join-Path $WapoRoot "fatal-police-shootings-data.csv")

# Create credential if SQL Auth is being used
If ($PSBoundParameters.ContainsKey('SqlLogin') -and $PSBoundParameters.ContainsKey('SqlPass')) {
    [SecureString]$SqlSecurePass = ConvertTo-SecureString $SqlPass -AsPlainText -Force
    $SqlCred = New-Object -Typename PSCredential $SqlLogin, $SqlSecurePass
}

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
Backup-DbaDatabase -SqlInstance $SqlInstance -Database $SqlDatabase -Verify -Path $RepoRoot -IgnoreFileChecks -BuildPath:$true `
    -SqlCredential $SqlCred -TimeStampFormat $DateFormat