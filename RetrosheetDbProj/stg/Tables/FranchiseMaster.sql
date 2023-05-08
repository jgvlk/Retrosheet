CREATE TABLE [stg].[FranchiseMaster] (
    [StgFranchiseID]          INT           IDENTITY (1, 1) NOT NULL,
    [CurrentRetroFranchiseID] CHAR (3)      NOT NULL,
    [RetroFranchiseID]        CHAR (3)      NOT NULL,
    [League]                  CHAR (2)      NULL,
    [Division]                CHAR (1)      NULL,
    [LocationName]            VARCHAR (25)  NULL,
    [Nickname]                VARCHAR (50)  NULL,
    [AltNickname]             VARCHAR (50)  NULL,
    [Start]                   DATE          NOT NULL,
    [End]                     DATE          NULL,
    [City]                    VARCHAR (25)  NOT NULL,
    [State]                   CHAR (2)      NOT NULL,
    [RowHash]                 NVARCHAR (64) NULL,
    [dCreated]                DATETIME      CONSTRAINT [df_FranchiseMaster_dCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_FranchiseMaster] PRIMARY KEY CLUSTERED ([StgFranchiseID] ASC)
);

