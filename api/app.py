from flask import Flask, request
from flask_login import LoginManager, current_user, logout_user, login_user, UserMixin , login_required
from modals import db, User, Academic, PersonalDetail, Covid, Symptom, Remedy
from app_config import app
from datetime import datetime

# Login
login_manager = LoginManager()
login_manager.init_app(app)

@login_manager.user_loader
def load_user(id):
    return User.query.get(id)

@login_manager.user_loader
def load_academic(id):
    return Academic.query.get(id)

@app.route("/current", methods=["GET"])
def current():
    # login_user(Academic.query.get(1))
    return current_user.firstname

# User Management
@app.route("/login-academic", methods=["POST"])
def login_academic():
    if current_user.is_authenticated:
        return {"Error": "Already Logged In"}

    # Get Data from the html
    user = Academic.query.filter_by(email=request.form.get("email")).first()
        
    if not user:
        return {"Error": "User Not Available"}
    elif user.verify_password(request.form.get("password")):
        login_user(user)
        return {"Success": "Logged In"}
    else:
        return {"Error": "Incorrect Username or Password"}

    return {"Error": "An Error Occured"}


@app.route("/signup-academic", methods=["POST"])
def signup_academic():
    if current_user.is_authenticated:
        # Already Logged In
        return {"Error": "Already LoggedIn"}

    # Get all data from html
    firstname = request.form.get("firstname")
    lastname = request.form.get("lastname")
    email = request.form.get("email")
    password = request.form.get("password")

    user = Academic.query.filter_by(email=email).first()
    
    if user:
        return {"Error": "User Already Exist"}
    else:
        new_user = Academic(firstname, lastname, password, email)

        db.session.add(new_user)
        db.session.commit()            
        return {"Success": f"Account Succesfull Created for {new_user.firstname}"}
    return {"Error": "Error Occured!"}

@login_required
@app.route("/logout-academic", methods=["POST"])
def logout_academic():
    if current_user.is_authenticated:
        logout_user()
        return {"Success": "Logged out!"}
    return {"Error": "Not Logged In"}



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

@login_required
@app.route("/logout", methods=["POST"])
def logout():
    if current_user.is_authenticated:
        logout_user()
        return {"Success": "Logged out!"}
    return {"Error": "Not Logged In"}

@login_required
@app.route("/personal-deatils", methods=["PUT", "GET"])
def personal_details():

    # Is presonal_deatils
    personal_detail = PersonalDetail.query.filter_by(user_id= current_user.id).first()

    if not personal_detail and request.method=="PUT":
        new_detail = PersonalDetail(request.form.get("age"), 
                                    request.form.get("gender"),
                                    request.form.get("ethnic_background"),
                                    request.form.get("health_condition"),
                                    request.form.get("medication"),
                                    current_user)
        db.session.add(new_detail)
        db.session.commit()
        details = {"id": new_detail.id, "age": new_detail.age, 
                    "gender": new_detail.gender, 
                    "ethnic_background": new_detail.ethnic_background, 
                    "health_condition": new_detail.health_condition,
                    "medication": new_detail.medication}
        return {"Success": details}
    
    details = {"id": new_detail.id, "age": new_detail.age, 
                    "gender": new_detail.gender, 
                    "ethnic_background": new_detail.ethnic_background, 
                    "health_condition": new_detail.health_condition,
                    "medication": new_detail.medication}
    return {"Personal Details": details}
         
@login_required
@app.route("/covid-questions", methods=["PUT", "GET"])
def covid_questions():

    # Is presonal_deatils
    covid_data = Covid.query.filter_by(user_id= current_user.id).first()

    if not covid_data and request.method=="PUT":
        new_detail = Covid(request.form.get("age"), 
                                    request.form.get("is_symptoms"),
                                    request.form.get("is_tested"),
                                    request.form.get("result"),
                                    request.form.get("is_treatment"),
                                    request.form.get("treatment"),
                                    request.form.get("is_recoverd"),
                                    request.form.get("is_long_term"),
                                    current_user)
        db.session.add(new_detail)
        db.session.commit()
        details = {"id": new_detail.id, "is_symptoms": new_detail.is_symptoms, 
                    "is_tested": new_detail.is_tested, 
                    "result": new_detail.result, 
                    "is_treatment": new_detail.is_treatment,
                    "is_recoverd": new_detail.is_recoverd,
                    "is_long_term": new_detail.is_long_term,
                    }
        return {"Success": details}
    
    details = {"id": new_detail.id, "is_symptoms": new_detail.is_symptoms, 
                    "is_tested": new_detail.is_tested, 
                    "result": new_detail.result, 
                    "is_treatment": new_detail.is_treatment,
                    "is_recoverd": new_detail.is_recoverd,
                    "is_long_term": new_detail.is_long_term,
                }
    return {"Covid Details": details}
         
@login_required         
@app.route("/symptoms", methods=["PUT", "GET"])
def symptoms():

    # Is Symptoms
    symptoms = Symptom.query.filter_by(user_id= current_user.id).first()

    if not symptoms and request.method=="PUT":
        new_detail = Symptom( request.form.get("symptoms"),
                                    request.form.get("level"),
                                    request.form.get("frequency"),
                                    current_user,
                                    datetime.now().strftime("%m/%d/%Y")
                                    )
        db.session.add(new_detail)
        db.session.commit()
        details = {"id": new_detail.id, "symptoms": new_detail.symptoms, 
                    "level": new_detail.level, 
                    "frequency": new_detail.frequency,
                    "date": new_detail.date, 
                    }
        return {"Success": details}
    
    details = {"id": new_detail.id, "symptoms": new_detail.symptoms, 
                    "level": new_detail.level, 
                    "frequency": new_detail.frequency, 
                    "date": new_detail.date
                    }
    return {"Symptoms Details": details}
         
@login_required         
@app.route("/remedy", methods=["PUT", "GET"])
def remedy():

    # Is Symptoms
    remedy_data = Remedy.query.filter_by(user_id= current_user.id).first()

    if not remedy_data and request.method=="PUT":
        new_detail = Remedy(request.form.get("name"), 
                                    request.form.get("amount"),
                                    request.form.get("frequency"),
                                    request.form.get("symptom"),
                                    current_user,
                                    request.form.get("is_level_freq_changed"),
                                    request.form.get("level"),
                                    request.form.get("symptom_frequency"),
                                    datetime.now().strftime("%m/%d/%Y")
                                    )
        db.session.add(new_detail)
        db.session.commit()
        details = {"id": new_detail.id, "name": new_detail.name, 
                    "amount": new_detail.amount, 
                    "frequency": new_detail.frequency, 
                    "symptom": new_detail.symptom, 
                    "is_level_freq_changed": new_detail.is_level_freq_changed, 
                    "level": new_detail.level, 
                    "symptom_frequency": new_detail.symptom_frequency, 
                    "date": new_detail.date
                    }
        return {"Success": details}
    
    details = {"id": new_detail.id, "name": new_detail.name, 
                    "amount": new_detail.amount, 
                    "frequency": new_detail.frequency, 
                    "symptom": new_detail.symptom, 
                    "is_level_freq_changed": new_detail.is_level_freq_changed, 
                    "level": new_detail.level, 
                    "symptom_frequency": new_detail.symptom_frequency, 
                    "date": new_detail.date
                    }
    return {"Remedy Details": details}
         

if __name__ == '__main__':
    app.run(debug=True)