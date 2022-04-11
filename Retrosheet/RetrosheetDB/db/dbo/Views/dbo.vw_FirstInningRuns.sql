CREATE VIEW [dbo].[vw_FirstInningRuns]
AS
SELECT
	a.*
	,CASE WHEN a.[VisScore_Inn1] + a.[HomeScore_Inn1] > 0 THEN 1 ELSE 0 END AS [FirstInnRunsFlag]
	,CASE WHEN a.[VisScore_Inn1] > 0 THEN 1 ELSE 0 END AS [Visitor_FirstInnRunsFlag]
	,CASE WHEN a.[HomeScore_Inn1] > 0 THEN 1 ELSE 0 END AS [Home_FirstInnRunsFlag]
FROM
	(
		SELECT
			g.[GameID]
			,g.[Date]
			,g.[GameTypeID]
			,e.[Inning]
			,g.[VisitorStartingPitcher]
			,MAX(e.[HomeScore]) AS [HomeScore_Inn1]
			,g.[HomeStartingPitcher]
			,MAX(e.[VisScore]) AS [VisScore_Inn1]
		FROM
			[dbo].[Game] g
			JOIN [dbo].[Event] e ON g.[GameID] = e.[GameID]
		WHERE
			e.[Inning] = 1
		GROUP BY
			g.[GameID]
			,g.[Date]
			,g.[GameTypeID]
			,e.[Inning]
			,g.[VisitorStartingPitcher]
			,g.[HomeStartingPitcher]

	) a
GO

