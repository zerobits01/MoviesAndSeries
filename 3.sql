with t(mov_id,mov_title,cnt_rows)
as(
	select distinct m1.mov_id, m3.mov_title, count(*)
	from (moviescast as m1 join moviescast as m2 
		on m1.mov_id = m2.mov_id)
			join movies as m3
				on m3.mov_id = m1.mov_id
	where m1.act_id != m2.act_id 
	group by m3.mov_title, m1.mov_id
)
select distinct mov_title
from t
where cnt_rows >= 2