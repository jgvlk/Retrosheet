use [Retrosheet]
go


select top 1000 * from dbo.Game
select top 1000 * from dbo.Event
select * from dbo.GameType

select top 1000 * from dbo.vw_FirstInningRuns




DROP TABLE #FirstInnRuns

SELECT
	[PitcherID]
	,pm.[FirstName]
	,pm.[LastName]
	,SUM([TotalGames]) AS [TotalGames]
	,SUM([TotalGames_FirstInnRunsAllowed]) AS [TotalGames_FirstInnRunsAllowed]
	,CONVERT(DECIMAL(4,4), CONVERT(FLOAT, SUM([TotalGames_FirstInnRunsAllowed]))/CONVERT(FLOAT, SUM([TotalGames]))) AS [FirstInnRunsPercentage]
INTO #FirstInnRuns
FROM
	(
		SELECT
			YEAR(vw.[Date]) AS [Year]
			,gt.[GameType]
			,vw.[VisitorStartingPitcher] AS [PitcherID]
			,COUNT(DISTINCT vw.[GameID]) AS [TotalGames]
			,SUM([Home_FirstInnRunsFlag]) AS [TotalGames_FirstInnRunsAllowed]
			,CONVERT(DECIMAL(4,4), CONVERT(FLOAT, SUM([Home_FirstInnRunsFlag]))/CONVERT(FLOAT, COUNT(DISTINCT vw.[GameID]))) AS [FirstInnRunsPercentage]
		FROM
			[dbo].[vw_FirstInningRuns] vw
			JOIN [dbo].[GameType] gt ON vw.[GameTypeID] = gt.[GameTypeID]
		--WHERE
		--	YEAR(vw.[Date]) >= 2015 AND
		--	gt.[GameType] = 'Regular Season'
		GROUP BY
			YEAR(vw.[Date])
			,gt.[GameType]
			,vw.[VisitorStartingPitcher]

		UNION ALL

		SELECT
			YEAR(vw.[Date]) AS [Year]
			,gt.[GameType]
			,vw.[HomeStartingPitcher] AS [PitcherID]
			,COUNT(DISTINCT vw.[GameID]) AS [TotalGames]
			,SUM([Visitor_FirstInnRunsFlag]) AS [TotalGames_FirstInnRunsAllowed]
			,CONVERT(DECIMAL(4,4), CONVERT(FLOAT, SUM([Visitor_FirstInnRunsFlag]))/CONVERT(FLOAT, COUNT(DISTINCT vw.[GameID]))) AS [FirstInnRunsPercentage]
		FROM
			[dbo].[vw_FirstInningRuns] vw
			JOIN [dbo].[GameType] gt ON vw.[GameTypeID] = gt.[GameTypeID]
		--WHERE
		--	YEAR(vw.[Date]) >= 2015 AND
		--	gt.[GameType] = 'Regular Season'
		GROUP BY
			YEAR(vw.[Date])
			,gt.[GameType]
			,vw.[HomeStartingPitcher]
	) x
	JOIN [dbo].[PlayerMaster] pm ON x.[PitcherID] = pm.[PlayerID]
GROUP BY
	[PitcherID]
	,pm.[FirstName]
	,pm.[LastName]
HAVING
	SUM([TotalGames]) > 30
ORDER BY
	[FirstInnRunsPercentage] DESC
GO





SELECT * FROM #FirstInnRuns ORDER BY [FirstInnRunsPercentage] DESC

SELECT
	COUNT(DISTINCT [PitcherID]) AS [PitcherQueryCt]
	,SUM([TotalGames]) AS [TotalGames]
	,SUM([TotalGames_FirstInnRunsAllowed]) AS [TotalGames_FirstInnRunsAllowed]
	,CONVERT(DECIMAL(4,4), CONVERT(FLOAT, SUM([TotalGames_FirstInnRunsAllowed]))/CONVERT(FLOAT, SUM([TotalGames]))) AS [FirstInnRunsPercentage]
FROM
	#FirstInnRuns
WHERE
	( [FirstName] LIKE 'Joey' AND [LastName] LIKE 'Lucchesi' ) OR
	( [FirstName] LIKE 'Trevor' AND [LastName] LIKE 'Williams' )

