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
        return '<Academic %r>' % self.name

    def verify_password(self, pwd):
        return check_password_hash(self.password, pwd)

# Create database
db.create_all()

# new_user = User("dev", "raj", "123", "email")
# db.session.add(new_user)
# db.session.commit()