use Retrosheet
go

-- get team wins / losses by month
declare @team char(3);
declare @start_year int;
set @team = 'CHN';
set @start_year = 2015;

with
	cte_win_loss_by_year_month
	as
	(
		select
			team
		, year(Date) as year
		, month(Date) as month
		, result
		, count(*) as ct
		from (
		select
				@team as team
			, Date
			, case
				when HomeTeam = @team and HomeFinalScore > VisitorFinalScore then 'W'
				when HomeTeam = @team and HomeFinalScore < VisitorFinalScore then 'L'
				when VisitingTeam = @team and VisitorFinalScore > HomeFinalScore then 'W'
				when VisitingTeam = @team and VisitorFinalScore < HomeFinalScore then 'L'
				else null
			end as result
			from
				dbo.Game
			where
			( VisitingTeam = @team or HomeTeam = @team )
				and year([Date]) >= @start_year
	) x
		where
		result is not null
		group by
		team
		,year(Date)
		,month(Date)
		,result
	)
select
	*
from
	cte_win_loss_by_year_month
where [month] = 8
order by
	year
	,month
	,case when result = 'W' then 1 else 2 end
