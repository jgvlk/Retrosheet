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
SELECT COUNT(*) FROM [dbo].[Game] -- 175648
SELECT COUNT(*) FROM [dbo].[Event] -- 13929772





-- SAMPLE DATA

-- Cubs 2016 Game data
IF ( SELECT OBJECT_ID('tempdb.dbo.#Game_CHN_2016') ) IS NOT NULL
    DROP TABLE #Game_CHN_2016

SELECT
    g.*
	,gt.[GameType]

    INTO
        #Game_CHN_2016
    FROM
        [dbo].[Game] g
		JOIN [dbo].[GameType] gt ON g.[GameTypeID] = gt.[GameTypeID]
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
		[dbo].[Event] e
		JOIN #Game_CHN_2016 g ON e.[GameID] = g.[GameID]
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
        LEFT JOIN [dbo].[PlayerMaster] pm ON pw2.[CubsPitcherOfRecord] = pm.[PlayerID]


    GROUP BY
        pw2.[GameType]
		,pm.[FirstName]
        ,pm.[LastName]
    ORDER BY
		[GameType]
        ,[Win] DESC





-- QUERIES

SELECT * FROM [dbo].[TeamMaster]
SELECT * FROM [dbo].[FranchiseMaster]
SELECT * FROM [dbo].[ParkMaster]
SELECT * FROM [dbo].[PlayerMaster]


SELECT TOP 1000 * FROM [dbo].[Game]
SELECT TOP 1000 * FROM [dbo].[Event]

