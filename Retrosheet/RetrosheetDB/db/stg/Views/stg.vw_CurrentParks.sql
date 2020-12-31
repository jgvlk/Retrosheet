CREATE VIEW [stg].[vw_CurrentParks]
AS
SELECT
	[StgParkID]
	,[RetroParkID]
	,[Name]
	,[AKA]
	,[City]
	,[State]
	,[Start]
	,[End]
	,[League]
	,[Notes]
FROM
	[stg].[ParkMaster]
WHERE
	[End] IS NULL
GO

