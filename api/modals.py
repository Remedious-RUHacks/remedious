from app_config import app, crete_datebase
from werkzeug.security import generate_password_hash, check_password_hash
from app_config import crete_datebase, app
from flask_login import UserMixin

# MySql Database 
db = crete_datebase(app)

class User(db.Model, UserMixin):
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key=True)
    firstname = db.Column(db.String(80), nullable=False)
    lastname = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(300), nullable=False)

    def __init__(self, firstname, lastname, password, email):
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = generate_password_hash(password, salt_length=10)

    
    def __repr__(self):
        return '<User %r>' % self.username

    def verify_password(self, pwd):
        return check_password_hash(self.password, pwd)

class PersonalDetail(db.Model):
    __tablename__ = "personal_detail"
    id = db.Column(db.Integer, primary_key=True)
    age = db.Column(db.String(8), nullable=False)
    gender = db.Column(db.String(80), nullable=False)
    ethnic_background = db.Column(db.String(100), nullable=False)
    health_condition = db.Column(db.String(300), nullable=False)
    medication = db.Column(db.String(300), nullable=False)
    
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    user = db.relationship('User', backref=db.backref('personal_details', lazy=True))

    def __init__(self, age, gender, ethnic_background, health_condition, medication, user):
        self.age = age
        self.gender = gender
        self.ethnic_background = ethnic_background
        self.health_condition = health_condition
        self.medication = medication
        self.user = user

    def __repr__(self):
        return '<PersonalDetail %r>' % self.id

class Covid(db.Model):
    __tablename__ = "covid"
    id = db.Column(db.Integer, primary_key=True)
    is_symptoms = db.Column(db.String(80), nullable=False)
    is_tested = db.Column(db.String(80), nullable=False)
    result = db.Column(db.String(80))
    is_treatment = db.Column(db.String(80), nullable=False)
    treatment = db.Column(db.String(280))
    is_recoverd = db.Column(db.String(80), nullable=False)
    is_long_term = db.Column(db.String(80), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    user = db.relationship('User', backref=db.backref('covids', lazy=True))
    
    def __init__(self, is_symptoms, is_tested, result, is_treatment, treatment, is_recoverd, is_long_term, user):
        self.is_symptoms = is_symptoms
        self.is_tested = is_tested
        self.result = result
        self.is_treatment = is_treatment
        self.treatment = treatment
        self.is_recoverd = is_recoverd
        self.is_long_term = is_long_term
        self.user = user

    def __repr__(self):
        return '<Covid %r>' % self.id

class Symptom(db.Model):
    __tablename__ = "symptom"
    id = db.Column(db.Integer, primary_key=True)
    symptoms = db.Column(db.String(180), nullable=False)
    level = db.Column(db.String(180), nullable=False)
    frequency = db.Column(db.String(180), nullable=False)
    date = db.Column(db.String(180), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    user = db.relationship('User', backref=db.backref('symptoms', lazy=True))

    def __init__(self, symptoms, level, frequency, user):
        self.symptoms = symptoms
        self.level = level
        self.frequency = frequency
        self.user = user

    def __repr__(self): 
        return '<Symptom %r>' % self.id

class Remedy(db.Model):
    __tablename__ = "remedy"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(180), nullable=False)
    amount = db.Column(db.String(180), nullable=False)
    frequency = db.Column(db.String(180), nullable=False)
    date = db.Column(db.String(180), nullable=False)
    symptom_id = db.Column(db.Integer, db.ForeignKey('symptom.id'), nullable=False)
    symptom = db.relationship('Symptom', backref=db.backref('remedys', lazy=True))
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    user = db.relationship('User', backref=db.backref('remedy', lazy=True))
    
    # Is Level of pain or frequecny changed by taking this medicine
    is_level_freq_changed = db.Column(db.String(10), nullable=False)
    level = db.Column(db.String(180), nullable=False)
    symptom_frequency = db.Column(db.String(180), nullable=False)

    def __init__(self, name, amount, frequency, symptom, user, is_level_freq_changed, level, symptom_frequency):
        self.name = name
        self.amount = amount
        self.frequency = frequency
        self.symptom = symptom
        self.user = user
        self.is_level_freq_changed = is_level_freq_changed
        self.level = level
        self.symptom_frequency = symptom_frequency

    def __repr__(self): 
        return '<Remedy %r>' % self.id


class Academic(db.Model, UserMixin):
    __tablename__ = "academic"
    id = db.Column(db.Integer, primary_key=True)
    firstname = db.Column(db.String(80), nullable=False)
    lastname = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(300), nullable=False)

    def __init__(self, firstname, lastname, password, email):
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = generate_password_hash(password, salt_length=10)
    
    def __repr__(self):
        return '<Academic %r>' % self.firstname

    def verify_password(self, pwd):
        return check_password_hash(self.password, pwd)


# Create database
db.create_all()

# new_user = User("dev", "raj", "123", "email")
# db.session.add(new_user)
# db.session.commit()

user = User.query.filter_by(id=1).first()
new_details = PersonalDetail(12, "male", "adsjfa", "jasf", "af", user)
db.session.add(new_details)
db.session.commit()