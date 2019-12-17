with table1(act_id , mov_id , rol) as (									
	(select * 
	from moviescast) 
	union 
	(select * from seriescast)
)

select top(1) actors.act_fname , actors.act_lname
from table1 , actors
where table1.act_id = actors.act_id
group by actors.act_fname , actors.act_lname
order by COUNT(*) , actors.act_lname