from flask import Flask, render_template, redirect, url_for, flash,request
from flask_sqlalchemy import SQLAlchemy 
from flask import *
from flask_login import LoginManager,UserMixin, login_manager,login_user,login_required,logout_user


app = Flask(__name__)

db = SQLAlchemy(app)

userpass = 'mysql://root:@'
basedir = '127.0.0.1'
dbname = '/login'

app.config['SQLALCHEMY_DATABASE_URI']=userpass+basedir+dbname
app.config['SECRET_KEY']='marouane'

#login
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'signin'

#admin s database
class User(db.Model,UserMixin):
    id = db.Column(db.Integer,primary_key=True)
    email = db.Column(db.String(255))
    username = db.Column(db.String(255))
    password = db.Column(db.String(255))

    def __init__(self, username, email,password):
        self.username = username
        self.email = email
        self.password = password
       
#connecting database
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root@localhost/sync'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

#admin s login manager
@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))
   

#default page and login page
@app.route('/')
def signin():
    return render_template('logintest.html')
# student s login processor
@app.route('/student',methods=['POST'])
def processor():
    username = request.form['username']
    password = request.form['password']
    user = Data.query.filter_by(username=username).first()
    if user:
        if user.password == password:
            login_user(user)
            return redirect (url_for('Dash'))
    return("invalid username")    
#admin s login processor
@app.route('/admin',methods=['POST'])
def admin():
     username = request.form['username']
     password = request.form['password']
     user = User.query.filter_by(username=username).first()
     if user:
         if user.password == password:
             login_user(user)
             return redirect (url_for('Index'))
             
     return('invalid username or password')
      
#admin s dashbord    
@app.route('/signup',methods=['GET','POST'])
def signup():
    all_data = User.query.all()
    return render_template("signup.html", sync = all_data)

#students database
class Data(db.Model,UserMixin):
    id = db.Column(db.Integer, primary_key = True)
    username = db.Column(db.String(20))
    email = db.Column(db.String(30))
    password = db.Column(db.String(20))
    branch = db.Column(db.String(20))
    status = db.Column(db.String(20))
    description = db.Column(db.String(120))

    def __init__(self, username, email,password,branch,status,description):
        self.username = username
        self.email = email
        self.password = password
        self.branch = branch
        self.status = status
        self.description = description

#admins dashbord
@app.route('/dashboard')
def Index():
    all_data = Data.query.all()
    return render_template("index.html", sync = all_data)

#insert admin
@app.route('/insertadmin', methods = ['POST'])
def insertad():

    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']

        my_data = User(username, email,password)
        db.session.add(my_data)
        db.session.commit()
        flash("Admin Inserted Successfully")
        return redirect(url_for('signup'))
#update admin informations
@app.route('/updateadmin', methods = ['GET', 'POST'])
def updatead():
    if request.method == 'POST':
        my_data = User.query.get(request.form.get('id'))

        my_data.username = request.form['username']
        my_data.email = request.form['email']
        my_data.password = request.form['password']
       
        db.session.commit()
        flash("Admin Updated Successfully")
        return redirect(url_for('signup'))

#deleting admin
@app.route('/deleteadmin/<id>/', methods = ['GET', 'POST'])
def deletead(id):
    my_data = User.query.get(id)
    db.session.delete(my_data)
    db.session.commit()
    flash("Admin Deleted Successfully")
    return redirect(url_for('signup'))
#students dashbord
@app.route('/dash')
def Dash():
    all_data = Data.query.all()
    return render_template("user.html", sync = all_data)
#insert student
@app.route('/insert', methods = ['POST'])
def insert():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        branch = request.form['branch']
        status = request.form['status']
        description = request.form['description']

        my_data = Data(username, email,password,branch,status,description)
        db.session.add(my_data)
        db.session.commit()
        flash("Student Inserted Successfully")
        return redirect(url_for('Index'))


#apdate student s informations
@app.route('/update', methods = ['GET', 'POST'])
def update():

    if request.method == 'POST':
        my_data = Data.query.get(request.form.get('id'))

        my_data.username = request.form['username']
        my_data.email = request.form['email']
        my_data.password = request.form['password']
        my_data.branch = request.form['branch']
        my_data.status = request.form['status']
        my_data.description = request.form['description']

        db.session.commit()
        flash("Student Updated Successfully")
        return redirect(url_for('Index'))

#deleting student
@app.route('/delete/<id>/', methods = ['GET', 'POST'])
def delete(id):
    my_data = Data.query.get(id)
    db.session.delete(my_data)
    db.session.commit()
    flash("Student Deleted Successfully")
    return redirect(url_for('Index'))

#logout
@app.route('/logout')
def logout():
    logout_user()
    return render_template('logintest.html')


#run
if __name__ == '__main__':
    app.run(host='localhost',debug=True)