﻿CREATE TABLE [stg].[ParkMaster] (
    [StgParkID]   INT           IDENTITY (1, 1) NOT NULL,
    [RetroParkID] CHAR (5)      NOT NULL,
    [Name]        VARCHAR (50)  NULL,
    [AKA]         VARCHAR (50)  NULL,
    [City]        VARCHAR (25)  NULL,
    [State]       VARCHAR (10)  NULL,
    [Start]       DATE          NULL,
    [End]         DATE          NULL,
    [League]      CHAR (2)      NULL,
    [Notes]       VARCHAR (100) NULL,
    [RowHash]     NVARCHAR (64) NULL,
    [dCreated]    DATETIME      CONSTRAINT [df_ParkMaster_dCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_ParkMaster] PRIMARY KEY CLUSTERED ([StgParkID] ASC)
);
