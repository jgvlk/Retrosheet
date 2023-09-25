USE [Retrosheet]
GO

/****** Object:  Table [raw].[PlayerMaster]    Script Date: 9/25/2023 1:30:37 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[raw].[PlayerMaster]') AND type in (N'U'))
DROP TABLE [raw].[PlayerMaster]
GO

/****** Object:  Table [raw].[PlayerMaster]    Script Date: 9/25/2023 1:30:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [raw].[PlayerMaster](
	[PLAYERID] [varchar](500) NOT NULL,
	[LAST] [varchar](500) NULL,
	[FIRST] [varchar](500) NULL,
	[NICKNAME] [varchar](500) NULL,
	[BIRTHDATE] [varchar](500) NULL,
	[BIRTH_CITY] [varchar](500) NULL,
	[BIRTH_STATE] [varchar](500) NULL,
	[BIRTH_COUNTRY] [varchar](500) NULL,
	[PLAY_DEBUT] [varchar](500) NULL,
	[PLAY_LASTGAME] [varchar](500) NULL,
	[MGR_DEBUT] [varchar](500) NULL,
	[MGR_LASTGAME] [varchar](500) NULL,
	[COACH_DEBUT] [varchar](500) NULL,
	[COACH_LASTGAME] [varchar](500) NULL,
	[UMP_DEBUT] [varchar](500) NULL,
	[UMP_LASTGAME] [varchar](500) NULL,
	[DEATHDATE] [varchar](500) NULL,
	[DEATH_CITY] [varchar](500) NULL,
	[DEATH_STATE] [varchar](500) NULL,
	[DEATH_COUNTRY] [varchar](500) NULL,
	[BATS] [varchar](500) NULL,
	[THROWS] [varchar](500) NULL,
	[HEIGHT] [varchar](500) NULL,
	[WEIGHT] [varchar](500) NULL,
	[CEMETERY] [varchar](500) NULL,
	[CEME_CITY] [varchar](500) NULL,
	[CEME_STATE] [varchar](500) NULL,
	[CEME_COUNTRY] [varchar](500) NULL,
	[CEME_NOTE] [varchar](500) NULL,
	[BIRTH_NAME] [varchar](500) NULL,
	[NAME_CHG] [varchar](500) NULL,
	[BAT_CHG] [varchar](500) NULL,
	[HOF] [varchar](500) NULL
) ON [PRIMARY]
GO


