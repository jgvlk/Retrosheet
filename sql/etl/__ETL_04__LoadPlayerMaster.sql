INSERT INTO [dbo].[PlayerMaster] (
    [RetroPlayerID]
    ,[FirstName]
    ,[LastName]
    ,[Nickname]
    ,[Birthdate]
    ,[BirthCity]
    ,[BirthState]
    ,[BirthCountry]
    ,[PlayerDebut]
    ,[PlayerLastGame]
    ,[ManagerDebut]
    ,[ManagerLastGame]
    ,[CoachDebut]
    ,[CoachLastGame]
    ,[UmpDebut]
    ,[UmpLastGame]
    ,[DeathDate]
    ,[DeathCity]
    ,[DeathState]
    ,[DeathCountry]
    ,[Bats]
    ,[Throws]
    ,[Height]
    ,[Weight]
    ,[Cemetery]
    ,[CemeteryCity]
    ,[CemeteryState]
    ,[CemeteryCountry]
    ,[CemeteryNote]
    ,[BirthName]
    ,[NameChg]
    ,[BatChg]
    ,[IsHof]
)
SELECT
    [PlayerID] AS [RetroPlayerID]
    ,[First] AS [FirstName]
    ,[Last] AS [LastName]
    ,[Nickname] AS [Nickname]
    ,TRY_CAST([Birthdate] AS DATE) AS [Birthdate]
    ,[BirthCity] AS [BirthCity]
    ,[BirthState] AS [BirthState]
    ,[BirthCountry] AS [BirthCountry]
    ,TRY_CAST([PlayDebut] AS DATE) AS [PlayerDebut]
    ,TRY_CAST([PlayLastGame] AS DATE) AS [PlayerLastGame]
    ,TRY_CAST([MgrDebut] AS DATE) AS [ManagerDebut]
    ,TRY_CAST([MgrLastGame] AS DATE) AS [ManagerLastGame]
    ,TRY_CAST([CoachDebut] AS DATE) AS [CoachDebut]
    ,TRY_CAST([CoachLastGame] AS DATE) AS [CoachLastGame]
    ,TRY_CAST([UmpDebut] AS DATE) AS [UmpDebut]
    ,TRY_CAST([UmpLastGame] AS DATE) AS [UmpLastGame]
    ,TRY_CAST([DeathDate] AS DATE) AS [DeathDate]
    ,[DeathCity] AS [DeathCity]
    ,[DeathState] AS [DeathState]
    ,[DeathCountry] AS [DeathCountry]
    ,[Bats] AS [Bats]
    ,[Throws] AS [Throws]
    ,[Height] AS [Height]
    ,CONVERT(INT, (CONVERT(DECIMAL, [Weight]))) AS [Weight]
    ,[Cemetery] AS [Cemetery]
    ,[CemeCity] AS [CemeteryCity]
    ,[CemeState] AS [CemeteryState]
    ,[CemeCountry] AS [CemeteryCountry]
    ,[CemeNote] AS [CemeteryNote]
    ,[BirthName] AS [BirthName]
    ,[NameChg] AS [NameChg]
    ,[BatChg] AS [BatChg]
    ,CASE WHEN [Hof] IS NOT NULL THEN 1 ELSE 0 END AS [IsHof]
FROM
    [raw].[PlayerMaster]
ORDER BY
    [RetroPlayerID]
