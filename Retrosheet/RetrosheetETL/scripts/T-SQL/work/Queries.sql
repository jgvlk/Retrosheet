USE [Retrosheet]
GO


SELECT TOP 1000 * FROM [raw].[PlayerMaster]
SELECT TOP 1000 * FROM [raw].[ParkMaster]
SELECT TOP 1000 * FROM [raw].[TeamMaster]
SELECT TOP 1000 * FROM [raw].[FranchiseMaster]
SELECT TOP 1000 * FROM [raw].[Game]
SELECT TOP 1000 * FROM [raw].[Event]

SELECT * FROM [stg].[PlayerMaster]
SELECT * FROM [stg].[ParkMaster]
SELECT * FROM [stg].[TeamMaster]
SELECT * FROM [stg].[FranchiseMaster]
SELECT TOP 1000 * FROM [stg].[Game]
SELECT TOP 1000 * FROM [stg].[Event]

SELECT * FROM [dbo].[PlayerMaster]
SELECT * FROM [dbo].[ParkMaster]
SELECT * FROM [dbo].[TeamMaster]
SELECT * FROM [dbo].[FranchiseMaster]
SELECT TOP 1000 * FROM [dbo].[Game]
SELECT TOP 1000 * FROM [dbo].[Event]


SELECT COUNT(*) FROM [raw].[PlayerMaster] -- 21284
SELECT COUNT(*) FROM [raw].[ParkMaster] -- 256
SELECT COUNT(*) FROM [raw].[TeamMaster] -- 149
SELECT COUNT(*) FROM [raw].[FranchiseMaster] -- 123
SELECT COUNT(*) FROM [raw].[Game] -- 175648
SELECT COUNT(*) FROM [raw].[Event] -- 13929772

SELECT COUNT(*) FROM [stg].[PlayerMaster] -- 21284
SELECT COUNT(*) FROM [stg].[ParkMaster] -- 256
SELECT COUNT(*) FROM [stg].[TeamMaster] -- 149
SELECT COUNT(*) FROM [stg].[FranchiseMaster] -- 123
SELECT COUNT(*) FROM [stg].[Game] -- 175648
SELECT COUNT(*) FROM [stg].[Event] -- 13929772

SELECT COUNT(*) FROM [dbo].[PlayerMaster] -- 21284
SELECT COUNT(*) FROM [dbo].[ParkMaster] -- 256
SELECT COUNT(*) FROM [dbo].[TeamMaster] -- 149
SELECT COUNT(*) FROM [dbo].[FranchiseMaster] -- 123
SELECT COUNT(*) FROM [dbo].[Game]
SELECT COUNT(*) FROM [dbo].[Event]



--drop table [stg].[PlayerMaster] -- 21284
--drop table [stg].[ParkMaster] -- 256
--drop table [stg].[TeamMaster] -- 149
--drop table [stg].[FranchiseMaster] -- 123
--drop table [stg].[Game] -- 175648
--drop table [stg].[Event] -- 13929772

--drop table [dbo].[PlayerMaster] -- 21284
--drop table [dbo].[ParkMaster] -- 256
--drop table [dbo].[TeamMaster] -- 149
--drop table [dbo].[FranchiseMaster] -- 123
--drop table [dbo].[Game]
--drop table [dbo].[Event]





-- ETL PROCS

declare @rc int
exec @rc = dbo.pr_RetrosheetETL_RawToStg 1
print @rc
go


declare @rc int
exec @rc = dbo.pr_RetrosheetETL_StgToDbo 1
print @rc
go





-- SAMPLE DATA

-- Cubs 2016 Game data
IF ( SELECT OBJECT_ID('tempdb.dbo.#Game_CHN_2016') ) IS NOT NULL
    DROP TABLE #Game_CHN_2016

SELECT
    *

    INTO
        #Game_CHN_2016
    FROM
        [stg].[Game]
    WHERE
        ( [HomeTeam] = 'CHN' OR [VisitingTeam] = 'CHN' ) AND
        YEAR([Date]) = 2016
    ORDER BY
        [Date]


-- Cubs 2016 Event data
IF ( SELECT OBJECT_ID('tempdb.dbo.#Event_CHN_2016') ) IS NOT NULL
    DROP TABLE #Event_CHN_2016

SELECT
	e.*
	,g.[GameType]

	INTO
		#Event_CHN_2016
	FROM
		[stg].[Event] e
		JOIN #Game_CHN_2016 g ON e.[RetroGameID] = g.[RetroGameID]
	ORDER BY
		g.[Date]
		,e.[EventNum]


-- Cubs pitcher wins
IF ( SELECT OBJECT_ID('tempdb.dbo.#PitcherWins1') ) IS NOT NULL
    DROP TABLE #PitcherWins1

SELECT
    g.[GameType]
	,g.[Date]
    ,g.[WinningPitcher]
    ,g.[LosingPitcher]
    ,g.[HomeTeam]
    ,g.[VisitingTeam]
    ,g.[HomeFinalScore]
    ,g.[VisitorFinalScore]
    ,CASE
        WHEN [HomeTeam] = 'CHN' AND [HomeFinalScore] > [VisitorFinalScore] THEN 'W'
        WHEN [HomeTeam] = 'CHN' AND [HomeFinalScore] < [VisitorFinalScore] THEN 'L'
        WHEN [VisitingTeam] = 'CHN' AND [HomeFinalScore] < [VisitorFinalScore] THEN 'W'
        WHEN [VisitingTeam] = 'CHN' AND [HomeFinalScore] > [VisitorFinalScore] THEN 'L'
    END AS [CHNResult]
    INTO
        #PitcherWins1
    FROM
        #Game_CHN_2016 g


SELECT
    pw2.[GameType]
	,pm.[FirstName]
    ,pm.[LastName]
    ,SUM(pw2.[Win]) AS [Win]
    ,SUM(pw2.[Loss]) AS [Loss]

    FROM (

        SELECT
            pw1.*
            ,CASE WHEN pw1.[CHNResult] = 'W' THEN 1 ELSE 0 END AS [Win]
            ,CASE WHEN pw1.[CHNResult] = 'L' THEN 1 ELSE 0 END AS [Loss]

            FROM (

                SELECT
                    *
                    ,CASE
                        WHEN [CHNResult] = 'W' THEN [WinningPitcher]
                        WHEN [CHNResult] = 'L' THEN [LosingPitcher]
                        ELSE NULL
                    END AS [CubsPitcherOfRecord]

                    FROM
                        #PitcherWins1

            ) pw1
            
        ) pw2
        LEFT JOIN [dbo].[PlayerMaster] pm ON pw2.[CubsPitcherOfRecord] = pm.[RetroPlayerID]


    GROUP BY
        pw2.[GameType]
		,pm.[FirstName]
        ,pm.[LastName]
    ORDER BY
		[GameType]
        ,[Win] DESC





-- QUERIES

SELECT * FROM [stg].[TeamMaster]
SELECT * FROM [stg].[FranchiseMaster]
SELECT * FROM [stg].[ParkMaster]
SELECT * FROM [stg].[PlayerMaster]


SELECT TOP 1000 * FROM [stg].[Game]
SELECT TOP 1000 * FROM [stg].[Event]


SELECT COUNT([RetroGameID]) FROM [stg].[Game]
SELECT COUNT(DISTINCT [RetroGameID]) FROM [stg].[Game]

SELECT COUNT([RetroGameID]) FROM [stg].[Event]
SELECT COUNT(DISTINCT [RetroGameID]) FROM [stg].[Event]
SELECT COUNT(*) FROM (
SELECT DISTINCT [RetroGameID], [EventNum] FROM [stg].[Event]
) X



SELECT TOP 1000 * FROM [stg].[Game]
SELECT * FROM [stg].[vw_CurrentTeams]




SELECT
	t.[CurrentRetroFranchiseID]
	,COUNT(DISTINCT g1.[RetroGameID]) AS [AwayGames]
	,COUNT(DISTINCT g2.[RetroGameID]) AS [HomeGames]
FROM
	[stg].[vw_CurrentTeams] t
	JOIN [stg].[Game] g1 ON t.[CurrentRetroFranchiseID] = g1.[VisitingTeam]
	JOIN [stg].[Game] g2 ON t.[CurrentRetroFranchiseID] = g2.[HomeTeam]
WHERE
	YEAR(g1.[Date]) = 2020 AND
	YEAR(g2.[Date]) = 2020 AND
	g1.[GameType] = 'reg' AND
	g2.[GameType] = 'reg'
GROUP BY
	t.[CurrentRetroFranchiseID]