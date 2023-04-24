﻿CREATE TABLE [stg].[Game] (
    [StgGameID]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [RetroGameID]            VARCHAR (25)   NULL,
    [RetroParkID]            VARCHAR (25)   NULL,
    [Date]                   DATE           NULL,
    [GameNumber]             INT            NULL,
    [DayOfWeek]              VARCHAR (25)   NULL,
    [StartTime]              VARCHAR (25)   NULL,
    [DHUsedFlag]             BIT            NULL,
    [DayNightFlag]           VARCHAR (25)   NULL,
    [VisitingTeam]           VARCHAR (25)   NULL,
    [HomeTeam]               VARCHAR (25)   NULL,
    [VisitorStartingPitcher] VARCHAR (25)   NULL,
    [HomeStartingPitcher]    VARCHAR (25)   NULL,
    [HomePlateUmpire]        VARCHAR (25)   NULL,
    [FirstBaseUmpire]        VARCHAR (25)   NULL,
    [SecondBaseUmpire]       VARCHAR (25)   NULL,
    [ThirdBaseUmpire]        VARCHAR (25)   NULL,
    [LeftFieldUmpire]        VARCHAR (25)   NULL,
    [RightFieldUmpire]       VARCHAR (25)   NULL,
    [Attendance]             INT            NULL,
    [PSScorer]               NVARCHAR (500) NULL,
    [Translator]             NVARCHAR (500) NULL,
    [Inputter]               NVARCHAR (500) NULL,
    [InputTime]              NVARCHAR (500) NULL,
    [EditTime]               NVARCHAR (500) NULL,
    [HowScored]              INT            NULL,
    [PitchesEntered]         INT            NULL,
    [Temperature]            INT            NULL,
    [WindDirection]          INT            NULL,
    [WindSpeed]              INT            NULL,
    [FieldCondition]         INT            NULL,
    [Precipitation]          INT            NULL,
    [Sky]                    INT            NULL,
    [TimeOfGame]             INT            NULL,
    [NumberOfInnings]        INT            NULL,
    [VisitorFinalScore]      INT            NULL,
    [HomeFinalScore]         INT            NULL,
    [VisitorHits]            INT            NULL,
    [HomeHits]               INT            NULL,
    [VisitorErrors]          INT            NULL,
    [HomeErrors]             INT            NULL,
    [VisitorLeftOnBase]      INT            NULL,
    [HomeLeftOnBase]         INT            NULL,
    [WinningPitcher]         VARCHAR (25)   NULL,
    [LosingPitcher]          VARCHAR (25)   NULL,
    [SaveFor]                VARCHAR (25)   NULL,
    [GWRBI]                  VARCHAR (25)   NULL,
    [VisitorBatter1]         VARCHAR (25)   NULL,
    [VisitorPosition1]       INT            NULL,
    [VisitorBatter2]         VARCHAR (25)   NULL,
    [VisitorPosition2]       INT            NULL,
    [VisitorBatter3]         VARCHAR (25)   NULL,
    [VisitorPosition3]       INT            NULL,
    [VisitorBatter4]         VARCHAR (25)   NULL,
    [VisitorPosition4]       INT            NULL,
    [VisitorBatter5]         VARCHAR (25)   NULL,
    [VisitorPosition5]       INT            NULL,
    [VisitorBatter6]         VARCHAR (25)   NULL,
    [VisitorPosition6]       INT            NULL,
    [VisitorBatter7]         VARCHAR (25)   NULL,
    [VisitorPosition7]       INT            NULL,
    [VisitorBatter8]         VARCHAR (25)   NULL,
    [VisitorPosition8]       INT            NULL,
    [VisitorBatter9]         VARCHAR (25)   NULL,
    [VisitorPosition9]       INT            NULL,
    [HomeBatter1]            VARCHAR (25)   NULL,
    [HomePosition1]          INT            NULL,
    [HomeBatter2]            VARCHAR (25)   NULL,
    [HomePosition2]          INT            NULL,
    [HomeBatter3]            VARCHAR (25)   NULL,
    [HomePosition3]          INT            NULL,
    [HomeBatter4]            CHAR (8)       NULL,
    [HomePosition4]          INT            NULL,
    [HomeBatter5]            VARCHAR (25)   NULL,
    [HomePosition5]          INT            NULL,
    [HomeBatter6]            VARCHAR (25)   NULL,
    [HomePosition6]          INT            NULL,
    [HomeBatter7]            VARCHAR (25)   NULL,
    [HomePosition7]          INT            NULL,
    [HomeBatter8]            VARCHAR (25)   NULL,
    [HomePosition8]          INT            NULL,
    [HomeBatter9]            VARCHAR (25)   NULL,
    [HomePosition9]          INT            NULL,
    [VisitingFinisher]       VARCHAR (25)   NULL,
    [HomeFinisher]           VARCHAR (25)   NULL,
    [OfficialScorer]         VARCHAR (25)   NULL,
    [GameType]               VARCHAR (25)   NULL,
    [RowHash]                NVARCHAR (64)  NULL,
    [dCreated]               DATETIME       CONSTRAINT [df_Game_dCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_Game] PRIMARY KEY CLUSTERED ([StgGameID] ASC)
);
