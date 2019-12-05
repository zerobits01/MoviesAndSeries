'''
    a flask app to connect it to database
        of movies and series sql-server
'''
from flask import Flask, jsonify, request
app = Flask(__name__)

# return the data in tables
@app.route('/movies', methods=['GET'])
def returnMovies():
    return jsonify({
        'test' : request.json
    })


@app.route('/series', methods=['GET'])
def returnSeries():
    return jsonify({
        'test' : request.json
    })

@app.route('/actors', methods=['GET'])
def returnActors():
    return jsonify({
        'test' : request.json
    })





@app.route('/bacon/<number>', methods=['GET'])
def bacon(number):
    return jsonify({
        'test' : request.json
    })

@app.route("/genre/<genre>",  methods=['GET'])
def returnAllWithGenre(genre):
    assert section == request.view_args['genre']


@app.route('/fname/<fname>/lname/<lname>/year/<year>', methods=['GET'])
def returnAllMSActors(fname,lname,year):
    return jsonify({
        'test' : request.json
    })


@app.route("/twocommon",  methods=['GET'])
def twoCommon():
    return jsonify({
            'test' : request.json
        })


@app.route("/samegenre/<year>",  methods=['GET'])
def sameGenre(year):
    assert year == request.view_args['year']

@app.route("/rate",  methods=['POST'])
def rate(genre):
    return jsonify({
            'test' : request.json
        })

@app.route("/findml",  methods=['GET'])
def findml():
    return jsonify({
            'test' : request.json
        })

@app.route("/newgenre",  methods=['POST'])
def newGenre():
    return jsonify({
            'test' : request.json
        })

@app.route("/acception",  methods=['POST'])
def acception():
    return jsonify({
        'test' : request.json
    })


if __name__ == '__main__':
    app.run()