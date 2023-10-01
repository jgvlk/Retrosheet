use Retrosheet
go


select count(*) from raw.Game
select count(*) from raw.Event


select top 1000 * from raw.Game
select top 1000 * from raw.Event


--truncate table raw.Game
--truncate table raw.Event


select top 100 * from raw.Schedule
select top 100 * from raw.GameLog
select top 100 * from raw.Discrepancy

select * from dbo.Schedule
