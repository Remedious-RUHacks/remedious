from flask import Flask, request
from flask_login import LoginManager, current_user, logout_user, login_user, UserMixin 
from modals import db, User, Academic
from app_config import app


# Login
login_manager = LoginManager()
login_manager.init_app(app)

@login_manager.user_loader
def load_user(id):
    return User.query.get(id)

# User Management
@app.route("/login", methods=["POST"])
def login():
    if current_user.is_authenticated:
        return {"Error": "Already Logged In"}

    # Get Data from the html
    user = User.query.filter_by(email=request.form.get("email")).first()
        
    if not user:
        return {"Error": "User Not Available"}
    elif user.verify_password(request.form.get("password")):
        login_user(user)
        return {"Success": "Logged In"}
    else:
        return {"Error": "Incorrect Username or Password"}

    return {"Error": "An Error Occured"}


@app.route("/signup", methods=["POST"])
def signup():
    if current_user.is_authenticated:
        # Already Logged In
        return {"Error": "Already LoggedIn"}

    # Get all data from html
    firstname = request.form.get("firstname")
    lastname = request.form.get("lastname")
    email = request.form.get("email")
    password = request.form.get("password")

    user = User.query.filter_by(email=email).first()
    
    if user:
        return {"Error": "User Already Exist"}
    else:
        new_user = User(firstname, lastname, password, email)

        db.session.add(new_user)
        db.session.commit()            
        return {"Success": f"Account Succesfull Created for {new_user.firstname}"}
    return {"Error": "Error Occured!"}

@app.route("/logout", methods=["POST"])
def logout():
    if current_user.is_authenticated:
        logout_user()
        return {"Success": "Logged out!"}
    return {"Error": "Not Logged In"}

if __name__ == '__main__':
    app.run(debug=True)