Demo
----
    # setup pre-requisites
    $ curl https://raw.github.com/naushadzaman/heroku-flask-sklearn/master/setup.sh | sh

    $ mkdir sample-heroku-flask-sklearn
    $ cd sample-heroku-flask-sklearn/

    $ heroku login

    # create heroku buildpack with sklearn and its pre-requisites 
    $ git init
    $ heroku create --buildpack https://github.com/naushadzaman/heroku-buildpack-python-sklearn/

    $ echo -e "numpy==1.7.0\nscipy==0.11.0\nscikit-learn==0.13.1" > requirements.txt

    $ git add .
    $ git commit -m 'init'

    $ foreman start
    $ heroku scale web=1
    $ heroku ps

    $ git push heroku master