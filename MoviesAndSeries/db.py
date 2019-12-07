'''
    db connections and functions
'''

import pyodbc


class MyDataBase:
    '''
        This is a class for connecting to your SQL Server DataBase
    '''

    def __init__(self, dbname):
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
        return cur

    def getGenres(self):
        cur = self.cursor.execute(self.SELECT_QUERY.format(tblname='genres'))
        return cur

    def getSeries(self):
        cur = self.cursor.execute(self.SELECT_QUERY.format(tblname='series'))
        return cur
        
    def getActors(self):
        cur = self.cursor.execute(self.SELECT_QUERY.format(tblname='actors'))
        return cur
        
    def getMoviesWithGenre(self,genrename):
        '''
            TODO : get all movies and series with genre of genrename
        '''
        MQ = """ SELECT *
            from movies M1 join moviesgen M2
                on M1.mov_id = M2.mov_id
                    join genres G
                        on G.gen_id = M2.gen_id
            where G.gen_title like '{genre}'
        """
        movies = self.cursor.execute(MQ.format(genre=genrename))
        return movies

    def getSeriesWithGenre(self,genrename):
        '''
            TODO : get all movies and series with genre of genrename
        '''
        SQ = """ SELECT *
            from series M1 join seriesgen M2
                on M1.ser_id = M2.ser_id
                    join genres G
                        on G.gen_id = M2.gen_id
            where G.gen_title like '{genre}' 

        """
        series = self.cursor.execute(SQ.format(genre=genrename))
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
            where A.act_fname = '{fname}' and A.act_lname = '{lname}' and M.mov_year = '{year}'
        """
        cur = self.cursor.execute(MQ.format(fname=fname,lname=lname,year=year))
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
            where A.act_fname = '{fname}' and A.act_lname = '{lname}' and S.ser_year = '{year}'
        """
        cur = self.cursor.execute(SQ.format(fname=fname,lname=lname,year=year))
        return cur


    def adminAddNewGenre(self,genre):
        '''
            insertion query adding new genre
        '''
        GQ = """ INSERT INTO genres(gen_title)
            values('{gen_title}')
        """
        cur = self.cursor.execute(GQ.format(gen_title=genre))
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
        cur = self.cursor.execute(MQ)
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
        cur = self.cursor.execute(SQ)
        return cur

    def acceptComment(self, sermov, revid, id):
        ''' 
            TODO : accept the comment
        '''
        res = []

        if sermov == 'S' :
            SQ = """ UPDATE seriesrate
                set accepted = 1
                where rev_id = {revid} and ser_id = {serid} 
            """
            cur = self.cursor.execute(SQ.format(revid=revid,serid=id))
            res.append(cur)
        elif sermov == 'M'  : 
            MQ = """ UPDATE moviesrate
                set accepted = 1
                where mov_id = {movid} and rev_id = {revid}
            """
            cur = self.cursor.execute(MQ.format(movid=id,revid=revid))
            res.append(cur)

        return res

    def rateAndComment(self,sermov,revid,id,rate,comment):
        '''
            m_or_s : 'm' 's' single char that shows if it is a movie or series
            id : id of the movie or series
            rate and comment
            adding this to new table temp till the admin accept it or reject
        '''
        res = []

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
        res = self.cursor.execute(Query.format(year=year))
        return res


    def baconNumber(self):
        '''
            TODO : finding the bacon number of the actor id
                the actor himself is zero
                    with one common movies one
                        actors played with the one number are two
                            and so on.
        '''
        pass

    # with niloufar : 
    def findM_And_L(self):
        '''
            returns most played actor and least played
        '''
        pass
    
    def getTwoCommonActors(self):
        '''
            TODO : return all movies and series that contai two or more common
                actors
        '''
        MQ = """ SELECT *
            from actors A join moviescast MC
                on A.act_id = MC.act_id
                    join movies M
                        on MC.mov_id = M.mov_id
            where A.act_fname = '{fname}' and A.act_lname = '{lname}' and M.mov_year = '{year}'
        """
        SQ = """ SELECT *
            from actors A join seriescast SC
                on A.act_id = SC.act_id
                    join series S
                        on SC.ser_id = S.ser_id
            where A.act_fname = '{fname}' and A.act_lname = '{lname}' and S.ser_year = '{year}'
        """
        res = []
        cur = self.cursor.execute(MQ.format(fname=fname,lname=lname,year=year))
        res.append(cur)
        cur = self.cursor.execute(SQ.format(fname=fname,lname=lname,year=year))
        res.append(cur)
        return res

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