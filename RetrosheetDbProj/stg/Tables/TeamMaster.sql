CREATE TABLE [stg].[TeamMaster] (
    [StgTeamID]   INT           IDENTITY (1, 1) NOT NULL,
    [RetroTeamID] CHAR (3)      NOT NULL,
    [League]      CHAR (2)      NOT NULL,
    [City]        VARCHAR (25)  NOT NULL,
    [Nickname]    VARCHAR (25)  NOT NULL,
    [Start]       INT           NULL,
    [End]         INT           NULL,
    [RowHash]     NVARCHAR (64) NULL,
    [dCreated]    DATETIME      CONSTRAINT [df_TeamMaster_dCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_TeamMaster] PRIMARY KEY CLUSTERED ([StgTeamID] ASC)
);

