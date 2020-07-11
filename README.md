# Police Shooting Data

![GitHub](https://img.shields.io/github/license/SampleDataForChange/wapo-data-police-shootings)
![MSSQL 2012+](https://img.shields.io/static/v1?label=MSSQL&message=2012%2b&color=green&logo=microsoft-sql-server)

## Usage

This project aims to make the Washington Post's police shooting data more easily
accessible as sample data for examples, testing, and documentation as part of
[Sample Data for Change](sdfc).

A database backup compatible with SQL Server 2012+ can be found in the `\db` folder.

## Notable Modifications

While the goal of this project is not to modify the data, some changes have been made
to increase its correctness:

* After staging, the data attribute originally referred to as Gender is switched to Sex
to better adhere to the [ISO/IEC 5218](iso) standard for representing human sexes.

## Attribution

This work, "wapo-data-police-shootings", is a derivative of
[data-police-shootings](ps-github)
by the [Washington Post](wapo), used under [CC BY-NC-SA 4.0](license).

"wapo-data-police-shootings" is also licensed under [CC BY-NC-SA 4.0](license)
by John McCall / [LowlyDBA](lowlydba).

## Contributing

Want to see this data in more database formats? Open a [request](request).

[iso]: https://en.wikipedia.org/wiki/ISO/IEC_5218
[license]: https://creativecommons.org/licenses/by-nc-sa/4.0/
[lowlydba]: https://github.com/LowlyDBA
[ps-github]: https://github.com/washingtonpost/data-police-shootings
[request]: https://github.com/SampleDataForChange/wapo-data-police-shootings/issues
[sdfc]: https://github.com/SampleDataForChange
[wapo]: https://github.com/washingtonpost