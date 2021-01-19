CREATE FUNCTION [dbo].[udf_MLBGameIDConstructor]()
RETURNS TABLE 
AS
RETURN 
(
	SELECT
		g.[GameID]
		,g.[GameTypeID]
		,gt.[GameType]
		,g.[RetroGameID]
		,g.[Date]
		,CASE
			WHEN g.[GameTypeID] IN (1, 2) THEN REPLACE(g.[Date], '-', '_') + '_' + LOWER(g.[VisitingTeam]) + 'mlb_' + LOWER(g.[HomeTeam]) + 'mlb_' + ( CASE WHEN g.[GameNumber] IN (0, 1) THEN '1' ELSE CONVERT(VARCHAR(1), g.[GameNumber]) END )
			WHEN g.[GameTypeID] = 3 THEN REPLACE(g.[Date], '-', '_') + '_' +
			(
				CASE
					WHEN g.[VisitingTeam] LIKE 'NL%' THEN 'nasmlb_aasmlb_1'
					WHEN g.[VisitingTeam] LIKE 'AL%' THEN 'aasmlb_nasmlb_1'
				END
			)
			ELSE 'ERROR'
		END AS [MLBGameID]
	FROM
		[dbo].[Game] g
		JOIN [dbo].[GameType] gt ON g.[GameTypeID] = gt.[GameTypeID]
)
GO

