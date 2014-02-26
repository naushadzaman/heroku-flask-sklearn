heroku-flask-sklearn
====================

Heroku buildpack: Python, Numpy, Scipy, Scikit-learn along with instructions to install Flask, the web framework, and Gunicorn, the web server.

Demo
----
    # setup pre-requisites
    $ curl https://raw.github.com/naushadzaman/heroku-flask-sklearn/master/setup_prerequisite.sh | sh

    $ git clone https://github.com/naushadzaman/heroku-flask-sklearn
    
    $ mkdir sample-foo
    $ cd sample-foo/
    
    $ cp ../heroku-flask-sklearn/.gitignore .
    $ cp ../heroku-flask-sklearn/Procfile .	
    $ cp ../heroku-flask-sklearn/hello.py .
    
    $ rm -rf ../heroku-flask-sklearn

    $ heroku login

    # create heroku buildpack with sklearn and its pre-requisites
    $ git init
    $ heroku create --buildpack https://github.com/naushadzaman/heroku-buildpack-python-sklearn/

    $ git add .
    $ git commit -m 'initialize'

    $ foreman start
    ctrl + C

    $ git push heroku master
 
    $ heroku scale web=1
    $ heroku ps
