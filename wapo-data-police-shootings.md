# wapo-data-police-shootings

## Tables

<details><summary>Click to expand</summary>

* [dbo.Armed](#dboarmed)
* [dbo.City](#dbocity)
* [dbo.Flee](#dboflee)
* [dbo.MannerOfDeath](#dbomannerofdeath)
* [dbo.PoliceShootings](#dbopoliceshootings)
* [dbo.PoliceShootings_stg](#dbopoliceshootings_stg)
* [dbo.Race](#dborace)
* [dbo.Sex](#dbosex)
* [dbo.States](#dbostates)
* [dbo.ThreatLevel](#dbothreatlevel)

### dbo.Armed

Enumeration table for what, if any, item a victim was armed with.

| Column | Type | Null | Foreign Key | Default | Description |
| --- | ---| --- | --- | --- | --- |
| **id** | TINYINT | no |  |  | Unique identifier for armed type |
| armed_type | VARCHAR(50) | yes |  |  | Full description of the armed type |

[Back to top](#wapo-data-police-shootings)

### dbo.City

Enumeration of US cities. May also include counties.

| Column | Type | Null | Foreign Key | Default | Description |
| --- | ---| --- | --- | --- | --- |
| **id** | INT | no |  |  | Unique identifier for each city or county |
| city_name | VARCHAR(50) | yes |  |  | Full name of the city or county. |
| state_id | TINYINT | yes | [[dbo].[States].[id]](#dbostates) |  | State or territory the city or county resides in. |

[Back to top](#wapo-data-police-shootings)

### dbo.Flee

Enumeration table for types of fleeing

| Column | Type | Null | Foreign Key | Default | Description |
| --- | ---| --- | --- | --- | --- |
| **id** | TINYINT | no |  |  | Unique identifier for types of fleeing |
| flee_type | VARCHAR(50) | yes |  |  | Full description of types of fleeing |

[Back to top](#wapo-data-police-shootings)

### dbo.MannerOfDeath

Enumeration table for manners of death

| Column | Type | Null | Foreign Key | Default | Description |
| --- | ---| --- | --- | --- | --- |
| **id** | SMALLINT | no |  |  | Unique identifier for manners of death |
| manner_of_death | VARCHAR(50) | yes |  |  | Full name of manners of death |

[Back to top](#wapo-data-police-shootings)

### dbo.PoliceShootings

| Column | Type | Null | Foreign Key | Default | Description |
| --- | ---| --- | --- | --- | --- |
| **ID** | INT | no |  |  | Unique identifier for the shooting. Generated by the Washington Post. |
| victim_name | NVARCHAR(500) | yes |  |  | Full name of the police shooting victim |
| shooting_date | DATE | yes |  |  | Date the shooting occurred |
| manner_of_death_id | SMALLINT | yes | [[dbo].[MannerOfDeath].[id]](#dbomannerofdeath) |  | If vicitim died, the cause of death |
| armed_id | TINYINT | yes | [[dbo].[Armed].[id]](#dboarmed) |  | How the victim was armed, if at all. |
| age | TINYINT | yes |  |  | Age of victim |
| sex_id | TINYINT | yes | [[dbo].[Sex].[id]](#dbosex) |  | Sex of victim |
| race | TINYINT | yes | [[dbo].[Race].[id]](#dborace) |  | Race of victim |
| city_id | INT | yes | [[dbo].[City].[id]](#dbocity) |  | City or county where shooting occurred |
| signs_of_mental_illness | BIT | yes |  |  | If victim exhibited signs of mental illness |
| threat_level | TINYINT | yes | [[dbo].[ThreatLevel].[id]](#dbothreatlevel) |  | The perceived threat level of victim as assessed by police |
| flee_type | TINYINT | yes | [[dbo].[Flee].[id]](#dboflee) |  | The method of fleeing the victim attempted, if any |
| body_camera | BIT | yes |  |  | News reports have indicated an officer was wearing a body camera and it may have recorded some portion of the incident. |

[Back to top](#wapo-data-police-shootings)

### dbo.PoliceShootings_stg

Staging table for initial PoliceShootings data import

| Column | Type | Null | Foreign Key | Default | Description |
| --- | ---| --- | --- | --- | --- |
| ID | VARCHAR(100) | yes |  |  |  |
| victim_name | NVARCHAR(500) | yes |  |  |  |
| shooting_date | VARCHAR(100) | yes |  |  |  |
| manner_of_death | NVARCHAR(100) | yes |  |  |  |
| armed | VARCHAR(100) | yes |  |  |  |
| age | VARCHAR(100) | yes |  |  |  |
| gender | VARCHAR(100) | yes |  |  |  |
| race | VARCHAR(100) | yes |  |  |  |
| city | VARCHAR(100) | yes |  |  |  |
| state | VARCHAR(100) | yes |  |  |  |
| signs_of_mental_illness | VARCHAR(100) | yes |  |  |  |
| threat_level | VARCHAR(100) | yes |  |  |  |
| flee | VARCHAR(100) | yes |  |  |  |
| body_camera | VARCHAR(100) | yes |  |  |  |

[Back to top](#wapo-data-police-shootings)

### dbo.Race

Enumeration table of races

| Column | Type | Null | Foreign Key | Default | Description |
| --- | ---| --- | --- | --- | --- |
| **id** | TINYINT | no |  |  | Unique identifier for races |
| race_name | VARCHAR(20) | yes |  |  | Full name of races |
| race_abbr | CHAR(1) | yes |  |  | Single letter abbreviation for races |

[Back to top](#wapo-data-police-shootings)

### dbo.Sex

Enumeration table for sex

| Column | Type | Null | Foreign Key | Default | Description |
| --- | ---| --- | --- | --- | --- |
| **id** | TINYINT | no |  |  | Unique identifier for sex |
| sex_name | VARCHAR(20) | yes |  |  | Full name of sex types |
| sex_abbr | CHAR(1) | yes |  |  | Single letter abbreviation of sex types |

[Back to top](#wapo-data-police-shootings)

### dbo.States

Enumeration table for states and territories

| Column | Type | Null | Foreign Key | Default | Description |
| --- | ---| --- | --- | --- | --- |
| **id** | TINYINT | no |  |  | Unique identifier for states |
| state_name | VARCHAR(50) | yes |  |  | Full name of state or territory |
| state_abbr | CHAR(2) | yes |  |  | Two letter abbreviation of state or territory |

[Back to top](#wapo-data-police-shootings)

### dbo.ThreatLevel

Enumeration table for threat levels. The threat_level column was used to flag incidents for the story by Amy Brittain in October 2015. http://www.washingtonpost.com/sf/investigative/2015/10/24/on-duty-under-fire/

| Column | Type | Null | Foreign Key | Default | Description |
| --- | ---| --- | --- | --- | --- |
| **id** | TINYINT | no |  |  | Threat level unique identifier |
| threat_level | VARCHAR(50) | yes |  |  | Type of threat level |

[Back to top](#wapo-data-police-shootings)

</details>

## Stored Procedures

<details><summary>Click to expand</summary>

* [dbo.sp_ReloadArmed](#dbosp_reloadarmed)
* [dbo.sp_ReloadCity](#dbosp_reloadcity)
* [dbo.sp_ReloadFlee](#dbosp_reloadflee)
* [dbo.sp_ReloadMannerOfDeath](#dbosp_reloadmannerofdeath)
* [dbo.sp_ReloadPoliceShootings](#dbosp_reloadpoliceshootings)
* [dbo.sp_ReloadRace](#dbosp_reloadrace)
* [dbo.sp_ReloadSex](#dbosp_reloadsex)
* [dbo.sp_ReloadStates](#dbosp_reloadstates)
* [dbo.sp_ReloadThreatLevel](#dbosp_reloadthreatlevel)

### dbo.sp_ReloadArmed
Truncates and reloads the Armed table with static reference data.

#### Definition

<details><summary>Click to expand</summary>

```sql

CREATE PROCEDURE [dbo].[sp_ReloadArmed]
AS
BEGIN
	SET NOCOUNT ON;

	--Drop FKs
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PoliceShootings]') AND type in (N'U'))
	ALTER TABLE [dbo].[PoliceShootings] DROP CONSTRAINT [fk_policeshootings_armed];

	--Clear table
	TRUNCATE TABLE dbo.Armed;

	--Reload Dynamic data
	INSERT INTO dbo.Armed (armed_type)
	SELECT DISTINCT armed
	FROM dbo.PoliceShootings_stg;

	--Recreate FKs
	ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_armed] FOREIGN KEY([armed_id])
	REFERENCES [dbo].[Armed] ([id]);

	ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_armed];

END

```

</details>

[Back to top](#wapo-data-police-shootings)

### dbo.sp_ReloadCity
Truncates and reloads the City table with static reference data.

#### Definition

<details><summary>Click to expand</summary>

```sql

CREATE PROCEDURE [dbo].[sp_ReloadCity]
AS
BEGIN
	SET NOCOUNT ON;

	--Drop FKs
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PoliceShootings]') AND type in (N'U'))
	ALTER TABLE [dbo].[PoliceShootings] DROP CONSTRAINT [fk_policeshootings_city]

	--Clear table
	TRUNCATE TABLE dbo.City;

	--Reload Dynamic data
	INSERT INTO dbo.City (city_name, state_id)
	SELECT DISTINCT city, [s].[id]
	FROM dbo.PoliceShootings_stg AS [ps]
		LEFT JOIN dbo.States AS [s] ON [s].[state_abbr] = [ps].[state]

	--Recreate FKs
	IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_city]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
	ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_city] FOREIGN KEY([city_id])
	REFERENCES [dbo].[City] ([id]);

	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_city]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
	ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_city];
END

```

</details>

[Back to top](#wapo-data-police-shootings)

### dbo.sp_ReloadFlee
Truncates and reloads the Flee table with static reference data.

#### Definition

<details><summary>Click to expand</summary>

```sql

CREATE PROCEDURE [dbo].[sp_ReloadFlee]
AS
BEGIN
	SET NOCOUNT ON;

	--Drop FKs
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PoliceShootings]') AND type in (N'U'))
	ALTER TABLE [dbo].[PoliceShootings] DROP CONSTRAINT [fk_policeshootings_fleetype];

	--Clear table
	TRUNCATE TABLE dbo.Flee;

	--Reload Dynamic data
	INSERT INTO dbo.Flee (flee_type)
	SELECT DISTINCT flee
	FROM dbo.PoliceShootings_stg;

	--Recreate FKs
	ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_fleetype] FOREIGN KEY([flee_type])
	REFERENCES [dbo].[Flee] ([id]);

	ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_fleetype];

END

```

</details>

[Back to top](#wapo-data-police-shootings)

### dbo.sp_ReloadMannerOfDeath
Truncates and reloads the MannerOfDeath table with static reference data.

#### Definition

<details><summary>Click to expand</summary>

```sql

CREATE PROCEDURE [dbo].[sp_ReloadMannerOfDeath]
AS
BEGIN
	SET NOCOUNT ON;

	--Drop FKs
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PoliceShootings]') AND type in (N'U'))
	ALTER TABLE [dbo].[PoliceShootings] DROP CONSTRAINT [fk_policeshootings_mannerofdeath];

	--Clear table
	TRUNCATE TABLE dbo.MannerOfDeath;

	--Reload Dynamic data
	INSERT INTO dbo.MannerOfDeath (manner_of_death)
	SELECT DISTINCT manner_of_death
	FROM dbo.PoliceShootings_stg;

	--Recreate FKs
	IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_mannerofdeath]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
	ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_mannerofdeath] FOREIGN KEY([manner_of_death_id])
	REFERENCES [dbo].[MannerOfDeath] ([id]);

	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_mannerofdeath]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
	ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_mannerofdeath];

END

```

</details>

[Back to top](#wapo-data-police-shootings)

### dbo.sp_ReloadPoliceShootings
Truncates and reloads the PoliceShootings table with static reference data.

#### Definition

<details><summary>Click to expand</summary>

```sql

CREATE PROCEDURE [dbo].[sp_ReloadPoliceShootings]
AS
BEGIN
	SET NOCOUNT ON;

	--Clear table
	TRUNCATE TABLE dbo.PoliceShootings;

	--Reload Dynamic data
	WITH cities AS (
	SELECT city_name, state_abbr, city.id AS city_id
	FROM dbo.City
		INNER JOIN dbo.States on City.state_id = States.id
	)
	INSERT INTO dbo.PoliceShootings
	SELECT [ps].[ID]
		  ,[victim_name]
		  ,CONVERT(DATE, [shooting_date], 23) AS [shooting_date]
		  ,[mod].[id] AS [manner_of_death_id]
		  ,[a].[id] AS [armed_id]
		  ,[age]
		  ,[s].[id] AS [sex_id]
		  ,[r].[id] AS [race_id]
		  ,[c].[city_id]
		  ,CASE WHEN [ps].[signs_of_mental_illness] = 'True' THEN 1
			ELSE 0
			END AS [signs_of_mental_illness]
		  ,[tl].[id] AS [threat_level_id]
		  ,[f].[id] AS [flee_type]
		  ,CASE WHEN [ps].[body_camera] = 'True' THEN 1
			ELSE 0
			END AS [body_camera]
	FROM dbo.PoliceShootings_stg AS [ps]
		LEFT JOIN dbo.States as [st] ON [st].[state_abbr] = [ps].[state]
		LEFT JOIN dbo.Race AS [r] ON [r].[race_abbr] = [ps].[race]
		LEFT JOIN dbo.Sex AS [s] ON [s].[sex_abbr] = [ps].[gender]
		LEFT JOIN dbo.MannerOfDeath AS [mod] ON [mod].[manner_of_death] = [ps].[manner_of_death]
		LEFT JOIN dbo.ThreatLevel AS [tl] ON [tl].[threat_level] = [ps].[threat_level]
		LEFT JOIN dbo.Flee AS [f] ON [f].[flee_type] = [ps].[flee]
		LEFT JOIN dbo.Armed AS [a] ON [a].[armed_type] = [ps].[armed]
		LEFT JOIN cities AS [c] ON [c].[city_name] = [ps].[city]
			AND [c].[state_abbr] = [ps].[state]

END

```

</details>

[Back to top](#wapo-data-police-shootings)

### dbo.sp_ReloadRace
Truncates and reloads the Race table with static reference data.

#### Definition

<details><summary>Click to expand</summary>

```sql

CREATE PROCEDURE [dbo].[sp_ReloadRace]
AS
BEGIN
	SET NOCOUNT ON;

	--Drop FKs
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PoliceShootings]') AND type in (N'U'))
	ALTER TABLE [dbo].[PoliceShootings] DROP CONSTRAINT [fk_policeshootings_race]

	--Clear table
	TRUNCATE TABLE dbo.Race;

	--Reload static data
	INSERT INTO dbo.Race VALUES ('White', 'W');
	INSERT INTO dbo.Race VALUES ('Black', 'B');
	INSERT INTO dbo.Race VALUES ('Asian', 'A');
	INSERT INTO dbo.Race VALUES ('Native American', 'N');
	INSERT INTO dbo.Race VALUES ('Hispanic', 'H');
	INSERT INTO dbo.Race VALUES ('Other', 'O');

	--Recreate FKs
	ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_race] FOREIGN KEY([race])
	REFERENCES [dbo].[Race] ([id]);

	ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_race];
END

```

</details>

[Back to top](#wapo-data-police-shootings)

### dbo.sp_ReloadSex
Truncates and reloads the Sex table with static reference data.

#### Definition

<details><summary>Click to expand</summary>

```sql

CREATE PROCEDURE [dbo].[sp_ReloadSex]
AS
BEGIN
	SET NOCOUNT ON;

	--Drop FKs
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PoliceShootings]') AND type in (N'U'))
	ALTER TABLE [dbo].[PoliceShootings] DROP CONSTRAINT [fk_policeshootings_sex]

	--Clear table
	TRUNCATE TABLE dbo.Sex;

	--Reload static data
	INSERT INTO dbo.Sex VALUES ('Male', 'M');
	INSERT INTO dbo.Sex VALUES ('Female', 'F');

	--Recreate FKs
	IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_sex]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
	ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_sex] FOREIGN KEY([sex_id])
	REFERENCES [dbo].[Sex] ([id]);

	IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_sex]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
	ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_sex];

END

```

</details>

[Back to top](#wapo-data-police-shootings)

### dbo.sp_ReloadStates
Truncates and reloads the States table with static reference data.

#### Definition

<details><summary>Click to expand</summary>

```sql

CREATE PROCEDURE [dbo].[sp_ReloadStates]
AS
BEGIN
	SET NOCOUNT ON;

	--Drop FKs
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[City]') AND type in (N'U'))
	ALTER TABLE [dbo].[City] DROP CONSTRAINT [fk_city_state]

	--Clear table
	TRUNCATE TABLE dbo.States;

	--Reload static data
    INSERT INTO dbo.States VALUES ('Alaska', 'AK');
	INSERT INTO dbo.States VALUES ('Alabama', 'AL');
	INSERT INTO dbo.States VALUES ('American Samoa', 'AS');
	INSERT INTO dbo.States VALUES ('Arizona', 'AZ');
	INSERT INTO dbo.States VALUES ('Arkansas', 'AR');
	INSERT INTO dbo.States VALUES ('California', 'CA');
	INSERT INTO dbo.States VALUES ('Colorado', 'CO');
	INSERT INTO dbo.States VALUES ('Connecticut', 'CT');
	INSERT INTO dbo.States VALUES ('Delaware', 'DE');
	INSERT INTO dbo.States VALUES ('District of Columbia', 'DC');
	INSERT INTO dbo.States VALUES ('Federated States of Micronesia', 'FM');
	INSERT INTO dbo.States VALUES ('Florida', 'FL');
	INSERT INTO dbo.States VALUES ('Georgia', 'GA');
	INSERT INTO dbo.States VALUES ('Guam', 'GU');
	INSERT INTO dbo.States VALUES ('Hawaii', 'HI');
	INSERT INTO dbo.States VALUES ('Idaho', 'ID');
	INSERT INTO dbo.States VALUES ('Illinois', 'IL');
	INSERT INTO dbo.States VALUES ('Indiana', 'IN');
	INSERT INTO dbo.States VALUES ('Iowa', 'IA');
	INSERT INTO dbo.States VALUES ('Kansas', 'KS');
	INSERT INTO dbo.States VALUES ('Kentucky', 'KY');
	INSERT INTO dbo.States VALUES ('Louisiana', 'LA');
	INSERT INTO dbo.States VALUES ('Maine', 'ME');
	INSERT INTO dbo.States VALUES ('Marshall Islands', 'MH');
	INSERT INTO dbo.States VALUES ('Maryland', 'MD');
	INSERT INTO dbo.States VALUES ('Massachusetts', 'MA');
	INSERT INTO dbo.States VALUES ('Michigan', 'MI');
	INSERT INTO dbo.States VALUES ('Minnesota', 'MN');
	INSERT INTO dbo.States VALUES ('Mississippi', 'MS');
	INSERT INTO dbo.States VALUES ('Missouri', 'MO');
	INSERT INTO dbo.States VALUES ('Montana', 'MT');
	INSERT INTO dbo.States VALUES ('Nebraska', 'NE');
	INSERT INTO dbo.States VALUES ('Nevada', 'NV');
	INSERT INTO dbo.States VALUES ('New Hampshire', 'NH');
	INSERT INTO dbo.States VALUES ('New Jersey', 'NJ');
	INSERT INTO dbo.States VALUES ('New Mexico', 'NM');
	INSERT INTO dbo.States VALUES ('New York', 'NY');
	INSERT INTO dbo.States VALUES ('North Carolina', 'NC');
	INSERT INTO dbo.States VALUES ('North Dakota', 'ND');
	INSERT INTO dbo.States VALUES ('Northern Mariana Islands', 'MP');
	INSERT INTO dbo.States VALUES ('Ohio', 'OH');
	INSERT INTO dbo.States VALUES ('Oklahoma', 'OK');
	INSERT INTO dbo.States VALUES ('Oregon', 'OR');
	INSERT INTO dbo.States VALUES ('Palau', 'PW');
	INSERT INTO dbo.States VALUES ('Pennsylvania', 'PA');
	INSERT INTO dbo.States VALUES ('Puerto Rico', 'PR');
	INSERT INTO dbo.States VALUES ('Rhode Island', 'RI');
	INSERT INTO dbo.States VALUES ('South Carolina', 'SC');
	INSERT INTO dbo.States VALUES ('South Dakota', 'SD');
	INSERT INTO dbo.States VALUES ('Tennessee', 'TN');
	INSERT INTO dbo.States VALUES ('Texas', 'TX');
	INSERT INTO dbo.States VALUES ('Utah', 'UT');
	INSERT INTO dbo.States VALUES ('Vermont', 'VT');
	INSERT INTO dbo.States VALUES ('Virgin Islands', 'VI');
	INSERT INTO dbo.States VALUES ('Virginia', 'VA');
	INSERT INTO dbo.States VALUES ('Washington', 'WA');
	INSERT INTO dbo.States VALUES ('West Virginia', 'WV');
	INSERT INTO dbo.States VALUES ('Wisconsin', 'WI');
	INSERT INTO dbo.States VALUES ('Wyoming', 'WY');
	INSERT INTO dbo.States VALUES ('Armed Forces Africa', 'AE');
	INSERT INTO dbo.States VALUES ('Armed Forces Americas (except Canada)', 'AA');
	INSERT INTO dbo.States VALUES ('Armed Forces Canada', 'AE');
	INSERT INTO dbo.States VALUES ('Armed Forces Europe', 'AE');
	INSERT INTO dbo.States VALUES ('Armed Forces Middle East', 'AE');
	INSERT INTO dbo.States VALUES ('Armed Forces Pacific', 'AP');

	--Recreate FKs
	ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [fk_city_state] FOREIGN KEY([state_id])
	REFERENCES [dbo].[States] ([id]);

	ALTER TABLE [dbo].[City] CHECK CONSTRAINT [fk_city_state];
END

```

</details>

[Back to top](#wapo-data-police-shootings)

### dbo.sp_ReloadThreatLevel
Truncates and reloads the ThreatLevel table with static reference data.

#### Definition

<details><summary>Click to expand</summary>

```sql

CREATE PROCEDURE [dbo].[sp_ReloadThreatLevel]
AS
BEGIN
	SET NOCOUNT ON;

	--Drop FKs
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PoliceShootings]') AND type in (N'U'))
	ALTER TABLE [dbo].[PoliceShootings] DROP CONSTRAINT [fk_policeshootings_threatlevel];

	--Clear table
	TRUNCATE TABLE dbo.ThreatLevel;

	--Reload Dynamic data
	INSERT INTO dbo.ThreatLevel (threat_level)
	SELECT DISTINCT threat_level
	FROM dbo.PoliceShootings_stg;

	--Recreate FKs
	ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_threatlevel] FOREIGN KEY([threat_level])
	REFERENCES [dbo].[ThreatLevel] ([id]);

	ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_threatlevel];

END

```

</details>

[Back to top](#wapo-data-police-shootings)

</details>

----

*Markdown generated by [sp_doc](https://expresssql.lowlydba.com/)
 at 2020-09-26 11:55:52.5476024 -04:00.*
