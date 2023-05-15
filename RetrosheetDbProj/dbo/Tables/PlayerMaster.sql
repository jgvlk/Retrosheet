﻿CREATE TABLE [dbo].[PlayerMaster] (
    [PlayerID]        INT           IDENTITY (1, 1) NOT NULL,
    [RetroPlayerID]   CHAR (8)      NOT NULL,
    [FirstName]       VARCHAR (50)  NULL,
    [LastName]        VARCHAR (50)  NULL,
    [Nickname]        VARCHAR (50)  NULL,
    [Birthdate]       DATE          NULL,
    [BirthCity]       VARCHAR (50)  NULL,
    [BirthState]      VARCHAR (50)  NULL,
    [BirthCountry]    VARCHAR (50)  NULL,
    [PlayerDebut]     DATE          NULL,
    [PlayerLastGame]  DATE          NULL,
    [ManagerDebut]    DATE          NULL,
    [ManagerLastGame] DATE          NULL,
    [CoachDebut]      DATE          NULL,
    [CoachLastGame]   DATE          NULL,
    [UmpDebut]        DATE          NULL,
    [UmpLastGame]     DATE          NULL,
    [DeathDate]       DATE          NULL,
    [DeathCity]       VARCHAR (50)  NULL,
    [DeathState]      VARCHAR (50)  NULL,
    [DeathCountry]    VARCHAR (50)  NULL,
    [Bats]            CHAR (1)      NULL,
    [Throws]          CHAR (1)      NULL,
    [Height]          VARCHAR (25)  NULL,
    [Weight]          INT           NULL,
    [Cemetery]        VARCHAR (500) NULL,
    [CemeteryCity]    VARCHAR (500) NULL,
    [CemeteryState]   VARCHAR (500) NULL,
    [CemeteryCountry] VARCHAR (500) NULL,
    [CemeteryNote]    VARCHAR (500) NULL,
    [BirthName]       VARCHAR (500) NULL,
    [NameChg]         VARCHAR (500) NULL,
    [BatChg]          VARCHAR (500) NULL,
    [IsHof]           BIT           NULL,
    [dCreated]        DATETIME      CONSTRAINT [df_PlayerMaster_dCreated] DEFAULT (getdate()) NOT NULL,
    [dModified]       DATETIME      CONSTRAINT [df_PlayerMaster_dModified] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_PlayerMaster] PRIMARY KEY CLUSTERED ([PlayerID] ASC),
    CONSTRAINT [ak_PlayerMaster_RetroPlayerID] UNIQUE NONCLUSTERED ([RetroPlayerID] ASC)
);

