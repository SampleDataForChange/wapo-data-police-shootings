# Police Shooting Data

[![License](https://img.shields.io/badge/license-CC%20BY--NC--SA%204.0-blue)](LICENSE)
![MSSQL 2012+](https://img.shields.io/static/v1?label=MSSQL&message=2012%2b&color=blue&logo=microsoft-sql-server)
![SQLIte 3.3](https://img.shields.io/badge/SQLite-3.3-blue?logo=SQLite)

[![Build status](https://ci.appveyor.com/api/projects/status/587hgxuicblhqa94?svg=true)](https://ci.appveyor.com/project/LowlyDBA/wapo-data-police-shootings)

[![Sample Data For Change](https://img.shields.io/badge/Sample%20Data%20For%20Change-%E2%9D%A4-red)][sdfc]

This project aims to make the Washington Post's police shooting data more easily
accessible as sample data for examples, testing, and documentation as part of
[Sample Data for Change][sdfc].

## Usage

Normalized databases are packaged into [releases](https://github.com/SampleDataForChange/wapo-data-police-shootings/releases) based off the latest raw data
available as of build time.

Documentation for the database is at [wapo-data-police-shootings.md](wapo-data-police-shootings.md).

Formats supported:

* SQL Server 2012+
* SQLite 3.3

## Attribution

This work, "wapo-data-police-shootings", is a derivative of
[data-police-shootings][ps-github]
by the [Washington Post][wapo], used under [CC BY-NC-SA 4.0][license].

"wapo-data-police-shootings" is also licensed under [CC BY-NC-SA 4.0][license]
by John McCall / [LowlyDBA][lowlydba].

## Contributing

Want to see this data in more database formats? Open a [request][request].

[license]: https://creativecommons.org/licenses/by-nc-sa/4.0/
[lowlydba]: https://github.com/LowlyDBA
[ps-github]: https://github.com/washingtonpost/data-police-shootings
[request]: https://github.com/SampleDataForChange/wapo-data-police-shootings/issues
[sdfc]: https://github.com/SampleDataForChange
[wapo]: https://github.com/washingtonpost
