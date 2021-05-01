from flask import Flask, request
from flask_restful import Resource, Api
from flask_sqlalchemy import SQLAlchemy
import os
from os.path import join, dirname
from dotenv import load_dotenv

dotenv_path = join(dirname(__file__), '.env')
load_dotenv()

def create_app():
    app = Flask(__name__)
    return app

# Database
def crete_datebase(app):
    # TODO: create a remote database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///test.db'
    # app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:test@35.222.188.2/test_db'
    app.config['SECRET_KEY'] = os.getenv('SECRET')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db = SQLAlchemy(app)
    return db

# Flask App
app = create_app()
