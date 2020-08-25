USE [wapo-data-police-shootings]
GO
/****** Object:  Table [dbo].[Armed]    Script Date: 7/10/2020 8:38:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Armed]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Armed](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[armed_type] [varchar](50) NULL,
 CONSTRAINT [pk_armed_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[City]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[City]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [varchar](50) NULL,
	[state_id] [tinyint] NULL,
 CONSTRAINT [pk_city_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Flee]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Flee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Flee](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[flee_type] [varchar](50) NULL,
 CONSTRAINT [pk_flee_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MannerOfDeath]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MannerOfDeath]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MannerOfDeath](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[manner_of_death] [varchar](50) NULL,
 CONSTRAINT [pk_mannerofdeath_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PoliceShootings]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PoliceShootings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PoliceShootings](
	[ID] [int] NOT NULL,
	[victim_name] [nvarchar](500) NULL,
	[shooting_date] [date] NULL,
	[manner_of_death_id] [smallint] NULL,
	[armed_id] [tinyint] NULL,
	[age] [tinyint] NULL,
	[sex_id] [tinyint] NULL,
	[race] [tinyint] NULL,
	[city_id] [int] NULL,
	[signs_of_mental_illness] [bit] NULL,
	[threat_level] [tinyint] NULL,
	[flee_type] [tinyint] NULL,
	[body_camera] [bit] NULL,
 CONSTRAINT [pk_policeshootings_id] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Race]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Race]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Race](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[race_name] [varchar](20) NULL,
	[race_abbr] [char](1) NULL,
 CONSTRAINT [pk_Race_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sex]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sex]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sex](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[sex_name] [varchar](20) NULL,
	[sex_abbr] [char](1) NULL,
 CONSTRAINT [pk_sex_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[States]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[States]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[States](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[state_name] [varchar](50) NULL,
	[state_abbr] [char](2) NULL,
 CONSTRAINT [pk_states_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ThreatLevel]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ThreatLevel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ThreatLevel](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[threat_level] [varchar](50) NULL,
 CONSTRAINT [pk_threatlevel_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stage].[PoliceShootings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PoliceShootings_stg](
	[ID] [varchar](100) NULL,
	[victim_name] [nvarchar](500) NULL,
	[shooting_date] [varchar](100) NULL,
	[manner_of_death] [nvarchar](100) NULL,
	[armed] [varchar](100) NULL,
	[age] [varchar](100) NULL,
	[gender] [varchar](100) NULL,
	[race] [varchar](100) NULL,
	[city] [varchar](100) NULL,
	[state] [varchar](100) NULL,
	[signs_of_mental_illness] [varchar](100) NULL,
	[threat_level] [varchar](100) NULL,
	[flee] [varchar](100) NULL,
	[body_camera] [varchar](100) NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_city_state]') AND parent_object_id = OBJECT_ID(N'[dbo].[City]'))
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [fk_city_state] FOREIGN KEY([state_id])
REFERENCES [dbo].[States] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_city_state]') AND parent_object_id = OBJECT_ID(N'[dbo].[City]'))
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [fk_city_state]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_armed]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_armed] FOREIGN KEY([armed_id])
REFERENCES [dbo].[Armed] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_armed]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_armed]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_city]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_city]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_city]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_fleetype]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_fleetype] FOREIGN KEY([flee_type])
REFERENCES [dbo].[Flee] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_fleetype]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_fleetype]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_mannerofdeath]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_mannerofdeath] FOREIGN KEY([manner_of_death_id])
REFERENCES [dbo].[MannerOfDeath] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_mannerofdeath]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_mannerofdeath]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_race]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_race] FOREIGN KEY([race])
REFERENCES [dbo].[Race] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_race]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_race]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_sex]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_sex] FOREIGN KEY([sex_id])
REFERENCES [dbo].[Sex] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_sex]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_sex]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_threatlevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings]  WITH CHECK ADD  CONSTRAINT [fk_policeshootings_threatlevel] FOREIGN KEY([threat_level])
REFERENCES [dbo].[ThreatLevel] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_policeshootings_threatlevel]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoliceShootings]'))
ALTER TABLE [dbo].[PoliceShootings] CHECK CONSTRAINT [fk_policeshootings_threatlevel]
GO
/****** Object:  StoredProcedure [dbo].[sp_ReloadArmed]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReloadArmed]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ReloadArmed] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ReloadArmed]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ReloadCity]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReloadCity]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ReloadCity] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ReloadCity]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ReloadFlee]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReloadFlee]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ReloadFlee] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ReloadFlee]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ReloadMannerOfDeath]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReloadMannerOfDeath]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ReloadMannerOfDeath] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ReloadMannerOfDeath]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ReloadPoliceShootings]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReloadPoliceShootings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ReloadPoliceShootings] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ReloadPoliceShootings]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ReloadRace]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReloadRace]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ReloadRace] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ReloadRace]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ReloadSex]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReloadSex]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ReloadSex] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ReloadSex]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ReloadStates]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReloadStates]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ReloadStates] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ReloadStates]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ReloadThreatLevel]    Script Date: 7/10/2020 8:38:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReloadThreatLevel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ReloadThreatLevel] AS' 
END
GO

ALTER PROCEDURE [dbo].[sp_ReloadThreatLevel]
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
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'PROCEDURE',N'sp_ReloadArmed', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Truncates and reloads the Armed table with static reference data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_ReloadArmed'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'PROCEDURE',N'sp_ReloadCity', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Truncates and reloads the City table with static reference data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_ReloadCity'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'PROCEDURE',N'sp_ReloadFlee', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Truncates and reloads the Flee table with static reference data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_ReloadFlee'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'PROCEDURE',N'sp_ReloadMannerOfDeath', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Truncates and reloads the MannerOfDeath table with static reference data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_ReloadMannerOfDeath'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'PROCEDURE',N'sp_ReloadPoliceShootings', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Truncates and reloads the PoliceShootings table with static reference data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_ReloadPoliceShootings'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'PROCEDURE',N'sp_ReloadRace', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Truncates and reloads the Race table with static reference data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_ReloadRace'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'PROCEDURE',N'sp_ReloadSex', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Truncates and reloads the Sex table with static reference data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_ReloadSex'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'PROCEDURE',N'sp_ReloadStates', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Truncates and reloads the States table with static reference data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_ReloadStates'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'PROCEDURE',N'sp_ReloadThreatLevel', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Truncates and reloads the ThreatLevel table with static reference data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_ReloadThreatLevel'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Armed', N'COLUMN',N'id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unique identifier for armed type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Armed', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Armed', N'COLUMN',N'armed_type'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full description of the armed type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Armed', @level2type=N'COLUMN',@level2name=N'armed_type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Armed', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Enumeration table for what, if any, item a victim was armed with.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Armed'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'City', N'COLUMN',N'id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unique identifier for each city or county' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'City', N'COLUMN',N'city_name'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of the city or county.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'COLUMN',@level2name=N'city_name'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'City', N'COLUMN',N'state_id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'State or territory the city or county resides in.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City', @level2type=N'COLUMN',@level2name=N'state_id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'City', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Enumeration of US cities. May also include counties.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'City'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Flee', N'COLUMN',N'id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unique identifier for types of fleeing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flee', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Flee', N'COLUMN',N'flee_type'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full description of types of fleeing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flee', @level2type=N'COLUMN',@level2name=N'flee_type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Flee', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Enumeration table for types of fleeing' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flee'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'MannerOfDeath', N'COLUMN',N'id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unique identifier for manners of death' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MannerOfDeath', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'MannerOfDeath', N'COLUMN',N'manner_of_death'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of manners of death' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MannerOfDeath', @level2type=N'COLUMN',@level2name=N'manner_of_death'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'MannerOfDeath', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Enumeration table for manners of death' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MannerOfDeath'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'ID'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unique identifier for the shooting. Generated by the Washington Post.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'ID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'victim_name'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of the police shooting victim' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'victim_name'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'shooting_date'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date the shooting occurred' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'shooting_date'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'manner_of_death_id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If vicitim died, the cause of death' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'manner_of_death_id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'armed_id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'How the victim was armed, if at all.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'armed_id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'age'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Age of victim' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'age'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'sex_id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Sex of victim' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'sex_id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'race'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Race of victim' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'race'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'city_id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'City or county where shooting occurred' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'city_id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'signs_of_mental_illness'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If victim exhibited signs of mental illness' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'signs_of_mental_illness'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'threat_level'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The perceived threat level of victim as assessed by police' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'threat_level'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'flee_type'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The method of fleeing the victim attempted, if any' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'flee_type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings', N'COLUMN',N'body_camera'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'News reports have indicated an officer was wearing a body camera and it may have recorded some portion of the incident.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings', @level2type=N'COLUMN',@level2name=N'body_camera'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Race', N'COLUMN',N'id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unique identifier for races' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Race', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Race', N'COLUMN',N'race_name'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of races' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Race', @level2type=N'COLUMN',@level2name=N'race_name'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Race', N'COLUMN',N'race_abbr'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Single letter abbreviation for races' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Race', @level2type=N'COLUMN',@level2name=N'race_abbr'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Race', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Enumeration table of races' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Race'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sex', N'COLUMN',N'id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unique identifier for sex' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sex', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sex', N'COLUMN',N'sex_name'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of sex types' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sex', @level2type=N'COLUMN',@level2name=N'sex_name'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sex', N'COLUMN',N'sex_abbr'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Single letter abbreviation of sex types' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sex', @level2type=N'COLUMN',@level2name=N'sex_abbr'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'Sex', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Enumeration table for sex' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sex'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'States', N'COLUMN',N'id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unique identifier for states' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'States', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'States', N'COLUMN',N'state_name'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of state or territory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'States', @level2type=N'COLUMN',@level2name=N'state_name'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'States', N'COLUMN',N'state_abbr'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Two letter abbreviation of state or territory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'States', @level2type=N'COLUMN',@level2name=N'state_abbr'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'States', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Enumeration table for states and territories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'States'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'ThreatLevel', N'COLUMN',N'id'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Threat level unique identifier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreatLevel', @level2type=N'COLUMN',@level2name=N'id'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'ThreatLevel', N'COLUMN',N'threat_level'))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Type of threat level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreatLevel', @level2type=N'COLUMN',@level2name=N'threat_level'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'ThreatLevel', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Enumeration table for threat levels. The threat_level column was used to flag incidents for the story by Amy Brittain in October 2015. http://www.washingtonpost.com/sf/investigative/2015/10/24/on-duty-under-fire/' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreatLevel'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'Description' , N'SCHEMA',N'dbo', N'TABLE',N'PoliceShootings_stg', NULL,NULL))
	EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Staging table for initial PoliceShootings data import' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PoliceShootings_stg'
GO
