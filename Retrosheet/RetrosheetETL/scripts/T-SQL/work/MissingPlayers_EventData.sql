USE [Retrosheet]
GO


SELECT PlayerID into #person FROM [raw].[PlayerMaster]

--drop table aud.MissingPlayers_EventData
--drop table #MissingPlayers_EventData
create table #MissingPlayers_EventData (
	[RecordDate] DATE NULL
	,ID VARCHAR(50) NULL
	,SrcCol VARCHAR(50) NULL
)
go

INSERT INTO #MissingPlayers_EventData
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [Batter]										  , '[Batter]'								 from raw.Event where [Batter]									not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [ResBatter]									  , '[ResBatter]'							 from raw.Event where [ResBatter]								not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [Pitcher]									  , '[Pitcher]'								 from raw.Event where [Pitcher]									not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [ResPitcher]								      , '[ResPitcher]'							 from raw.Event where [ResPitcher]								not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [Catcher]									  , '[Catcher]'								 from raw.Event where [Catcher]									not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [FirstBase]									  , '[FirstBase]'							 from raw.Event where [FirstBase]								not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [SecondBase]								      , '[SecondBase]'							 from raw.Event where [SecondBase]								not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [ThirdBase]									  , '[ThirdBase]'							 from raw.Event where [ThirdBase]								not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [Shortstop]									  , '[Shortstop]'							 from raw.Event where [Shortstop]								not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [LeftField]									  , '[LeftField]'							 from raw.Event where [LeftField]								not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [CenterField]								  , '[CenterField]'							 from raw.Event where [CenterField]								not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [RightField]								      , '[RightField]'							 from raw.Event where [RightField]								not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [FirstRunner]								  , '[FirstRunner]'							 from raw.Event where [FirstRunner]								not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [SecondRunner]								  , '[SecondRunner]'						 from raw.Event where [SecondRunner]							not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [ThirdRunner]								  , '[ThirdRunner]'							 from raw.Event where [ThirdRunner]								not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [ResponsiblePitcherForRunnerOn1st]			  , '[ResponsiblePitcherForRunnerOn1st]'	 from raw.Event where [ResponsiblePitcherForRunnerOn1st]		not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [ResponsiblePitcherForRunnerOn2nd]			  , '[ResponsiblePitcherForRunnerOn2nd]'	 from raw.Event where [ResponsiblePitcherForRunnerOn2nd]		not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [ResponsiblePitcherForRunnerOn3rd]			  , '[ResponsiblePitcherForRunnerOn3rd]'	 from raw.Event where [ResponsiblePitcherForRunnerOn3rd]		not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [RunnerRemovedForPinchRunnerOn1st]			  , '[RunnerRemovedForPinchRunnerOn1st]'	 from raw.Event where [RunnerRemovedForPinchRunnerOn1st]		not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [RunnerRemovedForPinchRunnerOn1st2nd]		  , '[RunnerRemovedForPinchRunnerOn1st2nd]'	 from raw.Event where [RunnerRemovedForPinchRunnerOn1st2nd]		not in (select * from #person)
union all
select cast(substring(GameID,4,4) as nvarchar) + '-' + cast(substring(GameID,8,2) as nvarchar) + '-' + cast(substring(GameID,10,2) as nvarchar), [RunnerRemovedForPinchRunnerOn1st3rd]		  , '[RunnerRemovedForPinchRunnerOn1st3rd]'	 from raw.Event where [RunnerRemovedForPinchRunnerOn1st3rd]		not in (select * from #person)
go

select distinct * into aud.MissingPlayers_EventData from #MissingPlayers_EventData
go



select * from aud.MissingPlayers_EventData


select distinct(id) from aud.MissingPlayers_EventData

