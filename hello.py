import os
from flask import Flask
from sklearn import svm

app = Flask(__name__)

@app.route('/')

def hello():
	X = [[0, 0], [2, 2]]
	y = [0.5, 2.5]
	clf = svm.SVR()
	clf.fit(X, y) 
	predict = clf.predict([[1, 1]])
	return "world " + str(predict.tolist()) + " hello new"



