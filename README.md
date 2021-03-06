heroku-flask-sklearn
====================
Install numpy, scipy, sklearn, flask and gunicorn in AWS (Amazon Web Services) and Heroku. 

Heroku buildpack: Python, Numpy, Scipy, Scikit-learn along with instructions to install Flask, the web framework, and Gunicorn, the web server.

Initial Setup for both AWS and Heroku 
-----
	$ git clone https://github.com/naushadzaman/heroku-flask-sklearn
	
	$ cd heroku-flask-sklearn/
	
	# initial setup 
	$ ./onetime_setup.sh
	
	# setup virtualenv 
	$ virtualenv venv --distribute --no-site-packages
	$ source venv/bin/activate
		
	# onetime setup for sklearn 
	$ ./onetime_setup_sklearn.sh 
	
	
	$ heroku login
	
	# create heroku buildpack with sklearn and its pre-requisites
	$ heroku create --buildpack https://github.com/naushadzaman/heroku-buildpack-python-sklearn/
	$ heroku create your-app-name --buildpack https://github.com/naushadzaman/heroku-buildpack-python-sklearn/	

	$ git add .
	$ git commit -m 'initialize'
	
	$ foreman start
	ctrl + C
	
	$ git push heroku master
	 
	$ heroku scale web=1
	$ heroku ps

Run next times after changing codes
-----
	$ cd flask-sklearn/
	$ source venv/bin/activate
	
	$ foreman start
	ctrl + C
	
	# modify codes 

	$ heroku scale web=1
	$ heroku ps
	
	# commit to git 
	$ git add .
	$ git commit -m 'modify'
	$ git push heroku master
	
	$ heroku scale web=1
	$ heroku ps


Setup for AWS only 
-----
	# initial setup 
	$ curl https://raw.github.com/naushadzaman/heroku-flask-sklearn/master/onetime_setup.sh | sh
	
	# setup virtualenv 
	$ virtualenv venv --distribute --no-site-packages
	$ source venv/bin/activate
		
	# onetime setup for sklearn 
	$ curl https://raw.github.com/naushadzaman/heroku-flask-sklearn/master/onetime_setup_sklearn.sh | sh
