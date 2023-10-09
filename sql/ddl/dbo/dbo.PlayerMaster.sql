IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlayerMaster]') AND type in (N'U'))
DROP TABLE [dbo].[PlayerMaster]

CREATE TABLE [dbo].[PlayerMaster](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[RetroPlayerID] [char](8) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Nickname] [varchar](50) NULL,
	[Birthdate] [date] NULL,
	[BirthCity] [varchar](50) NULL,
	[BirthState] [varchar](50) NULL,
	[BirthCountry] [varchar](50) NULL,
	[PlayerDebut] [date] NULL,
	[PlayerLastGame] [date] NULL,
	[ManagerDebut] [date] NULL,
	[ManagerLastGame] [date] NULL,
	[CoachDebut] [date] NULL,
	[CoachLastGame] [date] NULL,
	[UmpDebut] [date] NULL,
	[UmpLastGame] [date] NULL,
	[DeathDate] [date] NULL,
	[DeathCity] [varchar](50) NULL,
	[DeathState] [varchar](50) NULL,
	[DeathCountry] [varchar](50) NULL,
	[Bats] [char](1) NULL,
	[Throws] [char](1) NULL,
	[Height] [varchar](25) NULL,
	[Weight] [int] NULL,
	[Cemetery] [varchar](500) NULL,
	[CemeteryCity] [varchar](500) NULL,
	[CemeteryState] [varchar](500) NULL,
	[CemeteryCountry] [varchar](500) NULL,
	[CemeteryNote] [varchar](500) NULL,
	[BirthName] [varchar](500) NULL,
	[NameChg] [varchar](500) NULL,
	[BatChg] [varchar](500) NULL,
	[IsHof] [bit] NULL
 CONSTRAINT [pk_PlayerMaster] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [ak_PlayerMaster_RetroPlayerID] UNIQUE NONCLUSTERED 
(
	[RetroPlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)
