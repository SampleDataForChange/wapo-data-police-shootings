Write-Verbose "Installing dependencies..."

# MSSQL
Install-Module DbaTools -Force -AllowClobber
$SQLInstance = $env:MSSQL;
Start-Service "MSSQL`$$SQLInstance";

# SQLite
choco install sqlite --limitoutput --no-progress