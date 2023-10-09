INSERT INTO [dbo].[Schedule] (
    [Date]
    ,[GameNum]
    ,[DayOfWeek]
    ,[VisitingTeam]
    ,[VisitingTeamLeague]
    ,[VisitingTeamSeasonGameNum]
    ,[HomeTeam]
    ,[HomeTeamLeague]
    ,[HomeTeamSeasonGameNum]
    ,[GameStartDuring]
    ,[PostponementIndicator]
    ,[DateOfMakeup]
)
SELECT
    [Date] = CONVERT(DATE, SUBSTRING([Date], 1, 4) + '-' + SUBSTRING([Date], 5, 2) + '-' + SUBSTRING([Date], 7, 2))
    ,[GameNum]
    ,[DayOfWeek]
    ,[VisitingTeam]
    ,[VisitingTeamLeague]
    ,[VisitingTeamSeasonGameNum]
    ,[HomeTeam]
    ,[HomeTeamLeague]
    ,[HomeTeamSeasonGameNum]
    ,[GameStartDuring]
    ,[PostponementIndicator]
    ,[DateOfMakeup] = SUBSTRING(DateOfMakeup, 1, 4) + '-' + SUBSTRING(DateOfMakeup, 5, 2) + '-' + SUBSTRING(DateOfMakeup, 7, 2)
FROM [raw].[Schedule]
ORDER BY
    [Date]
    ,[GameNum]
    ,[VisitingTeamSeasonGameNum]
    ,[HomeTeamSeasonGameNum]
