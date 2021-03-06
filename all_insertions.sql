﻿USE [MoviesAndSeries];
SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

SET IDENTITY_INSERT [dbo].[actors] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[actors]([act_id], [act_fname], [act_lname])
SELECT 1, N'Peter', N'Dinklage' UNION ALL
SELECT 2, N'Lena', N'Headey' UNION ALL
SELECT 3, N'Bryan', N'Cranston' UNION ALL
SELECT 4, N'Anna', N'Gunn' UNION ALL
SELECT 5, N'Evan', N'rachel Wood' UNION ALL
SELECT 6, N'Jeffrey ', N'Wright' UNION ALL
SELECT 7, N'Scott', N'Grimes' UNION ALL
SELECT 8, N'Damian ', N'Lewis' UNION ALL
SELECT 9, N'Benedict', N'Cumberbatch' UNION ALL
SELECT 10, N'Martin', N'Freeman' UNION ALL
SELECT 11, N'Jennifer', N'Aniston' UNION ALL
SELECT 12, N'Lisa', N'Kudrow' UNION ALL
SELECT 13, N'Matthew', N'McConaughey' UNION ALL
SELECT 14, N'Colin', N'Farrell' UNION ALL
SELECT 15, N'Robin', N'Wright' UNION ALL
SELECT 16, N'Michael', N'Kelly' UNION ALL
SELECT 17, N'Cillian', N'Murphy' UNION ALL
SELECT 18, N'Paul', N'Anderson' UNION ALL
SELECT 19, N'Helen', N'McCrory' UNION ALL
SELECT 20, N'Jennifer', N'Carpenter' UNION ALL
SELECT 21, N'David', N'Zayas' UNION ALL
SELECT 22, N'Thomas', N'Middleditch' UNION ALL
SELECT 23, N'Josh', N'Brender' UNION ALL
SELECT 24, N'Martin', N'Starr' UNION ALL
SELECT 25, N'James', N'Gandolfini' UNION ALL
SELECT 26, N'Lorraine', N'Bracco' UNION ALL
SELECT 27, N'Edie', N'Falco' UNION ALL
SELECT 28, N'Ernie', N'Hudson' UNION ALL
SELECT 29, N'Lee', N'Tergeson' UNION ALL
SELECT 30, N'Jon ', N'Cryer' UNION ALL
SELECT 31, N'Conchata', N'Ferrell' UNION ALL
SELECT 32, N'Kirk', N'Douglas' UNION ALL
SELECT 33, N'Laurence', N'Olivier' UNION ALL
SELECT 34, N'Claire', N'Danes' UNION ALL
SELECT 35, N'Mandy', N'Patinkin' UNION ALL
SELECT 36, N'Milo', N'Ventimiglia' UNION ALL
SELECT 37, N'Mandy', N'Moore' UNION ALL
SELECT 38, N'Ethan', N'Cutkosky' UNION ALL
SELECT 39, N'Jeremy', N'Allen White' UNION ALL
SELECT 40, N'Ray', N'Romano' UNION ALL
SELECT 41, N'Patricia', N'Heaton' UNION ALL
SELECT 42, N'Vin', N'Diesel' UNION ALL
SELECT 43, N'Michele', N' Rodriguez' UNION ALL
SELECT 44, N'Paul', N'Walker' UNION ALL
SELECT 45, N'Jordana', N'Brewster' UNION ALL
SELECT 46, N'Dawyne', N'Johnson' UNION ALL
SELECT 47, N'Jason', N'Statham' UNION ALL
SELECT 48, N'Marlon', N'Brando' UNION ALL
SELECT 49, N'Al', N'Pacino'
COMMIT;
RAISERROR (N'[dbo].[actors]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[actors] OFF;

SET IDENTITY_INSERT [dbo].[directors] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[directors]([dir_id], [dir_fname], [dir_lname])
SELECT 1, N'David', N'Benioff' UNION ALL
SELECT 2, N'Jonathan', N'Nolan' UNION ALL
SELECT 3, N'Steven ', N'Spielberg' UNION ALL
SELECT 4, N'Tom ', N'Hanks' UNION ALL
SELECT 5, N'Vince ', N'Gilligan' UNION ALL
SELECT 6, N'Steven', N'Moffat' UNION ALL
SELECT 7, N'Nic', N'Pizzolatto' UNION ALL
SELECT 8, N'Beau', N'Willimon' UNION ALL
SELECT 9, N'David', N'Crane' UNION ALL
SELECT 10, N'Steven', N'Knight' UNION ALL
SELECT 11, N'James ', N'Manos Jr' UNION ALL
SELECT 12, N'Mike', N'Judje' UNION ALL
SELECT 13, N'David', N'Chase' UNION ALL
SELECT 14, N'Tom', N'Fontana' UNION ALL
SELECT 15, N'Chuck ', N'Lorre' UNION ALL
SELECT 16, N'Lee', N'Aronsohn' UNION ALL
SELECT 17, N'	Stanley ', N'Kubrick' UNION ALL
SELECT 18, N'Alex ', N'Gansa' UNION ALL
SELECT 19, N'Ann', N'Biderman' UNION ALL
SELECT 20, N'Paul', N'Abbott' UNION ALL
SELECT 21, N'Philip', N'Rosenthal' UNION ALL
SELECT 22, N'Tom', N'Kapinos' UNION ALL
SELECT 23, N'Dan', N'Fogelman' UNION ALL
SELECT 24, N'Lisa', N'Joy' UNION ALL
SELECT 25, N'Rob', N'Cohen' UNION ALL
SELECT 26, N'John', N'Singleton' UNION ALL
SELECT 27, N'Justin', N'Lee' UNION ALL
SELECT 28, N'James', N'Wan' UNION ALL
SELECT 29, N'Gary', N'Gary' UNION ALL
SELECT 30, N'David', N'Leitch' UNION ALL
SELECT 31, N'Christopher', N'Nolan' UNION ALL
SELECT 32, N'Frank', N'Darabont' UNION ALL
SELECT 33, N'Sergio', N'Leone' UNION ALL
SELECT 34, N'Sidney', N'Lumet'
COMMIT;
RAISERROR (N'[dbo].[directors]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[directors] OFF;

SET IDENTITY_INSERT [dbo].[genres] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[genres]([gen_id], [gen_title])
SELECT 1, N'fantasy' UNION ALL
SELECT 2, N'crime' UNION ALL
SELECT 3, N'drama' UNION ALL
SELECT 4, N'sciencefication' UNION ALL
SELECT 5, N'western' UNION ALL
SELECT 6, N'action' UNION ALL
SELECT 7, N'anthology' UNION ALL
SELECT 8, N'political' UNION ALL
SELECT 9, N'sitcom' UNION ALL
SELECT 10, N'mystery' UNION ALL
SELECT 11, N'comedy' UNION ALL
SELECT 12, N'epic' UNION ALL
SELECT 13, N'spy' UNION ALL
SELECT 14, N'adventure'
COMMIT;
RAISERROR (N'[dbo].[genres]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[genres] OFF;

SET IDENTITY_INSERT [dbo].[movies] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[movies]([mov_id], [mov_title], [mov_year], [mov_time], [mov_lang], [mov_country], [reviewers])
SELECT 1, N'Fast And Furiuos 1', '20010622 00:00:00.000', N'95', N'English', N'USA', 0 UNION ALL
SELECT 3, N'Fast And Furiuos 2', '20030606 00:00:00.000', N'105', N'English', N'USA', 0 UNION ALL
SELECT 4, N'Fast And Furiuos 3', '20060616 00:00:00.000', N'87', N'English', N'USA', 0 UNION ALL
SELECT 5, N'Fast And Furiuos 4', '20090403 00:00:00.000', N'90', N'English', N'USA', 0 UNION ALL
SELECT 6, N'Fast And Furiuos 6', '20130524 00:00:00.000', N'95', N'English', N'USA', 0 UNION ALL
SELECT 7, N'Fast And Furiuos 7', '20150503 00:00:00.000', N'80', N'English', N'USA', 0 UNION ALL
SELECT 8, N'Fast And Furiuos 8', '20170514 00:00:00.000', N'120', N'English', N'USA', 0 UNION ALL
SELECT 9, N'Fast And Furiuos 9', '20190802 00:00:00.000', N'125', N'English', N'USA', 0 UNION ALL
SELECT 10, N'Fight-Club', '19990101 00:00:00.000', N'75', N'English', N'USA', 0 UNION ALL
SELECT 11, N'The Lord Of Wings', '20030101 00:00:00.000', N'100', N'English', N'USA', 0 UNION ALL
SELECT 12, N'The Dark Knight', '20080101 00:00:00.000', N'97', N'English', N'USA', 0 UNION ALL
SELECT 13, N'Angry Men 12', '19570101 00:00:00.000', N'90', N'English', N'USA', 0 UNION ALL
SELECT 14, N'The Good the Bad and The Ugly', '19660101 00:00:00.000', N'95', N'English', N'USA', 0 UNION ALL
SELECT 15, N'The GodFather 2', '19740101 00:00:00.000', N'100', N'English', N'USA', 0 UNION ALL
SELECT 19, N'The GodFather', '19720101 00:00:00.000', N'105', N'English', N'USA', 0 UNION ALL
SELECT 20, N'The Shawsheng Redemption', '19940101 00:00:00.000', N'100', N'English', N'USA', 0
COMMIT;
RAISERROR (N'[dbo].[movies]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[movies] OFF;

SET IDENTITY_INSERT [dbo].[series] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[series]([ser_id], [ser_title], [ser_year], [ser_time], [ser_lang], [ser_country], [ser_seasons_count], [reviewers])
SELECT 3, N'Game of Thrones', '20190414 00:00:00.000', N'3', N'english', N'usa', 8, 10000000 UNION ALL
SELECT 8, N'West World', '20180112 00:00:00.000', N'2', N'english', N'usa', 2, 328000 UNION ALL
SELECT 9, N'Band of Brothers', '20010101 00:00:00.000', N'2', N'english', N'usa', 1, 308000 UNION ALL
SELECT 10, N'Breaking Bad', '20080120 00:00:00.000', N'5', N'english', N'usa', 5, 1000000 UNION ALL
SELECT 11, N'Sherlok', '20100212 00:00:00.000', N'7', N'english', N'british', 4, 685000 UNION ALL
SELECT 12, N'True Detective', '20140112 00:00:00.000', N'5', N'english', N'usa', 4, 426000 UNION ALL
SELECT 13, N'House of Cards', '20130201 00:00:00.000', N'5', N'english', N'usa', 8, 423000 UNION ALL
SELECT 14, N'Friends', '19940522 00:00:00.000', N'5', N'english', N'usa', 10, 648000 UNION ALL
SELECT 15, N'Peaky Blinders', '20130912 00:00:00.000', N'6', N'english', N'british', 7, 177000 UNION ALL
SELECT 16, N'Dexter', '20061001 00:00:00.000', N'7', N'english', N'usa', 8, 588000 UNION ALL
SELECT 18, N'Silicon valley', '20140406 00:00:00.000', N'5', N'english', N'usa', 6, 420000 UNION ALL
SELECT 19, N' The Sopranos ', '19990220 00:00:00.000', N'8', N'english', N'usa', 6, 263360 UNION ALL
SELECT 20, N' Oz', '19970812 00:00:00.000', N'6', N'english', N'usa', 6, 83168 UNION ALL
SELECT 21, N'Two and a Half Men', '20030101 00:00:00.000', N'12', N'english', N'usa', 12, 229553 UNION ALL
SELECT 23, N'Spartacus: Gods of the Arena', '20110530 00:00:00.000', N'1', N'english', N'usa', 1, 117979 UNION ALL
SELECT 24, N'Homeland', '20110512 00:00:00.000', N'', N'english', N'usa', 8, 284525 UNION ALL
SELECT 25, N' Ray Donovan', '20130214 00:00:00.000', N'', N'english', N'usa', 7, 63920 UNION ALL
SELECT 26, N' Shameless', '20110310 00:00:00.000', N'', N'english', N'usa', 10, 176697 UNION ALL
SELECT 27, N'Everybody Loves Raymond', '19961202 00:00:00.000', N'9', N'english', N'usa', 9, 59332 UNION ALL
SELECT 28, N'Californication', '20070606 00:00:00.000', N'', N'english', N'usa', 7, 165745 UNION ALL
SELECT 29, N'This is us', '20160601 00:00:00.000', N'3', N'english', N'usa', 6, 81977
COMMIT;
RAISERROR (N'[dbo].[series]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[series] OFF;

SET IDENTITY_INSERT [dbo].[seasons] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[seasons]([season_id], [ser_id], [season_name], [episode_count])
SELECT 2, 3, N'1', 10 UNION ALL
SELECT 5, 3, N'2', 10 UNION ALL
SELECT 8, 3, N'3', 10 UNION ALL
SELECT 9, 3, N'4', 10 UNION ALL
SELECT 10, 3, N'5', 10 UNION ALL
SELECT 11, 3, N'6', 10 UNION ALL
SELECT 13, 3, N'7', 7 UNION ALL
SELECT 14, 3, N'8', 6 UNION ALL
SELECT 15, 8, N'1', 10 UNION ALL
SELECT 16, 8, N'2', 10 UNION ALL
SELECT 17, 8, N'3', 8 UNION ALL
SELECT 18, 9, N'1', 10 UNION ALL
SELECT 19, 10, N'1', 7 UNION ALL
SELECT 20, 10, N'2', 13 UNION ALL
SELECT 21, 10, N'3', 13 UNION ALL
SELECT 22, 10, N'4', 13 UNION ALL
SELECT 23, 10, N'5', 16 UNION ALL
SELECT 24, 11, N'1', 4 UNION ALL
SELECT 25, 11, N'2', 3 UNION ALL
SELECT 26, 11, N'3', 4 UNION ALL
SELECT 28, 11, N'4', 4 UNION ALL
SELECT 29, 12, N'1', 8 UNION ALL
SELECT 30, 12, N'2', 8 UNION ALL
SELECT 31, 12, N'3', 8 UNION ALL
SELECT 32, 13, N'1', 13 UNION ALL
SELECT 33, 13, N'2', 13 UNION ALL
SELECT 34, 13, N'3', 13 UNION ALL
SELECT 35, 13, N'4', 13 UNION ALL
SELECT 36, 13, N'5', 13 UNION ALL
SELECT 37, 13, N'6', 8 UNION ALL
SELECT 38, 14, N'1', 24 UNION ALL
SELECT 39, 14, N'2', 24 UNION ALL
SELECT 40, 14, N'3', 25 UNION ALL
SELECT 41, 14, N'4', 24 UNION ALL
SELECT 42, 14, N'5', 24 UNION ALL
SELECT 43, 14, N'6', 25 UNION ALL
SELECT 44, 14, N'7', 24 UNION ALL
SELECT 45, 14, N'8', 24 UNION ALL
SELECT 47, 14, N'9', 24 UNION ALL
SELECT 48, 14, N'10', 24 UNION ALL
SELECT 49, 15, N'1', 6 UNION ALL
SELECT 50, 15, N'2', 6 UNION ALL
SELECT 51, 15, N'3', 6 UNION ALL
SELECT 52, 15, N'4', 6 UNION ALL
SELECT 53, 15, N'5', 6 UNION ALL
SELECT 54, 15, N'6', 6 UNION ALL
SELECT 56, 16, N'1', 12 UNION ALL
SELECT 57, 16, N'2', 12 UNION ALL
SELECT 58, 16, N'3', 12 UNION ALL
SELECT 60, 16, N'4', 12
COMMIT;
RAISERROR (N'[dbo].[seasons]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[seasons]([season_id], [ser_id], [season_name], [episode_count])
SELECT 61, 16, N'5', 12 UNION ALL
SELECT 62, 16, N'6', 12 UNION ALL
SELECT 63, 16, N'7', 12 UNION ALL
SELECT 64, 16, N'8', 12 UNION ALL
SELECT 65, 18, N'1', 8 UNION ALL
SELECT 66, 18, N'2', 10 UNION ALL
SELECT 67, 18, N'3', 10 UNION ALL
SELECT 68, 18, N'4', 10 UNION ALL
SELECT 70, 18, N'5', 8 UNION ALL
SELECT 71, 18, N'6', 7 UNION ALL
SELECT 72, 19, N'1', 13 UNION ALL
SELECT 73, 19, N'2', 13 UNION ALL
SELECT 74, 19, N'3', 13 UNION ALL
SELECT 75, 19, N'4', 13 UNION ALL
SELECT 76, 19, N'5', 13 UNION ALL
SELECT 77, 19, N'6', 21 UNION ALL
SELECT 78, 20, N'1', 8 UNION ALL
SELECT 79, 20, N'2', 8 UNION ALL
SELECT 80, 20, N'3', 8 UNION ALL
SELECT 81, 20, N'4', 16 UNION ALL
SELECT 82, 20, N'5', 8 UNION ALL
SELECT 83, 20, N'6', 8 UNION ALL
SELECT 84, 21, N'1', 24 UNION ALL
SELECT 85, 21, N'2', 24 UNION ALL
SELECT 86, 21, N'3', 24 UNION ALL
SELECT 87, 21, N'4', 24 UNION ALL
SELECT 88, 21, N'5', 24 UNION ALL
SELECT 89, 21, N'6', 19 UNION ALL
SELECT 90, 21, N'7', 24 UNION ALL
SELECT 91, 21, N'8', 25 UNION ALL
SELECT 92, 21, N'9', 23 UNION ALL
SELECT 93, 21, N'10', 21 UNION ALL
SELECT 94, 21, N'11', 22 UNION ALL
SELECT 95, 21, N'12', 15 UNION ALL
SELECT 96, 23, N'1', 13 UNION ALL
SELECT 97, 23, N'2', 10 UNION ALL
SELECT 98, 23, N'3', 10 UNION ALL
SELECT 99, 24, N'1', 12 UNION ALL
SELECT 100, 24, N'2', 12 UNION ALL
SELECT 101, 24, N'3', 12 UNION ALL
SELECT 102, 24, N'4', 12 UNION ALL
SELECT 103, 24, N'5', 12 UNION ALL
SELECT 104, 24, N'6', 12 UNION ALL
SELECT 105, 24, N'7', 12 UNION ALL
SELECT 106, 24, N'8', 12 UNION ALL
SELECT 107, 25, N'1', 12 UNION ALL
SELECT 108, 25, N'2', 12 UNION ALL
SELECT 109, 25, N'3', 12 UNION ALL
SELECT 110, 25, N'4', 12 UNION ALL
SELECT 111, 25, N'5', 12
COMMIT;
RAISERROR (N'[dbo].[seasons]: Insert Batch: 2.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[seasons]([season_id], [ser_id], [season_name], [episode_count])
SELECT 112, 25, N'6', 12 UNION ALL
SELECT 113, 25, N'7', 10 UNION ALL
SELECT 114, 26, N'1', 12 UNION ALL
SELECT 115, 26, N'2', 12 UNION ALL
SELECT 116, 26, N'3', 12 UNION ALL
SELECT 117, 26, N'4', 12 UNION ALL
SELECT 118, 26, N'5', 12 UNION ALL
SELECT 119, 26, N'6', 12 UNION ALL
SELECT 120, 26, N'7', 12 UNION ALL
SELECT 121, 26, N'8', 12 UNION ALL
SELECT 122, 26, N'9', 12 UNION ALL
SELECT 123, 26, N'10', 14 UNION ALL
SELECT 124, 27, N'1', 22 UNION ALL
SELECT 127, 27, N'2', 25 UNION ALL
SELECT 128, 27, N'3', 26 UNION ALL
SELECT 129, 27, N'4', 24 UNION ALL
SELECT 130, 27, N'5', 25 UNION ALL
SELECT 131, 27, N'6', 25 UNION ALL
SELECT 132, 27, N'7', 24 UNION ALL
SELECT 133, 27, N'8', 23 UNION ALL
SELECT 135, 27, N'9', 23 UNION ALL
SELECT 136, 29, N'1', 18 UNION ALL
SELECT 137, 29, N'2', 18 UNION ALL
SELECT 138, 29, N'3', 18 UNION ALL
SELECT 139, 29, N'4', 18 UNION ALL
SELECT 140, 28, N'1', 10 UNION ALL
SELECT 141, 28, N'2', 10
COMMIT;
RAISERROR (N'[dbo].[seasons]: Insert Batch: 3.....Done!', 10, 1) WITH NOWAIT;
GO

SET IDENTITY_INSERT [dbo].[seasons] OFF;

BEGIN TRANSACTION;
INSERT INTO [dbo].[moviescast]([act_id], [mov_id], [rol])
SELECT 42, 1, N'Dom' UNION ALL
SELECT 42, 3, N'Dom' UNION ALL
SELECT 42, 4, N'Dom' UNION ALL
SELECT 42, 5, N'Dom' UNION ALL
SELECT 42, 6, N'Dom' UNION ALL
SELECT 42, 7, N'Dom' UNION ALL
SELECT 42, 8, N'Dom' UNION ALL
SELECT 42, 10, N'Rol1' UNION ALL
SELECT 42, 12, N'Rol3' UNION ALL
SELECT 42, 14, N'Rol4' UNION ALL
SELECT 43, 1, N'Letty' UNION ALL
SELECT 43, 4, N'Letty' UNION ALL
SELECT 43, 5, N'Letty' UNION ALL
SELECT 43, 6, N'Letty' UNION ALL
SELECT 43, 7, N'Letty' UNION ALL
SELECT 43, 8, N'Letty' UNION ALL
SELECT 43, 13, N'Rol11' UNION ALL
SELECT 43, 14, N'Rol12' UNION ALL
SELECT 44, 1, N'Brian' UNION ALL
SELECT 44, 3, N'Brian' UNION ALL
SELECT 44, 4, N'Brian' UNION ALL
SELECT 44, 5, N'Brian' UNION ALL
SELECT 44, 6, N'Brian' UNION ALL
SELECT 44, 7, N'Brian' UNION ALL
SELECT 44, 15, N'Rol5' UNION ALL
SELECT 44, 19, N'Rol5' UNION ALL
SELECT 44, 20, N'Rol7' UNION ALL
SELECT 45, 1, N'Mia' UNION ALL
SELECT 45, 3, N'Mia' UNION ALL
SELECT 45, 4, N'Mia' UNION ALL
SELECT 45, 5, N'Mia' UNION ALL
SELECT 45, 6, N'Mia' UNION ALL
SELECT 45, 7, N'Mia' UNION ALL
SELECT 45, 8, N'Mia' UNION ALL
SELECT 46, 6, N'Hobs' UNION ALL
SELECT 46, 7, N'Hobs' UNION ALL
SELECT 46, 8, N'Hobs' UNION ALL
SELECT 46, 9, N'Hobs' UNION ALL
SELECT 47, 7, N'Decard' UNION ALL
SELECT 47, 8, N'Decard' UNION ALL
SELECT 48, 9, N'Decard' UNION ALL
SELECT 48, 15, N'Rol1' UNION ALL
SELECT 48, 19, N'Rol1' UNION ALL
SELECT 49, 10, N'Rol13' UNION ALL
SELECT 49, 11, N'Rol' UNION ALL
SELECT 49, 15, N'Rol2' UNION ALL
SELECT 49, 19, N'Rol2'
COMMIT;
RAISERROR (N'[dbo].[moviescast]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[moviesdirection]([dir_id], [mov_id])
SELECT 25, 1 UNION ALL
SELECT 26, 3 UNION ALL
SELECT 27, 4 UNION ALL
SELECT 27, 5 UNION ALL
SELECT 27, 6 UNION ALL
SELECT 27, 7 UNION ALL
SELECT 28, 8 UNION ALL
SELECT 28, 19 UNION ALL
SELECT 29, 9 UNION ALL
SELECT 30, 10 UNION ALL
SELECT 30, 15 UNION ALL
SELECT 31, 11 UNION ALL
SELECT 32, 12 UNION ALL
SELECT 33, 13 UNION ALL
SELECT 34, 14 UNION ALL
SELECT 34, 20
COMMIT;
RAISERROR (N'[dbo].[moviesdirection]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[moviesgen]([gen_id], [mov_id])
SELECT 2, 12 UNION ALL
SELECT 2, 13 UNION ALL
SELECT 2, 14 UNION ALL
SELECT 2, 15 UNION ALL
SELECT 3, 13 UNION ALL
SELECT 3, 14 UNION ALL
SELECT 3, 15 UNION ALL
SELECT 6, 1 UNION ALL
SELECT 6, 3 UNION ALL
SELECT 6, 4 UNION ALL
SELECT 6, 5 UNION ALL
SELECT 6, 6 UNION ALL
SELECT 6, 7 UNION ALL
SELECT 6, 8 UNION ALL
SELECT 6, 9 UNION ALL
SELECT 6, 10 UNION ALL
SELECT 6, 11 UNION ALL
SELECT 6, 12 UNION ALL
SELECT 6, 20 UNION ALL
SELECT 8, 12 UNION ALL
SELECT 8, 14 UNION ALL
SELECT 8, 15 UNION ALL
SELECT 10, 9 UNION ALL
SELECT 10, 11 UNION ALL
SELECT 10, 12 UNION ALL
SELECT 10, 13 UNION ALL
SELECT 10, 14 UNION ALL
SELECT 10, 15 UNION ALL
SELECT 10, 19 UNION ALL
SELECT 13, 13 UNION ALL
SELECT 14, 1 UNION ALL
SELECT 14, 3 UNION ALL
SELECT 14, 4 UNION ALL
SELECT 14, 5 UNION ALL
SELECT 14, 6 UNION ALL
SELECT 14, 7 UNION ALL
SELECT 14, 8 UNION ALL
SELECT 14, 9 UNION ALL
SELECT 14, 10 UNION ALL
SELECT 14, 20
COMMIT;
RAISERROR (N'[dbo].[moviesgen]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[seriescast]([act_id], [ser_id], [rol])
SELECT 1, 3, N' Tyrion Lannister' UNION ALL
SELECT 2, 3, N'Cersei Lannister' UNION ALL
SELECT 3, 10, N'Walter White' UNION ALL
SELECT 4, 10, N'Skyler White' UNION ALL
SELECT 5, 8, N'Dolores Abernathy' UNION ALL
SELECT 6, 8, N'Bernard Lowe' UNION ALL
SELECT 7, 9, N' Donald G. Malarkey' UNION ALL
SELECT 8, 9, N'Richard D. Winters' UNION ALL
SELECT 9, 11, N'Sherlock Holmes' UNION ALL
SELECT 10, 11, N'Dr. John Watson ' UNION ALL
SELECT 11, 14, N'Rachel Green' UNION ALL
SELECT 12, 14, N'Monica Geller' UNION ALL
SELECT 13, 12, N'Detective Rust Cohle' UNION ALL
SELECT 14, 12, N'Detective Ray Velcoro' UNION ALL
SELECT 15, 13, N'Claire Underwood' UNION ALL
SELECT 16, 13, N'Doug Stamper' UNION ALL
SELECT 17, 15, N'Thomas Shelby' UNION ALL
SELECT 18, 15, N'Arthur Shelby' UNION ALL
SELECT 19, 15, N' Aunt Polly' UNION ALL
SELECT 20, 16, N'Debra Morgan' UNION ALL
SELECT 21, 16, N'Sgt. Angel Batista' UNION ALL
SELECT 22, 18, N'Richard Hendricks' UNION ALL
SELECT 23, 18, N'Nelson ''Big Head'' Bighetti' UNION ALL
SELECT 24, 18, N'Bertram Gilfoyle' UNION ALL
SELECT 25, 19, N'Tony Soprano' UNION ALL
SELECT 26, 19, N' Dr. Jennifer Melfi' UNION ALL
SELECT 27, 19, N' Carmela Soprano' UNION ALL
SELECT 28, 20, N'Warden Leo Glynn' UNION ALL
SELECT 29, 20, N'Tobias Beecher' UNION ALL
SELECT 30, 21, N' Alan Harper' UNION ALL
SELECT 31, 21, N'Berta' UNION ALL
SELECT 34, 24, N'Carrie Mathison' UNION ALL
SELECT 35, 24, N'Saul Berenson' UNION ALL
SELECT 36, 29, N'Jack Pearson' UNION ALL
SELECT 37, 29, N'Rebecca Pearson' UNION ALL
SELECT 38, 26, N'Carl Gallagher' UNION ALL
SELECT 39, 26, N'Lip Gallagher' UNION ALL
SELECT 40, 27, N'Ray Barone' UNION ALL
SELECT 41, 27, N'Debra Barone'
COMMIT;
RAISERROR (N'[dbo].[seriescast]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[seriesdir]([dir_id], [ser_id])
SELECT 1, 3 UNION ALL
SELECT 2, 8 UNION ALL
SELECT 24, 8 UNION ALL
SELECT 3, 9 UNION ALL
SELECT 4, 9 UNION ALL
SELECT 5, 10 UNION ALL
SELECT 6, 11 UNION ALL
SELECT 7, 12 UNION ALL
SELECT 8, 13 UNION ALL
SELECT 9, 14 UNION ALL
SELECT 10, 15 UNION ALL
SELECT 11, 16 UNION ALL
SELECT 12, 18 UNION ALL
SELECT 13, 19 UNION ALL
SELECT 14, 20 UNION ALL
SELECT 15, 21 UNION ALL
SELECT 16, 21 UNION ALL
SELECT 17, 23 UNION ALL
SELECT 18, 24 UNION ALL
SELECT 19, 25 UNION ALL
SELECT 20, 26 UNION ALL
SELECT 21, 27 UNION ALL
SELECT 22, 28 UNION ALL
SELECT 23, 29
COMMIT;
RAISERROR (N'[dbo].[seriesdir]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

BEGIN TRANSACTION;
INSERT INTO [dbo].[seriesgen]([gen_id], [ser_id])
SELECT 1, 3 UNION ALL
SELECT 2, 10 UNION ALL
SELECT 2, 11 UNION ALL
SELECT 2, 12 UNION ALL
SELECT 2, 15 UNION ALL
SELECT 2, 16 UNION ALL
SELECT 2, 19 UNION ALL
SELECT 2, 25 UNION ALL
SELECT 3, 9 UNION ALL
SELECT 3, 10 UNION ALL
SELECT 3, 11 UNION ALL
SELECT 3, 12 UNION ALL
SELECT 3, 13 UNION ALL
SELECT 3, 15 UNION ALL
SELECT 3, 16 UNION ALL
SELECT 3, 19 UNION ALL
SELECT 3, 20 UNION ALL
SELECT 3, 23 UNION ALL
SELECT 3, 25 UNION ALL
SELECT 3, 26 UNION ALL
SELECT 3, 28 UNION ALL
SELECT 3, 29 UNION ALL
SELECT 4, 8 UNION ALL
SELECT 5, 8 UNION ALL
SELECT 6, 9 UNION ALL
SELECT 7, 12 UNION ALL
SELECT 8, 13 UNION ALL
SELECT 9, 14 UNION ALL
SELECT 9, 21 UNION ALL
SELECT 9, 27 UNION ALL
SELECT 10, 16 UNION ALL
SELECT 11, 18 UNION ALL
SELECT 11, 26 UNION ALL
SELECT 11, 28 UNION ALL
SELECT 11, 29 UNION ALL
SELECT 12, 23 UNION ALL
SELECT 13, 24
COMMIT;
RAISERROR (N'[dbo].[seriesgen]: Insert Batch: 1.....Done!', 10, 1) WITH NOWAIT;
GO

