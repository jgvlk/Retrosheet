USE [Retrosheet]
GO


SELECT TOP 1000 * FROM [raw].[PlayerMaster]
SELECT TOP 1000 * FROM [raw].[ParkMaster]
SELECT TOP 1000 * FROM [raw].[TeamMaster]
SELECT TOP 1000 * FROM [raw].[FranchiseMaster]
SELECT TOP 1000 * FROM [raw].[Game]
SELECT TOP 1000 * FROM [raw].[Event]

SELECT TOP 1000 * FROM [stg].[Game]
SELECT TOP 1000 * FROM [stg].[Event]

SELECT TOP 1000 * FROM [dbo].[PlayerMaster]
SELECT TOP 1000 * FROM [dbo].[ParkMaster]
SELECT TOP 1000 * FROM [dbo].[TeamMaster]
SELECT TOP 1000 * FROM [dbo].[FranchiseMaster]
SELECT TOP 1000 * FROM [dbo].[Game]
SELECT TOP 1000 * FROM [dbo].[Event]


SELECT COUNT(*) FROM [raw].[PlayerMaster] -- 21284
SELECT COUNT(*) FROM [raw].[ParkMaster] -- 256
SELECT COUNT(*) FROM [raw].[TeamMaster] -- 149
SELECT COUNT(*) FROM [raw].[FranchiseMaster] -- 123
SELECT COUNT(*) FROM [raw].[Game] -- 175648
SELECT COUNT(*) FROM [raw].[Event] -- 13929772

SELECT COUNT(*) FROM [stg].[Game] -- 175648
SELECT COUNT(*) FROM [stg].[Event] -- 13929772

SELECT COUNT(*) FROM [dbo].[PlayerMaster] -- 21284
SELECT COUNT(*) FROM [dbo].[ParkMaster] -- 256
SELECT COUNT(*) FROM [dbo].[TeamMaster] -- 149
SELECT COUNT(*) FROM [dbo].[FranchiseMaster] -- 123
SELECT COUNT(*) FROM [dbo].[Game]
SELECT COUNT(*) FROM [dbo].[Event]





-- General queries

SELECT DISTINCT [HomeTeam] FROM [dbo].[Game] ORDER BY [HomeTeam]
SELECT * FROM [dbo].[Game] WHERE [HomeTeam] = 'CHN' AND YEAR([Date]) = 2016
SELECT pm.*
FROM [dbo].[Game] g
JOIN [dbo].[PlayerMaster] pm ON g.[VisitorStartingPitcher] = pm.[PlayerID]
WHERE [VisitingTeam] = 'CHN' AND YEAR([Date]) = 2016

