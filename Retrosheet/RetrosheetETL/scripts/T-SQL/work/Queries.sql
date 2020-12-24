USE [Retrosheet]
GO


SELECT TOP 1000 * FROM [raw].[PlayerMaster]
SELECT TOP 1000 * FROM [raw].[ParkMaster]
SELECT TOP 1000 * FROM [raw].[Game]
SELECT TOP 1000 * FROM [raw].[Event]



select distinct Date from raw.Game order by Date
select distinct cast(Date as Date) as Date from raw.Game order by Date

select distinct dateadd(d,cast(date as int),'1901-01-01') as date from raw.Game order by Date

select distinct len(Date) from raw.Game

-- DATE TRANSFORMATION
select top 1000 cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), * from raw.Game







SELECT TOP 1000 * FROM [raw].[Game] ORDER BY DATE DESC


SELECT
	distinct len(DayOfWeek) from raw.Game
