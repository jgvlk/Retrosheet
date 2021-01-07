CREATE VIEW [dbo].[vw_CurrentParks]
AS
SELECT
	[ParkID]
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
	[dbo].[ParkMaster]
WHERE
	[End] IS NULL
GO

