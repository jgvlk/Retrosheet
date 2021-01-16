CREATE FUNCTION [dbo].[udf_MLBGameIDConstructor]()
RETURNS TABLE 
AS
RETURN 
(
	SELECT
		[GameID]
		,[RetroGameID]
		,[Date]
		,REPLACE([Date], '-', '_') + '_' + LOWER([VisitingTeam]) + 'mlb_' + LOWER([HomeTeam]) + 'mlb_' + ( CASE WHEN [GameNumber] IN (0, 1) THEN '1' ELSE CONVERT(VARCHAR(1), [GameNumber]) END ) AS [MLBGameID]
	FROM
		[dbo].[Game]
)
GO

