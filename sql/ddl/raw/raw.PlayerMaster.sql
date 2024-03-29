IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[PlayerMaster]') AND type in (N'U'))
DROP TABLE [raw].[PlayerMaster]

CREATE TABLE [raw].[PlayerMaster](
	[PlayerID] [nvarchar](500) NULL,
	[Last] [nvarchar](500) NULL,
	[First] [nvarchar](500) NULL,
	[Nickname] [nvarchar](500) NULL,
	[Birthdate] [nvarchar](500) NULL,
	[BirthCity] [nvarchar](500) NULL,
	[BirthState] [nvarchar](500) NULL,
	[BirthCountry] [nvarchar](500) NULL,
	[PlayDebut] [nvarchar](500) NULL,
	[PlayLastGame] [nvarchar](500) NULL,
	[MgrDebut] [nvarchar](500) NULL,
	[MgrLastGame] [nvarchar](500) NULL,
	[CoachDebut] [nvarchar](500) NULL,
	[CoachLastGame] [nvarchar](500) NULL,
	[UmpDebut] [nvarchar](500) NULL,
	[UmpLastGame] [nvarchar](500) NULL,
	[DeathDate] [nvarchar](500) NULL,
	[DeathCity] [nvarchar](500) NULL,
	[DeathState] [nvarchar](500) NULL,
	[DeathCountry] [nvarchar](500) NULL,
	[Bats] [nvarchar](500) NULL,
	[Throws] [nvarchar](500) NULL,
	[Height] [nvarchar](500) NULL,
	[Weight] [nvarchar](500) NULL,
	[Cemetery] [nvarchar](500) NULL,
	[CemeCity] [nvarchar](500) NULL,
	[CemeState] [nvarchar](500) NULL,
	[CemeCountry] [nvarchar](500) NULL,
	[CemeNote] [nvarchar](500) NULL,
	[BirthName] [nvarchar](500) NULL,
	[NameChg] [nvarchar](500) NULL,
	[BatChg] [nvarchar](500) NULL,
	[Hof] [nvarchar](500) NULL
)
