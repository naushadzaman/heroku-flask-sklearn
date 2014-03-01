from flask import render_template, flash, redirect
from app import app
from forms import LoginForm
from forms import InputLocation

@app.route('/')
@app.route('/index')
def index():
    user = { 'nickname': 'Miguel' }
    posts = [
        { 
            'author': { 'nickname': 'John' }, 
            'body': 'Beautiful day in Portland!' 
        },
        { 
            'author': { 'nickname': 'Susan' }, 
            'body': 'The Avengers movie was so cool!' 
        }
    ]
    return render_template('index.html',
        title = 'Home',
        user = user,
        posts = posts)

@app.route('/login', methods = ['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        flash('Login requested for OpenID="' + form.openid.data + '", remember_me=' + str(form.remember_me.data))
        return redirect('/index')
    return render_template('login.html', 
        title = 'Sign In',
        form = form,
        providers = app.config['OPENID_PROVIDERS'])


@app.route('/input', methods = ['GET', 'POST'])
def input():
	form = InputLocation()
	results = [
        {
            'name': 'Weber State University',
            'rating': '9.0',
	    'url': 'http://www.yelp.com/biz/weber-state-university-ogden-4',
	    'photo': 'http://s3-media1.ak.yelpcdn.com/bphoto/0bzEERwyYnp5GTgyC56kqg/l.jpg'
        },
        {
            'name': 'Two Creek Coffee House',
            'rating': '8.9',
            'url': 'http://www.yelp.com/biz/two-creek-coffee-house-bountiful',
            'photo': 'http://s3-media1.ak.yelpcdn.com/bphoto/0bzEERwyYnp5GTgyC56kqg/l.jpg'
        }
    ]

	if form.validate_on_submit():
		flash('Zipcode: ' + form.zipcode.data)
		return render_template('results.html', 
			title = 'Entered Location', 
			results = results)
	return render_template('input.html',
		title = 'Enter Location',
		form = form)




