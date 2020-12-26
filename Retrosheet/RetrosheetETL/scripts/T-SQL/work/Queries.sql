USE [Retrosheet]
GO


SELECT TOP 1000 * FROM [raw].[PlayerMaster]
SELECT TOP 1000 * FROM [raw].[ParkMaster]
SELECT TOP 1000 * FROM [raw].[Game]
SELECT TOP 1000 * FROM [raw].[Event]

SELECT TOP 1000 * FROM [dbo].[PlayerMaster]
SELECT TOP 1000 * FROM [dbo].[ParkMaster]
SELECT TOP 1000 * FROM [dbo].[Game]
SELECT TOP 1000 * FROM [dbo].[Event]


SELECT COUNT(*) FROM [raw].[PlayerMaster] -- 21284
SELECT COUNT(*) FROM [raw].[ParkMaster] -- 256
SELECT COUNT(*) FROM [raw].[Game] -- 81631
SELECT COUNT(*) FROM [raw].[Event] -- 6485082

SELECT COUNT(*) FROM [dbo].[PlayerMaster] -- 21284
SELECT COUNT(*) FROM [dbo].[ParkMaster] -- 256
SELECT COUNT(*) FROM [dbo].[Game] -- 81631
SELECT COUNT(*) FROM [dbo].[Event] -- 6485082


SELECT * FROM [dbo].[Game] WHERE [HomeTeam] = 'CHC' AND YEAR([Date]) = 2016

