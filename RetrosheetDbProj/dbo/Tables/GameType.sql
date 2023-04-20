CREATE TABLE [dbo].[GameType] (
    [GameTypeID] INT          NOT NULL,
    [GameType]   VARCHAR (25) NOT NULL,
    CONSTRAINT [pk_GameType] PRIMARY KEY CLUSTERED ([GameTypeID] ASC)
);

