/*

Purpose	: Movies and series Table creation script
Descr	: Tables need foreign keys
Author	: zerobits01
Date	: 2019-10-18
on		: MoviesAndSeries

*/

use [MoviesAndSeries]

-- Table MovieDirection(dir_id,mov_id)
create table moviesdirection(
-- columns :
dir_id int,
mov_id int,

-- constraints : 
constraint movdir_pk primary key (dir_id,mov_id),
constraint movdir_fk0 foreign key (dir_id) references directors,
constraint movdir_fk1 foreign key (mov_id) references movies,
);


-- Table MoviesCast(act_id,mov_id,role)
create table moviescast(
-- columns :
act_id int,
mov_id int,
rol varchar(55) Not Null,

-- constraints : 
constraint movcas_pk primary key (act_id,mov_id),
constraint movcas_fk0 foreign key (act_id) references actors,
constraint movcas_fk1 foreign key (mov_id) references movies,
);


-- Table MoviesRating(mov_id,rev_id,rate)
create table moviesrate(
-- columns :
rev_id int,
mov_id int,
rate float(24) Not Null,

-- constraints : 
constraint movrat_pk primary key (rev_id,mov_id),
constraint movrat_fk0 foreign key (rev_id) references reviewers,
constraint movrat_fk1 foreign key (mov_id) references movies,
);

-- Table MovieGenres(mov_id,gen_id)
create table moviesgen(
-- columns :
gen_id int,
mov_id int,

-- constraints : 
constraint movgen_pk primary key (gen_id,mov_id),
constraint movgen_fk0 foreign key (gen_id) references genres,
constraint movgen_fk1 foreign key (mov_id) references movies,
);




-- Table SeriesDirection(dir_id,ser_id)
create table seriesdir(
-- columns :
dir_id int,
ser_id int,

-- constraints : 
constraint serdir_pk primary key (ser_id,dir_id),
constraint serdir_fk0 foreign key (ser_id) references series,
constraint serdir_fk1 foreign key (dir_id) references directors,
);

-- Table SeriesCast(act_id,ser_id,seas_id,role)
create table seriescast(
-- columns :
act_id int,
ser_id int,
rol varchar(255) not null,

-- constraints : 
constraint sercas_pk primary key (act_id,ser_id),
constraint sercas_fk0 foreign key (ser_id) references series,
constraint sercas_fk1 foreign key (act_id) references actors,
);

-- Table SeriesRating(ser_id,rev_id,rate)
create table seriesrate(
-- columns :
rev_id int,
ser_id int,
rate float(24) Not Null,

-- constraints : 
constraint serrat_pk primary key (rev_id,ser_id),
constraint serrat_fk0 foreign key (rev_id) references reviewers,
constraint serrat_fk1 foreign key (ser_id) references series,
);

-- Table SeriesGenres(ser_id,gen_id)
create table seriesgen(
-- columns :
gen_id int,
ser_id int,

-- constraints : 
constraint sergen_pk primary key (gen_id,ser_id),
constraint sergen_fk0 foreign key (gen_id) references genres,
constraint sergen_fk1 foreign key (ser_id) references series,
);

-- Table Seasons(season_id,ser_id,season_name,episode_count)
create Table seasons(
season_id int identity,
ser_id int Not Null , 
season_name varchar(55) Not Null ,
episode_count int Not Null,

-- constraints : 
constraint season_pk primary key (season_id),
constraint season_fk0 foreign key (ser_id) references series,
);



/*
poits 

ALTER TABLE tblname ALTER COLUMN colname datatype {[Not] NULL} ; -- for making nullable

ALTER TABLE tblname add {CONSTRAINT nameforconstraint UNIQUE (firstcol[,secondcol[,...]])}; -- adding unique

ALTER TABLE tblname ADD CONSTRAINT nameforconstraint primary key (colname[,secondcolname])

ALTER TABLE tblname DROP CONSTRAINT nameforconstraint

in the table : Foreign Key (colname) references TableOfPk on delete cascade on update cascade
in the table : fk int FOREIGN KEY REFERENCES tblPk(pkforfk)
in the table : CONSTRAINT fk_name FOREIGN KEY (col) REFERENCES table(pk)
in the table : CHECK (P_Id>0)
in the table : CHECK (P_Id>0 AND City='Sandnes')

ALTER TABLE tblname ADD CHECK (colname > 0)
ALTER TABLE tblname ADD CONSTRAINT chk_name CHECK (col1 > 0 AND col2 = 'sit..')

in the table : colname varchar(255) DEFAULT  'Sandnes'
in the table : OrderDate date DEFAULT GETDATE()

ALTER TABLE tblname ADD CONSTRAINT PK_DEF DEFAULT ('SANDNES‘) For colname

auto increment  : identity 
P_Id int PRIMARY KEY IDENTITY

*/