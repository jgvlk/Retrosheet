INSERT INTO [dbo].[Discrepancy] (
    [ID]
    ,[Player]
    ,[Year]
    ,[Team]
    ,[Type]
    ,[Pos]
    ,[Cat]
    ,[GameID]
    ,[Retro]
    ,[Official]
    ,[Cross]
    ,[Code]
    ,[Notes]
    ,[Accepted]
    ,[SourceFile]
)
SELECT
    [ID]
    ,[Player]
    ,[Year]
    ,[Team]
    ,[Type]
    ,[Pos]
    ,[Cat]
    ,[GameID]
    ,[Retro]
    ,[Official]
    ,[Cross]
    ,[Code]
    ,[Notes]
    ,[Accepted]
    ,[SourceFile]
FROM [raw].[Discrepancy]
