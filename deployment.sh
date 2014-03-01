#!/bin/sh

# setup pre-requisites
#curl https://raw.github.com/naushadzaman/heroku-flask-sklearn/master/setup_prerequisite.sh | sh

#git clone https://github.com/naushadzaman/heroku-flask-sklearn

#mkdir flask-sklearn
#cd flask-sklearn/

cp ../heroku-flask-sklearn/.gitignore .
cp ../heroku-flask-sklearn/Procfile .
cp ../heroku-flask-sklearn/hello.py .
cp ../heroku-flask-sklearn/requirements.txt .

rm -rf ../heroku-flask-sklearn

heroku login

# create heroku buildpack with sklearn and its pre-requisites
git init
heroku create --buildpack https://github.com/naushadzaman/heroku-buildpack-python-sklearn/

git add .
git commit -m 'initialize'

foreman start
#ctrl + C

git push heroku master

heroku scale web=1
heroku ps
