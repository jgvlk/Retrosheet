use Retrosheet
go


select count(*) from raw.Game
select count(*) from raw.Event


select top 1000 * from raw.Game
select top 1000 * from raw.Event


--truncate table raw.Game
--truncate table raw.Event


select count(*) from raw.Schedule
select count(*) from raw.GameLog
