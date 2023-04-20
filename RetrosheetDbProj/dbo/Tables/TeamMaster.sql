CREATE TABLE [dbo].[TeamMaster] (
    [TeamID]      INT          IDENTITY (1, 1) NOT NULL,
    [RetroTeamID] CHAR (3)     NOT NULL,
    [League]      CHAR (2)     NOT NULL,
    [City]        VARCHAR (25) NOT NULL,
    [Nickname]    VARCHAR (25) NOT NULL,
    [Start]       INT          NULL,
    [End]         INT          NULL,
    [dCreated]    DATETIME     CONSTRAINT [df_TeamMaster_dCreated] DEFAULT (getdate()) NOT NULL,
    [dModified]   DATETIME     CONSTRAINT [df_TeamMaster_dModified] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_TeamMaster] PRIMARY KEY CLUSTERED ([TeamID] ASC),
    CONSTRAINT [ak_TeamMaster_RetroTeamID] UNIQUE NONCLUSTERED ([RetroTeamID] ASC, [League] ASC)
);

