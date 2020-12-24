USE [Retrosheet]
GO


SELECT PlayerID into #person FROM [raw].[PlayerMaster]

--drop table aud.MissingPlayers_GameData
--drop table #MissingPlayers_GameData
create table #MissingPlayers_GameData (
	[RecordDate] DATE NULL
	,ID VARCHAR(50) NULL
	,SrcCol VARCHAR(50) NULL
)
go

INSERT INTO #MissingPlayers_GameData
select CAST([Date] as DATE),[VisitorStartingPitcher], '[VisitorStartingPitcher]' from raw.Game where [VisitorStartingPitcher] not in (select * from #person)
union all
select CAST([Date] as DATE), [HomeStartingPitcher], '[HomeStartingPitcher]'	from raw.Game where 						   [HomeStartingPitcher]         not in (select * from #person)  
union all
select CAST([Date] as DATE), [HomePlateUmpire], '[HomePlateUmpire]'		from raw.Game where 						   [HomePlateUmpire]			 not in (select * from #person)
union all
select CAST([Date] as DATE), [FirstBaseUmpire], '[FirstBaseUmpire]'		from raw.Game where 						   [FirstBaseUmpire]			 not in (select * from #person)
union all
select CAST([Date] as DATE), [SecondBaseUmpire], '[SecondBaseUmpire]'		from raw.Game where 						   [SecondBaseUmpire]			 not in (select * from #person)
union all
select CAST([Date] as DATE), [ThirdBaseUmpire], '[ThirdBaseUmpire]'		from raw.Game where 						   [ThirdBaseUmpire]			 not in (select * from #person)
union all
select CAST([Date] as DATE), [LeftFieldUmpire], '[LeftFieldUmpire]'		from raw.Game where 						   [LeftFieldUmpire]			 not in (select * from #person)
union all
select CAST([Date] as DATE), [RightFieldUmpire], '[RightFieldUmpire]'		from raw.Game where 						   [RightFieldUmpire]			 not in (select * from #person)
union all
select CAST([Date] as DATE), [WinningPitcher], '[WinningPitcher]'			from raw.Game where 					   [WinningPitcher]					 not in (select * from #person)
union all
select CAST([Date] as DATE), [LosingPitcher], '[LosingPitcher]'			from raw.Game where 						   [LosingPitcher]				 not in (select * from #person)
union all
select CAST([Date] as DATE), [SaveFor], '[SaveFor]'				from raw.Game where 						   [SaveFor]					 not in (select * from #person)
union all
select CAST([Date] as DATE), [GWRBI], '[GWRBI]'					from raw.Game where 						   [GWRBI]						 not in (select * from #person)
union all
select CAST([Date] as DATE), [VisitorBatter1], '[VisitorBatter1]' 		from raw.Game where 						   [VisitorBatter1] 			 not in (select * from #person)
union all
select CAST([Date] as DATE), [VisitorBatter2], '[VisitorBatter2]' 		from raw.Game where 						   [VisitorBatter2] 			 not in (select * from #person)
union all
select CAST([Date] as DATE), [VisitorBatter3], '[VisitorBatter3]' 		from raw.Game where 						   [VisitorBatter3] 			 not in (select * from #person)
union all
select CAST([Date] as DATE), [VisitorBatter4], '[VisitorBatter4]' 		from raw.Game where 						   [VisitorBatter4] 			 not in (select * from #person)
union all
select CAST([Date] as DATE), [VisitorBatter5], '[VisitorBatter5]' 		from raw.Game where 						   [VisitorBatter5] 			 not in (select * from #person)
union all
select CAST([Date] as DATE), [VisitorBatter6], '[VisitorBatter6]' 		from raw.Game where 						   [VisitorBatter6] 			 not in (select * from #person)
union all
select CAST([Date] as DATE), [VisitorBatter7], '[VisitorBatter7]' 		from raw.Game where 						   [VisitorBatter7] 			 not in (select * from #person)
union all
select CAST([Date] as DATE), [VisitorBatter8], '[VisitorBatter8]' 		from raw.Game where 						   [VisitorBatter8] 			 not in (select * from #person)
union all
select CAST([Date] as DATE), [VisitorBatter9], '[VisitorBatter9]' 		from raw.Game where 						   [VisitorBatter9] 			 not in (select * from #person)
union all
select CAST([Date] as DATE), [HomeBatter1], '[HomeBatter1]' 			from raw.Game where 						   [HomeBatter1] 				 not in (select * from #person)
union all
select CAST([Date] as DATE), [HomeBatter2], '[HomeBatter2]' 			from raw.Game where 						   [HomeBatter2] 				 not in (select * from #person)
union all
select CAST([Date] as DATE), [HomeBatter3], '[HomeBatter3]' 			from raw.Game where 						   [HomeBatter3] 				 not in (select * from #person)
union all
select CAST([Date] as DATE), [HomeBatter4], '[HomeBatter4]' 			from raw.Game where 						   [HomeBatter4] 				 not in (select * from #person)
union all
select CAST([Date] as DATE), [HomeBatter5], '[HomeBatter5]' 			from raw.Game where 						   [HomeBatter5] 				 not in (select * from #person)
union all
select CAST([Date] as DATE), [HomeBatter6], '[HomeBatter6]' 			from raw.Game where 						   [HomeBatter6] 				 not in (select * from #person)
union all
select CAST([Date] as DATE), [HomeBatter7], '[HomeBatter7]' 			from raw.Game where 						   [HomeBatter7] 				 not in (select * from #person)
union all
select CAST([Date] as DATE), [HomeBatter8], '[HomeBatter8]' 			from raw.Game where 						   [HomeBatter8] 				 not in (select * from #person)
union all
select CAST([Date] as DATE), [HomeBatter9], '[HomeBatter9]' 			from raw.Game where 						   [HomeBatter9] 				 not in (select * from #person)
union all
select CAST([Date] as DATE), [VisitingFinisher], '[VisitingFinisher]' 		from raw.Game where 						   [VisitingFinisher] 			 not in (select * from #person)
union all
select CAST([Date] as DATE), [HomeFinisher], '[HomeFinisher]' 			from raw.Game where 						   [HomeFinisher] 				 not in (select * from #person)
go

select distinct * into aud.MissingPlayers_GameData from #MissingPlayers_GameData
go




select * from aud.MissingPlayers_GameData where ID not in ('None', '(none)', '(unknown)')
select count(ID) from aud.MissingPlayers_GameData where ID not in ('None', '(none)', '(unknown)')
select count(distinct ID) from aud.MissingPlayers_GameData where ID not in ('None', '(none)', '(unknown)')


select distinct ID from aud.MissingPlayers_GameData where ID not in ('None', '(none)', '(unknown)')

select ID, RecordDate from aud.MissingPlayers_GameData where ID = 'nalld101' order by ID, RecordDate


select * from raw.PlayerMaster where PlayerID like 'n%101' order by PlayerID
select a.ID as PlayerID, count(*) as FieldCt from aud.MissingPlayers_GameData a  join #MissingPlayers_GameData b on a.ID = b.ID where a.ID not in ('None', '(none)', '(unknown)') group by a.ID

