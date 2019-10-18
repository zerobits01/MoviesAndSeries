/* 

Purpose	: Movies and series Table creation script
Descr	: Just the tables that doesn't need foreign keys
Author	: zerobits01
Date	: 2019-10-18
on		: MoviesAndSeries

*/


-- Actor Table : 
create Table actors(
-- cpolumns : 
act_id  int identity,
act_fname varchar(55) Not Null ,
act_lname varchar(55) Not Null ,

-- constraints : 
constraint act_pk primary key (act_id)
);

-- Director Table : 
create Table directors(
-- columns : 
dir_id int identity, 
dir_fname varchar(55) Not Null ,
dir_lname varchar(55) Not Null ,

-- constraints : 
constraint dir_pk primary key (dir_id)
);

-- Movie Table : 
create Table movies(
-- columns : 
mov_id  int identity, 
mov_title varchar(255) Not Null ,
mov_year Date Not Null default getdate(),
mov_time varchar(5), -- length of movie
mov_lang varchar(55) Not Null ,
mov_country varchar(55) Not Null ,
reviewers int not null default 0,-- for knowing that how many people rate this movie
-- constrints : 
constraint mov_pk primary key (mov_id)
);

-- Genres Table : 
create Table genres(
-- columns : 
gen_id int identity,
gen_title varchar(55) Not Null ,

-- constraints : 
constraint gen_pk primary key (gen_id)
);

-- Reviewer Table :  
create Table reviewers(
-- columns : 
rev_id int identity,  
rev_uname varchar(255) Not Null ,
-- constraints :
constraint rev_pk primary key (rev_id)
);

/*
TODO Movie : 
MovieDirection(dir_id,mov_id)
MoviesCast(act_id,mov_id,role)
SeriesRating(mov_id,rev_id,rate)
MovieGenres(mov_id,gen_id)
*/

-- Series Table : 
create Table series(
ser_id int identity ,
ser_title varchar(255) Not Null ,
ser_year Date default getdate(),
ser_time varchar(5) Not Null , -- length
ser_lang varchar(255) Not Null ,
ser_country varchar(255) Not Null ,
ser_seasons_count int Not Null default 1,
reviewers int Not Null default 0, -- for knowing that how many people rate this series

-- constrains : 
constraint ser_pk primary key (ser_id)
);


/*
TODO Series : 
SeriesDirection(dir_id,ser_id)
SeriesCast(act_id,ser_id,seas_id,role)
SeriesRating(ser_id,rev_id,rate)
SeriesGenres(ser_id,gen_id)
create Table seasons(
season_id int , -- autoincrement pk
ser_id int Not Null , -- foreign key on series
season_name varchar(55) Not Null ,
episode_count int Not Null,
);
*/

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