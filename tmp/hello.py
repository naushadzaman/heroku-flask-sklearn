import os
from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route('/')
@app.route('/index')

def index(): 
	user = { 'nickname': 'Naushad' } # fake user
	return '''
<html>
  <head>
    <title>Home Page</title>
  </head>
  <body>
    <h1>Hello, ''' + user['nickname'] + '''</h1>
  </body>
</html>
'''

