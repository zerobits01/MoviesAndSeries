'''
    a flask app to connect it to database
        of movies and series sql-server
'''
from flask import Flask, jsonify, request
app = Flask(__name__)

@app.route('/', methods=['GET','POST'])
def hello_world():
    return jsonify({
        'test' : request.json
    })


if __name__ == '__main__':
    app.run()