USE [Retrosheet]
GO


SELECT TOP 1000 * FROM [raw].[PlayerMaster]
SELECT TOP 1000 * FROM [raw].[ParkMaster]
SELECT TOP 1000 * FROM [raw].[Game]
SELECT TOP 1000 * FROM [raw].[Event]


select count(*) from [dbo].[PlayerMaster]
SELECT count(*) FROM [dbo].[ParkMaster]
SELECT count(*) FROM [dbo].[Game]
SELECT count(*) FROM [dbo].[Event]


select count(*) from [raw].[PlayerMaster] -- 21284
SELECT count(*) FROM [raw].[ParkMaster] -- 256
SELECT count(*) FROM [raw].[Game] -- 81631
SELECT count(*) FROM [raw].[Event] -- 6485082

