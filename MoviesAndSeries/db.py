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
        self.__conn = pyodbc.connect('Driver={SQL Server};'
                                   'Server=localhost;'
                                   'Database={dbname};'.format(dbname = dbname)
                                   'Trusted_Connection=yes;')
        
        

        # predefined queries

        # retrieving a table data
        self.SELECT_QUERY = 'SELECT * FROM {tblname}'
        # deleting all records of a table
        self.DELETE_QUERY = 'DELETE from {tblname}'

    def getMovies(self):
        pass

    def getSeries(self):
        pass

    def getActors(self):
        pass

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
            cursor = self.__conn.cursor(rawquery)
        else :
            cursor = self.__conn.cursor(rawquery.format(tblname = tablename))
        
        return cursor

    def baconNumber(self):
        '''
            TODO : finding the bacon number of the actor id
                the actor himself is zero
                    with one common movies one
                        actors played with the one number are two
                            and so on.
        '''
        pass

    def getWithGenre(self,genrename):
        '''
            TODO : get all movies and series with genre of genrename
        '''
        pass

    def getAllWithNameAndYear(self,fname,lname,year):
        '''
            TODO : returns all movies and series of the actor(fname,lname) and the year
        '''
        pass

    def getTwoCommonActors(self):
        '''
            TODO : return all movies and series that contai two or more common
                actors
        '''
        pass

    def getSameGenre_M_S_WithYear(self,fname,lname,year):
        '''
            TODO : get the movies and series that an actor played with same genre
                in one year PayAttention to case insensitivity
        '''
        pass

    def rateAndComment(self,m_or_s,id,rate,comment):
        '''
            m_or_s : 'm' 's' single char that shows if it is a movie or series
            id : id of the movie or series
            rate and comment
            adding this to new table temp till the admin accept it or reject
        '''
        pass

    def findM_And_L(self):
        '''
            returns most played actor and least played
        '''
        pass

    def adminAddNewGenre(self,genre):
        '''
            insertion query adding new genre
        '''
        pass

    def getListOfComments(self):
        '''
            return all the unchecked comments
                if accept delete and add to new table
                else delete that
        '''
        pass