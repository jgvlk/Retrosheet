CREATE TABLE [dbo].[Game] (
    [GameID]                 BIGINT       IDENTITY (1, 1) NOT NULL,
    [ParkID]                 INT          NULL,
    [GameTypeID]             INT          NOT NULL,
    [RetroGameID]            CHAR (12)    NULL,
    [Date]                   DATE         NULL,
    [GameNumber]             INT          NULL,
    [DayOfWeek]              VARCHAR (10) NULL,
    [StartTime]              VARCHAR (5)  NULL,
    [DHUsedFlag]             BIT          NULL,
    [DayNightFlag]           CHAR (1)     NULL,
    [VisitingTeam]           CHAR (3)     NULL,
    [HomeTeam]               CHAR (3)     NULL,
    [VisitorStartingPitcher] INT          NULL,
    [HomeStartingPitcher]    INT          NULL,
    [HomePlateUmpire]        INT          NULL,
    [FirstBaseUmpire]        INT          NULL,
    [SecondBaseUmpire]       INT          NULL,
    [ThirdBaseUmpire]        INT          NULL,
    [LeftFieldUmpire]        INT          NULL,
    [RightFieldUmpire]       INT          NULL,
    [Attendance]             INT          NULL,
    [HowScored]              INT          NULL,
    [PitchesEntered]         INT          NULL,
    [Temperature]            INT          NULL,
    [WindDirection]          INT          NULL,
    [WindSpeed]              INT          NULL,
    [FieldCondition]         INT          NULL,
    [Precipitation]          INT          NULL,
    [Sky]                    INT          NULL,
    [TimeOfGame]             INT          NULL,
    [NumberOfInnings]        INT          NULL,
    [VisitorFinalScore]      INT          NULL,
    [HomeFinalScore]         INT          NULL,
    [VisitorHits]            INT          NULL,
    [HomeHits]               INT          NULL,
    [VisitorErrors]          INT          NULL,
    [HomeErrors]             INT          NULL,
    [VisitorLeftOnBase]      INT          NULL,
    [HomeLeftOnBase]         INT          NULL,
    [WinningPitcher]         INT          NULL,
    [LosingPitcher]          INT          NULL,
    [SaveFor]                INT          NULL,
    [GWRBI]                  INT          NULL,
    [VisitorBatter1]         INT          NULL,
    [VisitorPosition1]       INT          NULL,
    [VisitorBatter2]         INT          NULL,
    [VisitorPosition2]       INT          NULL,
    [VisitorBatter3]         INT          NULL,
    [VisitorPosition3]       INT          NULL,
    [VisitorBatter4]         INT          NULL,
    [VisitorPosition4]       INT          NULL,
    [VisitorBatter5]         INT          NULL,
    [VisitorPosition5]       INT          NULL,
    [VisitorBatter6]         INT          NULL,
    [VisitorPosition6]       INT          NULL,
    [VisitorBatter7]         INT          NULL,
    [VisitorPosition7]       INT          NULL,
    [VisitorBatter8]         INT          NULL,
    [VisitorPosition8]       INT          NULL,
    [VisitorBatter9]         INT          NULL,
    [VisitorPosition9]       INT          NULL,
    [HomeBatter1]            INT          NULL,
    [HomePosition1]          INT          NULL,
    [HomeBatter2]            INT          NULL,
    [HomePosition2]          INT          NULL,
    [HomeBatter3]            INT          NULL,
    [HomePosition3]          INT          NULL,
    [HomeBatter4]            INT          NULL,
    [HomePosition4]          INT          NULL,
    [HomeBatter5]            INT          NULL,
    [HomePosition5]          INT          NULL,
    [HomeBatter6]            INT          NULL,
    [HomePosition6]          INT          NULL,
    [HomeBatter7]            INT          NULL,
    [HomePosition7]          INT          NULL,
    [HomeBatter8]            INT          NULL,
    [HomePosition8]          INT          NULL,
    [HomeBatter9]            INT          NULL,
    [HomePosition9]          INT          NULL,
    [VisitingFinisher]       INT          NULL,
    [HomeFinisher]           INT          NULL,
    [OfficialScorer]         INT          NULL,
    [dCreated]               DATETIME     CONSTRAINT [df_Game_dCreated] DEFAULT (getdate()) NOT NULL,
    [dModified]              DATETIME     CONSTRAINT [df_Game_dModified] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_Game] PRIMARY KEY CLUSTERED ([GameID] ASC),
    CONSTRAINT [fk_Game_GameTypeID] FOREIGN KEY ([GameTypeID]) REFERENCES [dbo].[GameType] ([GameTypeID]),
    CONSTRAINT [fk_Game_ParkMaster] FOREIGN KEY ([ParkID]) REFERENCES [dbo].[ParkMaster] ([ParkID]),
    CONSTRAINT [fk_Game_PlayerMaster01] FOREIGN KEY ([VisitorStartingPitcher]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster02] FOREIGN KEY ([HomeStartingPitcher]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster03] FOREIGN KEY ([HomePlateUmpire]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster04] FOREIGN KEY ([FirstBaseUmpire]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster05] FOREIGN KEY ([SecondBaseUmpire]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster06] FOREIGN KEY ([ThirdBaseUmpire]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster07] FOREIGN KEY ([LeftFieldUmpire]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster08] FOREIGN KEY ([RightFieldUmpire]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster09] FOREIGN KEY ([WinningPitcher]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster10] FOREIGN KEY ([LosingPitcher]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster11] FOREIGN KEY ([SaveFor]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster12] FOREIGN KEY ([VisitorBatter1]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster13] FOREIGN KEY ([VisitorBatter2]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster14] FOREIGN KEY ([VisitorBatter3]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster15] FOREIGN KEY ([VisitorBatter4]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster16] FOREIGN KEY ([VisitorBatter5]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster17] FOREIGN KEY ([VisitorBatter6]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster18] FOREIGN KEY ([VisitorBatter7]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster19] FOREIGN KEY ([VisitorBatter8]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster20] FOREIGN KEY ([VisitorBatter9]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster21] FOREIGN KEY ([HomeBatter1]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster22] FOREIGN KEY ([HomeBatter2]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster23] FOREIGN KEY ([HomeBatter3]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster24] FOREIGN KEY ([HomeBatter4]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster25] FOREIGN KEY ([HomeBatter5]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster26] FOREIGN KEY ([HomeBatter6]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster27] FOREIGN KEY ([HomeBatter7]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster28] FOREIGN KEY ([HomeBatter8]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster29] FOREIGN KEY ([HomeBatter9]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster30] FOREIGN KEY ([VisitingFinisher]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster31] FOREIGN KEY ([HomeFinisher]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster32] FOREIGN KEY ([OfficialScorer]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [fk_Game_PlayerMaster33] FOREIGN KEY ([GWRBI]) REFERENCES [dbo].[PlayerMaster] ([PlayerID]),
    CONSTRAINT [ak_Game_RetroGameID] UNIQUE NONCLUSTERED ([RetroGameID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomePlateUmpire]
    ON [dbo].[Game]([HomePlateUmpire] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomeStartingPitcher]
    ON [dbo].[Game]([HomeStartingPitcher] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_VisitorStartingPitcher]
    ON [dbo].[Game]([VisitorStartingPitcher] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_ParkID]
    ON [dbo].[Game]([ParkID] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomeBatter3]
    ON [dbo].[Game]([HomeBatter3] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomeBatter2]
    ON [dbo].[Game]([HomeBatter2] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomeBatter9]
    ON [dbo].[Game]([HomeBatter9] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomeBatter1]
    ON [dbo].[Game]([HomeBatter1] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_VisitorBatter8]
    ON [dbo].[Game]([VisitorBatter8] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_VisitorBatter7]
    ON [dbo].[Game]([VisitorBatter7] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_VisitorBatter6]
    ON [dbo].[Game]([VisitorBatter6] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_VisitorBatter5]
    ON [dbo].[Game]([VisitorBatter5] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_VisitorBatter4]
    ON [dbo].[Game]([VisitorBatter4] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_VisitorBatter3]
    ON [dbo].[Game]([VisitorBatter3] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_VisitorBatter2]
    ON [dbo].[Game]([VisitorBatter2] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_VisitorBatter9]
    ON [dbo].[Game]([VisitorBatter9] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_VisitorBatter1]
    ON [dbo].[Game]([VisitorBatter1] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_GWRBI]
    ON [dbo].[Game]([GWRBI] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_SaveFor]
    ON [dbo].[Game]([SaveFor] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_LosingPitcher]
    ON [dbo].[Game]([LosingPitcher] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_WinningPitcher]
    ON [dbo].[Game]([WinningPitcher] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_RightFieldUmpire]
    ON [dbo].[Game]([RightFieldUmpire] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_LeftFieldUmpire]
    ON [dbo].[Game]([LeftFieldUmpire] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_ThirdBaseUmpire]
    ON [dbo].[Game]([ThirdBaseUmpire] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_SecondBaseUmpire]
    ON [dbo].[Game]([SecondBaseUmpire] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_FirstBaseUmpire]
    ON [dbo].[Game]([FirstBaseUmpire] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_OfficialScorer]
    ON [dbo].[Game]([OfficialScorer] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomeFinisher]
    ON [dbo].[Game]([HomeFinisher] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_VisitingFinisher]
    ON [dbo].[Game]([VisitingFinisher] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomeBatter8]
    ON [dbo].[Game]([HomeBatter8] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomeBatter7]
    ON [dbo].[Game]([HomeBatter7] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomeBatter6]
    ON [dbo].[Game]([HomeBatter6] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomeBatter5]
    ON [dbo].[Game]([HomeBatter5] ASC);


GO
CREATE NONCLUSTERED INDEX [ixnc_Game_HomeBatter4]
    ON [dbo].[Game]([HomeBatter4] ASC);

