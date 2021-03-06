﻿[CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]$SqlInstance
    )

Write-Verbose "Generating SQLite database..."

# Variables
$DateFormat = "yyyyMMdd"
$Date = (Get-Date -Format $DateFormat)
$ConverterZip = "export2sqlce.zip"
$ConverterUri = "https://github.com/ErikEJ/SqlCeToolbox/releases/download/3.5.2/export2sqlce.zip"
$SqlServerDatabase = "wapo-data-police-shootings"
$SqlServerConn = "Data source=$SqlInstance;Initial Catalog=$SqlServerDatabase;Integrated Security=True"
$SqlLiteDatabaseFile = "wapo-data-police-shootings-" +  + $Date + ".db"
$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$SqliteCmd = "
.read temp.sql
VACUUM;
.exit"

# Prep
If (Test-Path $ConverterZip) {
    Remove-Item $ConverterZip -Force
}

# Get SQL Server to Sqlite converter
Invoke-WebRequest -Uri $ConverterUri -OutFile $ConverterZip
If (Test-Path $ConverterZip) {
    Expand-Archive $ConverterZip -DestinationPath $RepoRoot -Force
}
else {
    Write-Error "Error downloading $ConverterUri"
}

# Convert MSSQL to Sqlite
.\Export2SqlCe.exe $SqlServerConn temp.sql sqlite
$SqliteCmd | sqlite3 $SqlLiteDatabaseFile

# Cleanup
Remove-Item $ConverterZip
Remove-Item *.exe
Remove-Item *.sql