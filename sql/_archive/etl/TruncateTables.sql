USE [Retrosheet]
GO


-- [raw]

TRUNCATE TABLE [raw].[PlayerMaster]
TRUNCATE TABLE [raw].[ParkMaster]
TRUNCATE TABLE [raw].[FranchiseMaster]
TRUNCATE TABLE [raw].[TeamMaster]
TRUNCATE TABLE [raw].[Game]
TRUNCATE TABLE [raw].[Event]
GO


-- [stg]

TRUNCATE TABLE [stg].[PlayerMaster]
TRUNCATE TABLE [stg].[ParkMaster]
TRUNCATE TABLE [stg].[FranchiseMaster]
TRUNCATE TABLE [stg].[TeamMaster]
TRUNCATE TABLE [stg].[Game]
TRUNCATE TABLE [stg].[Event]
GO


-- [dbo]

TRUNCATE TABLE [dbo].[PlayerMaster]
TRUNCATE TABLE [dbo].[ParkMaster]
TRUNCATE TABLE [dbo].[FranchiseMaster]
TRUNCATE TABLE [dbo].[TeamMaster]
TRUNCATE TABLE [dbo].[Game]
TRUNCATE TABLE [dbo].[Event]
GO

