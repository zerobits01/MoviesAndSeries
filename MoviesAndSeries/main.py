'''
    a flask app to connect it to database
        of movies and series sql-server
    it is really easy to use flask apps for rendering statics and
        templates. we can use it beside other apps
'''
from flask import Flask, jsonify, request, render_template
from db import MyDataBase
from flask_cors import CORS
db = MyDataBase()

app = Flask(__name__)

CORS(app)


@app.route('/' , methods=['GET'])
def render_users():
    return render_template('users.html')

@app.route('/admin' , methods=['GET'])
def render_admin():
    return render_template('admin.html')


# return the data in tables
@app.route('/movies', methods=['GET'])
def returnMovies():
    rows = db.getMovies().fetchall()
    return jsonify([{
        'mov_id' : r.mov_id,
        'mov_title' : r.mov_title,
    } for r in rows] )


@app.route('/series', methods=['GET'])
def returnSeries():
    rows = db.getSeries().fetchall()
    return jsonify([{
        'ser_id' : r.ser_id,
        'ser_title' : r.ser_title,
    } for r in rows] )


@app.route('/actors', methods=['GET'])
def returnActors():
    rows = db.getActors().fetchall()
    return jsonify([{
        'act_id' : r.act_id,
        'act_fname' : r.act_fname,
        'act_lname' : r.act_lname
    } for r in rows] )


@app.route('/genres', methods=['GET'])
def returnGenres():
    rows = db.getGenres().fetchall()
    return jsonify([{
        'gen_id' : r.gen_id,
        'gen_title' : r.gen_title
    } for r in rows] )



@app.route('/actid/<act_id>/bacon/<number>/sermov/<sermov>', methods=['GET'])
def bacon(number,act_id,sermov):
    if sermov == 'M' :
        bacons = db.baconNumberMovies(act_id,number)
        return jsonify({
            'bacons' : bacons
        })
    elif sermov == 'S' :
        bacons = db.baconNumberSeries(act_id,number)
        return jsonify({
            'bacons' : bacons
        })
    else :
        return jsonify({
            'err' : "not acceptable data "
        })

@app.route("/genre/<genre>",  methods=['GET'])
def returnAllWithGenre(genre):
    # because the cursor is share if we change everything will change and
    # variables here are reference to them so this is why i got the same for movies and series
    # when i didn't care about the order
    movies = db.getMoviesWithGenre(genre)
    movies = [{
        'mov_id' : r.mov_id,
        'mov_time' : r.mov_time,
        'mov_title' : r.mov_title,
        'gen_id' : r.gen_id,
        'gen_title' : r.gen_title
    } for r in movies]
    # not to first fetch all movies and series then creating the lists
    series = db.getSeriesWithGenre(genre)
    col_names = [x[0] for x in series.description]
    print(col_names)
    series = [{
        'ser_id' : r.ser_id,
        'ser_title' : r.ser_title,
        'gen_id' : r.gen_id,
        'gen_title' : r.gen_title
    } for r in series]
    
    return jsonify({
        'movies' : movies,
        'series' : series
    })

@app.route('/fname/<fname>/lname/<lname>/year/<year>', methods=['GET'])
def returnAllMSActors(fname,lname,year):
    movies = db.getMoviesWithNameAndYear(fname,lname,year)
    movies = [{
        'mov_id' : r.mov_id,
        'mov_time' : r.mov_time,
        'mov_title' : r.mov_title
    } for r in movies]
    # not to first fetch all movies and series then creating the lists
    series = db.getSeriesWithNameAndYear(fname,lname,year)
    col_names = [x[0] for x in series.description]
    print(col_names)
    series = [{
        'ser_id' : r.ser_id,
        'ser_title' : r.ser_title
    } for r in series]
    
    return jsonify({
        'movies' : movies,
        'series' : series
    })


@app.route("/samegenre/<year>",  methods=['GET'])
def sameGenre(year):
    mands = db.getSameGenre_M_S_WithYear(year)

    return jsonify([
        {
            'mov_id' : r.mov_id,
            'mov_title' : r.mov_title,
            'ser_title' : r.ser_title,
            'mov_year' : r.mov_year,
            'gen_title' : r.gen_title,
            'act_fname' : r.act_fname,
            'act_lname' : r.act_lname,
            'act_id' : r.act_id
        } for r in mands
    ])

@app.route("/rate",  methods=['POST','GET'])
def rate():
    body = request.json
    try:
        res = db.rateAndComment(body['sermov'],body['revid'],body['id'],body['rate'],body['comment'])
        return jsonify({
                'msg' : "rate saved correctly!!",
                'res' : res
            })
    except:
        return jsonify({
                'msg' : "didn't save correctly!!!?!?!?",
                'status' : 406
            })


@app.route("/unaccepted", methods=['GET'])
def getUnaccepted():
    movies = db.getListOfUnacceptedCommentsMovies()
    movies = [{
        'rev_id' : r.rev_id,
        'mov_id' : r.mov_id,
        'rate' : r.rate,
        'accepted' : r.accepted,
        'comment' : r.comment,
    } for r in movies]
    
    series = db.getListOfUnacceptedCommentsSeries()
    series = [{
        'rev_id' : r.rev_id,
        'ser_id' : r.ser_id,
        'rate' : r.rate,
        'accepted' : r.accepted,
        'comment' : r.comment,
    } for r in series]

    return jsonify({
        'movies' : movies,
        'series' : series
    })

@app.route("/newgenre/<genre>",  methods=['GET'])
def newGenre(genre):
    try:
        res = db.adminAddNewGenre(genre)
        return jsonify({
                'msg' : "genre saved correctly!!",
            })
    except Exception as e:
        return jsonify({
                'msg' : "didn't save correctly!!!?!?!?",
                'status' : 406,
                'err' : str(e)
        })

@app.route("/acception",  methods=['POST'])
def acception():
    # serial or movie revid and the id of comments
    # after acception we have to update movies reviewers and add the reviewer
    try:
        res = db.acceptComment(body['sermov'],body['revid'],body['id'])
        return jsonify({
                'msg' : "genre saved correctly!!",
            })
    except Exception as e:
        return jsonify({
                'msg' : "didn't save correctly!!!?!?!?",
                'status' : 406,
                'err' : str(e)
        })



@app.route("/findml",  methods=['GET'])
def findml():
    r = db.findM_And_L()
    most_active = r[0][0].act_fname + ' ' + r[0][0].act_lname 
    least_active= r[1][0].act_fname + ' ' + r[1][0].act_lname
    return jsonify({
            'most_active' : most_active,
            'least_active': least_active
    })


@app.route("/twocommon",  methods=['GET'])
def twoCommon():
    try:
        movies = db.getTwoCommonActors()
        movies = [{
        'mov_title' : r.mov_title,
        } for r in movies]
        return jsonify({
                'movies' : movies,
            })
    except Exception as e:
        return jsonify({
                'msg' : "didn't save correctly!!!?!?!?",
                'status' : 406,
                'err' : str(e)
        })



if __name__ == "__main__" :
    app.run(host="0.0.0.0")
