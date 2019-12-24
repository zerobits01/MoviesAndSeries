'''
    db connections and functions
'''

import pyodbc


class MyDataBase:
    '''
        This is a class for connecting to your SQL Server DataBase
    '''

    def __init__(self):
        '''
            dbname : input argument string name of your database
        '''
        # creating the connection on localhost with the dbname
        self.conn = pyodbc.connect('Driver={SQL Server};'
                                   'Server=localhost;'
                                   'Database=MoviesAndSeries;'
                                   'Trusted_Connection=yes;')
        self.cursor = self.conn.cursor()
        # predefined queries

        # retrieving a table data
        self.SELECT_QUERY = 'SELECT * FROM {tblname}'
        # deleting all records of a table
        self.DELETE_QUERY = 'DELETE from {tblname}'

    def getMovies(self):
        cur = self.cursor.execute(self.SELECT_QUERY.format(tblname='movies'))
        ##self.conn.commit()
        return cur

    def getGenres(self):
        self.cursor = self.conn.cursor()
        cur = self.cursor.execute(self.SELECT_QUERY.format(tblname='genres'))
        ##self.conn.commit()
        return cur

    def getSeries(self):
        self.cursor = self.conn.cursor()
        cur = self.cursor.execute(self.SELECT_QUERY.format(tblname='series'))
        #self.conn.commit() 
        return cur
        
    def getActors(self):
        self.cursor = self.conn.cursor()
        cur = self.cursor.execute(self.SELECT_QUERY.format(tblname='actors'))
        #self.conn.commit()
        return cur
        
    def getMoviesWithGenre(self,genrename):
        '''
            TODO : get all movies and series with genre of genrename
        '''
        self.cursor = self.conn.cursor()
        MQ = """ SELECT *
            from movies M1 join moviesgen M2
                on M1.mov_id = M2.mov_id
                    join genres G
                        on G.gen_id = M2.gen_id
            where G.gen_title like '{genre}'  or G.gen_title like '{genre1}'
        """
        movies = self.cursor.execute(MQ.format(genre=genrename, genre1=genrename.capitalize()))
        #self.conn.commit()
        return movies

    def getSeriesWithGenre(self,genrename):
        '''
            TODO : get all movies and series with genre of genrename
        '''
        self.cursor = self.conn.cursor()
        SQ = """ SELECT *
            from series M1 join seriesgen M2
                on M1.ser_id = M2.ser_id
                    join genres G
                        on G.gen_id = M2.gen_id
            where G.gen_title like '{genre}' or G.gen_title like '{genre1}' 

        """
        series = self.cursor.execute(SQ.format(genre=genrename,genre1=genrename.capitalize()))
        #self.conn.commit()
        return series

    def getMoviesWithNameAndYear(self,fname,lname,year):
        '''
            TODO : returns all movies and series of the actor(fname,lname) and the year
        '''
        MQ = """ SELECT *
            from actors A join moviescast MC
                on A.act_id = MC.act_id
                    join movies M
                        on MC.mov_id = M.mov_id
            where A.act_fname = '{fname}' and A.act_lname = '{lname}' and YEAR(M.mov_year) = '{year}'
        """
        self.cursor = self.conn.cursor()
        cur = self.cursor.execute(MQ.format(fname=fname.capitalize(),lname=lname.capitalize(),year=year))
        #self.conn.commit()
        return cur

    def getSeriesWithNameAndYear(self,fname,lname,year):
        '''
            TODO : returns all movies and series of the actor(fname,lname) and the year
        '''
        SQ = """ SELECT *
            from actors A join seriescast SC
                on A.act_id = SC.act_id
                    join series S
                        on SC.ser_id = S.ser_id
            where A.act_fname = '{fname}' and A.act_lname = '{lname}' and YEAR(S.ser_year) = '{year}'
        """
        self.cursor = self.conn.cursor()
        cur = self.cursor.execute(SQ.format(fname=fname.capitalize(),lname=lname.capitalize(),year=year))
        #self.conn.commit()
        return cur

    def adminAddNewGenre(self,genre):
        '''
            insertion query adding new genre
        '''
        GQ = """ INSERT INTO genres(gen_title)
            values('{gen_title}')
        """
        self.cursor = self.conn.cursor()
        cur = self.cursor.execute(GQ.format(gen_title=genre))
        self.conn.commit()
        return cur

    def adminDeleteGenre(self,genre):
        
        GQ = """ DELETE from genres
            where gen_title='{genre1}' or gen_title='{genre2}'
        """
        self.cursor = self.conn.cursor()
        cur = self.cursor.execute(GQ.format(genre1=genre,genre2=genre.capitalize()))
        self.conn.commit()
        return cur

    def getListOfUnacceptedCommentsMovies(self):
        '''
            return all the unchecked comments
                if accept delete and add to new table
                else delete that
        '''
        MQ = """ SELECT *
            from moviesrate M1 join movies M2
                on M1.mov_id = M2.mov_id
            where M1.accepted = 0
        """
        self.cursor = self.conn.cursor()
        cur = self.cursor.execute(MQ)
        self.conn.commit()
        return cur


    def getListOfUnacceptedCommentsSeries(self):
        '''
            return all the unchecked comments
                if accept delete and add to new table
                else delete that
        '''
        SQ = """ SELECT *
            from seriesrate S1 join series S2
                on S1.ser_id = S2.ser_id
            where S1.accepted = 0
        """
        self.cursor = self.conn.cursor()
        cur = self.cursor.execute(SQ)
        #self.conn.commit()
        return cur

    def acceptComment(self, sermov, revid, id):
        ''' 
            TODO : accept the comment
        '''
        res = []
        self.cursor = self.conn.cursor()
        if sermov == 'S' :
            SQ = """ UPDATE seriesrate
                set accepted = 1
                where rev_id = {revid} and ser_id = {serid} 

                update series
                    set reviewers = reviewers + 1
                where ser_id = {serid}
            """
            cur = self.cursor.execute(SQ.format(revid=revid,serid=id))
            res.append(cur)
        elif sermov == 'M'  : 
            MQ = """ UPDATE moviesrate
                set accepted = 1
                where mov_id = {movid} and rev_id = {revid}
                update movies
                    set reviewers = reviewers + 1
                where ser_id = {movid}
            """
            cur = self.cursor.execute(MQ.format(movid=id,revid=revid))
            res.append(cur)
        #self.conn.commit()
        return res

    def addOrGetRev(self,rev_uname):
        Q1 = """ SELECT * 
            from reviewers
            where rev_uname='{uname}'
        """
        cur = self.cursor.execute(Q1.format(uname=rev_uname))
        user = cur.fetchone()
        
        Q2 = """ INSERT into reviewers
            values('{uname}')
        """
        if user is None: 
            cur = self.cursor.execute(Q2.format(uname=rev_uname))
            cur = self.cursor.execute(Q1.format(uname=rev_uname))
            user = cur.fetchone()
        self.conn.commit()
        return user[0]

    def rateAndComment(self,sermov,rev_uname,id,rate,comment):
        '''
            m_or_s : 'm' 's' single char that shows if it is a movie or series
            id : id of the movie or series
            rate and comment
            adding this to new table temp till the admin accept it or reject
        '''
        res = []
        revid = self.addOrGetRev(rev_uname)
        if sermov == 'S' :
            SQ = """ INSERT into seriesrate(rev_id,ser_id,rate,comment)
                        values({revid},{serid},{rate},'{comment}')
            """
            cur = self.cursor.execute(SQ.format(revid=revid,serid=id,rate=rate,comment=comment))
            res.append(cur)
        elif sermov == 'M'  : 
            MQ = """ INSERT into moviesrate(rev_id,mov_id,rate,comment)
                        values({revid},{movid},{rate},'{comment}')
            """
            cur = self.cursor.execute(MQ.format(movid=id,revid=revid,rate=rate,comment=comment))
            res.append(cur)
        self.conn.commit()
        return res

    def getSameGenre_M_S_WithYear(self,year):
        '''
            TODO : get the movies and series that an actor played with same genre
                in one year PayAttention to case insensitivity
        '''
        Query = """ WITH TM(mov_id,mov_title,mov_year,mov_genre,genrename,mov_act,fname,lname)
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
            where YEAR(TM.mov_year) = '{year}' and TM.mov_year = TS.ser_year
                and TM.mov_act = TS.ser_act
        """
        self.cursor = self.conn.cursor()
        res = self.cursor.execute(Query.format(year=year))
        #self.conn.commit()
        return res

    def baconNumberMovies(self,act_id,bacon_no):
        Query = """ select distinct M2.act_id
            from moviescast M1,moviescast M2
            where M1.mov_id = M2.mov_id 
                and M1.act_id != M2.act_id
                    and M1.act_id = {act_id}
        """
        self.cursor = self.conn.cursor()
        bacons = []
        allids = set()
        bacons.append([act_id])
        allids.add(act_id)
        for i in range(0,bacon_no):
            bacons.append([])
            for act_id in bacons[i]:
                for rec in self.cursor.execute(Query.format(act_id=act_id)) :
                    if rec.act_id not in allids :
                        bacons[i+1].append(rec.act_id)
                        allids.add(rec.act_id)
        #self.conn.commit()
        return bacons

    def baconNumberSeries(self,act_id,bacon_no):
        Query = """ select distinct M2.act_id
            from seriescast M1,seriescast M2
            where M1.ser_id = M2.ser_id 
                and M1.act_id != M2.act_id
                    and M1.act_id = {act_id}
        """
        self.cursor = self.conn.cursor()
        bacons = []
        allids = set()
        bacons.append([act_id])
        allids.add(act_id)
        for i in range(0,bacon_no):
            bacons.append([])
            for act_id in bacons[i]:
                for rec in self.cursor.execute(Query.format(act_id=act_id)) :
                    if rec.act_id not in allids :
                        bacons[i+1].append(rec.act_id)
                        allids.add(rec.act_id)
        #self.conn.commit()
        return bacons

    # with niloufar : 
    def findM_And_L(self):
        '''
            returns most played actor and least played
        '''
        self.cursor = self.conn.cursor()
        most_active = """with table1(act_id , mov_id , rol) as (									
                (select * 
                from moviescast) 
                union 
                (select * from seriescast)
            )

            select top(1) actors.act_fname , actors.act_lname
            from table1 , actors
            where table1.act_id = actors.act_id
            group by actors.act_fname , actors.act_lname
            order by COUNT(*) desc , actors.act_lname
        """
    
        least_active = """with table1(act_id , mov_id , rol) as (									
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
        """
        res = []
        cur = self.cursor.execute(most_active)
        res.append(cur.fetchall())
        cur = self.cursor.execute(least_active)
        res.append(cur.fetchall())
        #self.conn.commit()
        return res

    def getTwoCommonActors(self):
        '''
            TODO : return all movies and series that contai two or more common
                actors
        '''
        MQ = """ with t(mov_id,mov_title,cnt_rows)
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
        """
        self.cursor = self.conn.cursor()
        cur = self.cursor.execute(MQ)
        #self.conn.commit()
        return cur

    def runQuery(self,rawquery,tablename):
        '''
            you can use your own query or 
                use the class predefined queries
                    MyDataBase.SELECT_QUERY
                    MyDataBase.DELETE_QUERY
                if you use these types give the table name
            returns : a list of tuples which is the answer of the query execution
        '''
        if tablename is None:
            cursor = self.cursor.execute(rawquery)
        else :
            cursor = self.cursor.execute(rawquery.format(tblname = tablename))
        
        return cursor
    
'''
    TODO : bacon number
    Niloufar TODO : Most and Least, Two Common actors
'''

# mydb = MyDataBase()
# print(mydb.addOrGetRev('name'))
# mydb.baconNumberMovies(42,3)
# mydb.baconNumberSeries(1,3)
