USE [Retrosheet]
GO


IF OBJECT_ID('[fk_Game_ParkMaster]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_ParkMaster]

IF OBJECT_ID('[fk_Game_GameTypeID]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_GameTypeID]

IF OBJECT_ID('[fk_Game_PlayerMaster01]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster01]

IF OBJECT_ID('[fk_Game_PlayerMaster02]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster02]

IF OBJECT_ID('[fk_Game_PlayerMaster03]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster03]

IF OBJECT_ID('[fk_Game_PlayerMaster04]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster04]

IF OBJECT_ID('[fk_Game_PlayerMaster05]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster05]

IF OBJECT_ID('[fk_Game_PlayerMaster06]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster06]

IF OBJECT_ID('[fk_Game_PlayerMaster07]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster07]

IF OBJECT_ID('[fk_Game_PlayerMaster08]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster08]

IF OBJECT_ID('[fk_Game_PlayerMaster09]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster09]

IF OBJECT_ID('[fk_Game_PlayerMaster10]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster10]

IF OBJECT_ID('[fk_Game_PlayerMaster11]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster11]

IF OBJECT_ID('[fk_Game_PlayerMaster12]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster12]

IF OBJECT_ID('[fk_Game_PlayerMaster13]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster13]

IF OBJECT_ID('[fk_Game_PlayerMaster14]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster14]

IF OBJECT_ID('[fk_Game_PlayerMaster15]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster15]

IF OBJECT_ID('[fk_Game_PlayerMaster16]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster16]

IF OBJECT_ID('[fk_Game_PlayerMaster17]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster17]

IF OBJECT_ID('[fk_Game_PlayerMaster18]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster18]

IF OBJECT_ID('[fk_Game_PlayerMaster19]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster19]

IF OBJECT_ID('[fk_Game_PlayerMaster20]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster20]

IF OBJECT_ID('[fk_Game_PlayerMaster21]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster21]

IF OBJECT_ID('[fk_Game_PlayerMaster22]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster22]

IF OBJECT_ID('[fk_Game_PlayerMaster23]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster23]

IF OBJECT_ID('[fk_Game_PlayerMaster24]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster24]

IF OBJECT_ID('[fk_Game_PlayerMaster25]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster25]

IF OBJECT_ID('[fk_Game_PlayerMaster26]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster26]

IF OBJECT_ID('[fk_Game_PlayerMaster27]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster27]

IF OBJECT_ID('[fk_Game_PlayerMaster28]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster28]

IF OBJECT_ID('[fk_Game_PlayerMaster29]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster29]

IF OBJECT_ID('[fk_Game_PlayerMaster30]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster30]

IF OBJECT_ID('[fk_Game_PlayerMaster31]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster31]

IF OBJECT_ID('[fk_Game_PlayerMaster32]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster32]

IF OBJECT_ID('[fk_Game_PlayerMaster33]') IS NOT NULL
	ALTER TABLE [dbo].[Game] DROP CONSTRAINT [fk_Game_PlayerMaster33]

IF OBJECT_ID('[fk_Event_PlayerMaster01]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster01]

IF OBJECT_ID('[fk_Event_PlayerMaster02]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster02]

IF OBJECT_ID('[fk_Event_PlayerMaster03]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster03]

IF OBJECT_ID('[fk_Event_PlayerMaster04]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster04]

IF OBJECT_ID('[fk_Event_PlayerMaster05]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster05]

IF OBJECT_ID('[fk_Event_PlayerMaster06]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster06]

IF OBJECT_ID('[fk_Event_PlayerMaster07]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster07]

IF OBJECT_ID('[fk_Event_PlayerMaster08]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster08]

IF OBJECT_ID('[fk_Event_PlayerMaster09]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster09]

IF OBJECT_ID('[fk_Event_PlayerMaster10]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster10]

IF OBJECT_ID('[fk_Event_PlayerMaster11]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster11]

IF OBJECT_ID('[fk_Event_PlayerMaster12]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster12]

IF OBJECT_ID('[fk_Event_PlayerMaster13]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster13]

IF OBJECT_ID('[fk_Event_PlayerMaster14]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster14]

IF OBJECT_ID('[fk_Event_PlayerMaster15]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster15]

IF OBJECT_ID('[fk_Event_PlayerMaster16]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster16]

IF OBJECT_ID('[fk_Event_PlayerMaster17]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster17]

IF OBJECT_ID('[fk_Event_PlayerMaster18]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster18]

IF OBJECT_ID('[fk_Event_PlayerMaster19]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster19]

IF OBJECT_ID('[fk_Event_PlayerMaster20]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster20]

IF OBJECT_ID('[fk_Event_PlayerMaster21]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster21]

IF OBJECT_ID('[fk_Event_PlayerMaster22]') IS NOT NULL
	ALTER TABLE [dbo].[Event] DROP CONSTRAINT [fk_Event_PlayerMaster22]
GO

