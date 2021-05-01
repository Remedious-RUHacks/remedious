from flask import Flask, request
from flask_restful import Resource, Api
from flask_login import LoginManager, current_user, logout_user, login_user, UserMixin 
from modals import db, User, Role, UserRole, Voluntier
from app_config import app

api = Api(app)

# Login
login_manager = LoginManager()
login_manager.init_app(app)

@login_manager.user_loader
def load_user(id):
    return User.query.get(id)

class SignIn(Resource):



api.add_resource(SignIn, '/signin')

if __name__ == '__main__':
    app.run(debug=True)