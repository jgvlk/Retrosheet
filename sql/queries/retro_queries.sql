use Retrosheet
go


select top 1000 * from dbo.Game
select top 1000 * from dbo.Event

select count(*) from dbo.Game
select count(*) from dbo.Event

-- get team wins / losses
declare @team char(3)
set @team = 'CHN'

select
	team
	,result
	,count(*) as ct
from (

	select
		@team as team
		,case
			when HomeTeam = @team and HomeFinalScore > VisitorFinalScore then 'W'
			when HomeTeam = @team and HomeFinalScore < VisitorFinalScore then 'L'
			when VisitingTeam = @team and VisitorFinalScore > HomeFinalScore then 'W'
			when VisitingTeam = @team and VisitorFinalScore < HomeFinalScore then 'L'
			else null
		end as result
	from dbo.Game
	where
		( VisitingTeam = 'CHN' or HomeTeam = 'CHN' ) and
		year(Date) = 2022
) x
group by
	team
	,result


select top 1000 *
from
	dbo.Event e
	join dbo.Game g on e.GameID = g.GameID and g.Date >= '2022-01-01'
order by EventID