USE Retrosheet
GO

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
	raw.[Game] g
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