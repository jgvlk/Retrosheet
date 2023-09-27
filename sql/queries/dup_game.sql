USE Retrosheet
GO

if object_id('tempdb.dbo.#dupgame') is not null
	drop table #dupgame
go

if object_id('tempdb.dbo.#truedups') is not null
	drop table #truedups
go

SELECT
	*
	,[RowHash] = HASHBYTES('SHA2_512', (
	SELECT
		[GameID]
		,[Date]
		,[GameNumber]
		,[DayOfWeek]
		,[StartTime]
		,[DHUsedFlag]
		,[DayNightFlag]
		,[VisitingTeam]
		,[HomeTeam]
		,[GameSite]
		,[VisitorStartingPitcher]
		,[HomeStartingPitcher]
		,[HomePlateUmpire]
		,[FirstBaseUmpire]
		,[SecondBaseUmpire]
		,[ThirdBaseUmpire]
		,[LeftFieldUmpire]
		,[RightFieldUmpire]
		,[Attendance]
		,[PSScorer]
		,[Translator]
		,[Inputter]
		,[InputTime]
		,[EditTime]
		,[HowScored]
		,[PitchesEntered]
		,[Temperature]
		,[WindDirection]
		,[WindSpeed]
		,[FieldCondition]
		,[Precipitation]
		,[Sky]
		,[TimeOfGame]
		,[NumberOfInnings]
		,[VisitorFinalScore]
		,[HomeFinalScore]
		,[VisitorHits]
		,[HomeHits]
		,[VisitorErrors]
		,[HomeErrors]
		,[VisitorLeftOnBase]
		,[HomeLeftOnBase]
		,[WinningPitcher]
		,[LosingPitcher]
		,[SaveFor]
		,[GWRBI]
		,[VisitorBatter1]
		,[VisitorPosition1]
		,[VisitorBatter2]
		,[VisitorPosition2]
		,[VisitorBatter3]
		,[VisitorPosition3]
		,[VisitorBatter4]
		,[VisitorPosition4]
		,[VisitorBatter5]
		,[VisitorPosition5]
		,[VisitorBatter6]
		,[VisitorPosition6]
		,[VisitorBatter7]
		,[VisitorPosition7]
		,[VisitorBatter8]
		,[VisitorPosition8]
		,[VisitorBatter9]
		,[VisitorPosition9]
		,[HomeBatter1]
		,[HomePosition1]
		,[HomeBatter2]
		,[HomePosition2]
		,[HomeBatter3]
		,[HomePosition3]
		,[HomeBatter4]
		,[HomePosition4]
		,[HomeBatter5]
		,[HomePosition5]
		,[HomeBatter6]
		,[HomePosition6]
		,[HomeBatter7]
		,[HomePosition7]
		,[HomeBatter8]
		,[HomePosition8]
		,[HomeBatter9]
		,[HomePosition9]
		,[VisitingFinisher]
		,[HomeFinisher]
		,[OfficialScorer]
		,[GameType]
	  FOR XML RAW
	)
)
into #dupgame
FROM
	[raw].[Game] g
where g.GameID in (
	select GameID from (
		select GameID, count(*) as ct from raw.Game group by GameID having count(*) > 1
	) x
)
order by g.GameID


select *
into #truedups
from #dupgame
where RowHash in (
	select RowHash from (
		select RowHash, count(*) as ct from #dupgame group by RowHash having count(*) > 1
	) x
)
order by GameID


select *
from #dupgame
where RowHash not in (select distinct RowHash from #truedups)
order by GameID


-- select * from dbo.PlayerMaster
-- where RetroPlayerID in (
-- 	-- umps
-- 	'cockp201',
-- 	'cockp101',
-- 	'rogab201',
-- 	'rogab101',
-- 	'charo201',
-- 	'charo101',
-- 	'suttm201',
-- 	'suttm101',
-- 	'harrm201',
-- 	'harrm103',
-- 	-- players
-- 	'clarv101',
-- 	'clarw103')

-- WHEN [] = 'charo201' THEN 'charo101'
-- WHEN [] = 'clarv101' THEN 'clarw103'
-- WHEN [] = 'cockp201' THEN 'cockp101'
-- WHEN [] = 'harrm201' THEN 'harrm103'
-- WHEN [] = 'rogab201' THEN 'rogab101'
-- WHEN [] = 'suttm201' THEN 'suttm101'

-- UPDATE [raw].[Game]
-- SET
-- 	[FirstBaseUmpire] = CASE
-- 		WHEN [FirstBaseUmpire] = 'cockp201' THEN 'cockp101'
-- 		WHEN [FirstBaseUmpire] = 'rogab201' THEN 'rogab101'
-- 		ELSE [FirstBaseUmpire]
-- 	END,
-- 	[LosingPitcher] = CASE
-- 		WHEN [LosingPitcher] = 'clarv101' THEN 'clarw103'
-- 		ELSE [LosingPitcher]
-- 	END,
-- 	[SecondBaseUmpire] = CASE
-- 		WHEN [SecondBaseUmpire] = 'charo201' THEN 'charo101'
-- 		WHEN [SecondBaseUmpire] = 'rogab201' THEN 'rogab101'
-- 		ELSE [SecondBaseUmpire]
-- 	END,
-- 	[ThirdBaseUmpire] = CASE
-- 		WHEN [ThirdBaseUmpire] = 'suttm201' THEN 'suttm101'
-- 		WHEN [ThirdBaseUmpire] = 'harrm201' THEN 'harrm103'
-- 		WHEN [ThirdBaseUmpire] = 'cockp201' THEN 'cockp101'
-- 		ELSE [ThirdBaseUmpire]
-- 	END