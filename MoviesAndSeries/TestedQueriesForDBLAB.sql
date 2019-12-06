/*
select *
from movies M1 join moviesgen M2
	on M1.mov_id = M2.mov_id
		join genres G
			on G.gen_id = M2.gen_id
where G.gen_title like 'comedy' or G.gen_title like 'Comedy'

select *
from series M1 join seriesgen M2
	on M1.ser_id = M2.ser_id
		join genres G
			on G.gen_id = M2.gen_id
where G.gen_title like 'comedy' or G.gen_title like 'Comedy' 


select *
from actors A join moviescast MC
	on A.act_id = MC.act_id
		join movies M
			on MC.mov_id = M.mov_id
where A.act_fname = '' and A.act_lname = '' and M.mov_year = ''

select *
from actors A join seriescast SC
	on A.act_id = SC.act_id
		join series S
			on SC.ser_id = S.ser_id
where A.act_fname = '' and A.act_lname = '' and S.ser_year = ''


insert into genres(gen_title)
	values('new test');


alter table moviesrate
add accepted Bit not null default (0)

alter table seriesrate
add accepted Bit not null default (0)

SELECT *
from moviesrate M1 join movies M2
	on M1.mov_id = M2.mov_id
where M1.accepted = 0

SELECT *
from seriesrate S1 join series S2
	on S1.ser_id = S2.ser_id
where S1.accepted = 0


update seriesrate
set accepted = 1
where rev_id = 1 and ser_id = 1 

update moviesrate
set accepted = 1
where mov_id = 1 and rev_id = 1

alter table moviesrate
add comment nvarchar(255) null

alter table seriesrate
add comment nvarchar(255) null

INSERT into moviesrate(rev_id,mov_id,rate,comment)
	values()

INSERT into seriesrate(rev_id,ser_id,rate,comment)
	values()


with TM(mov_id,mov_title,mov_year,mov_genre,genrename,mov_act,fname,lname)
as (
	select M1.mov_id,M1.mov_title,M1.mov_year,M3.gen_id,G.gen_title,A.act_id,A.act_fname,A.act_lname
	from movies M1 join moviescast M2
		on M1.mov_id = M2.mov_id
			join actors A
				on A.act_id = M2.act_id
					join moviesgen M3
						on M3.mov_id = M1.mov_id
							join genres G
								on G.gen_id = M3.gen_id
),
TS(ser_id,ser_title,ser_year,ser_genre,ser_act)
as (
	select M1.ser_id,M1.ser_title,M1.ser_year,M3.gen_id,A.act_id
	from series M1 join seriescast M2
		on M1.ser_id = M2.ser_id
			join actors A
				on A.act_id = M2.act_id
					join seriesgen M3
						on M3.ser_id = M1.ser_id	
)
select *
from TM join Ts
	on TM.mov_genre = TS.ser_genre
where YEAR(TM.mov_year) = '2000' and TM.mov_year = TS.ser_year
	and TM.mov_act = TS.ser_act
*/
