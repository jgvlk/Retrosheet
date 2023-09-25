MERGE [dbo].[GameType] t USING (
    VALUES
        (1, 'Regular Season')
        ,(2, 'Postseason')
        ,(3, 'All-Star')
) AS s ([GameTypeID], [GameType]) ON t.[GameTypeID] = s.[GameTypeID]
WHEN MATCHED AND (t.[GameType] <> s.[GameType]) THEN
    UPDATE SET
        [GameType] = s.[GameType]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [GameTypeID]
        ,[GameType]
    )
    VALUES (
        s.[GameTypeID]
        ,s.[GameType]
    )
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
