select GameID, EventNum, SourceFile, count(*) as ct from raw.Event group by GameID, EventNum, SourceFile having count(*) > 1
select GameID, SourceFile, count(*) as ct from raw.Game group by GameId, SourceFile having count(*) > 1


select * from raw.Event where GameID = 'BLG194905152' and EventNum = '10' and SourceFile = 'event_1949_EVR.csv'

select * from raw.Game where GameID = 'BLG194905152' and SourceFile = 'game_1949_EVR.csv'



select GameID, EventNum, count(*) as ct from raw.Event 
WHERE
    RIGHT([SourceFile], 7) <> 'EVR.csv'
group by GameID, EventNum having count(*) > 1


select RetroGameID, count(*) as ct from dbo.Game group by RetroGameID having count(*) > 1