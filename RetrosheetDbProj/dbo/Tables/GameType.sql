CREATE TABLE [dbo].[GameType] (
    [GameTypeID] INT          NOT NULL,
    [GameType]   VARCHAR (25) NOT NULL,
    [dCreated]    DATETIME      CONSTRAINT [df_GameType_dCreated] DEFAULT (getdate()) NOT NULL,
    [dModified]   DATETIME      CONSTRAINT [df_GameType_dModified] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_GameType] PRIMARY KEY CLUSTERED ([GameTypeID] ASC)
);

