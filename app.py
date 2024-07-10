from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column
from datetime import datetime
import os
from werkzeug.utils import secure_filename
from flask_mail import Mail
import math
import json


# Openning config.json:
with open('templates/config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = params["local_server"]

class Base(DeclarativeBase):
    pass

db = SQLAlchemy(model_class=Base)

# create the app
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.secret_key = "super-secret-key"

# Mail Detail:
app.config.update(
    MAIL_SERVER = "smtp.gmail.com",
    MAIL_PORT = "465",
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params["gmail_user"],
    MAIL_PASSWORD = params["gmail_password"]
)
mail = Mail(app)

# configure the SQLite database, relative to the app instance folder
if local_server:
    app.config["SQLALCHEMY_DATABASE_URI"] = params["local_uri"]
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params["prod_uri"]
# initialize the app with the extension
db.init_app(app)



class Contacts(db.Model):
    sno: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(unique=False, nullable=True)
    email: Mapped[str] = mapped_column(unique=True, nullable=True)
    phone_num: Mapped[str] = mapped_column(unique=False, nullable=True)
    mes: Mapped[str] = mapped_column(unique=False, nullable=True)
    date: Mapped[datetime] = mapped_column(unique=False, nullable=False)

class Posts(db.Model):
    sno: Mapped[int] = mapped_column(primary_key=True)
    title: Mapped[str] = mapped_column(unique=False, nullable=True)
    subtitle: Mapped[str] = mapped_column(unique=False, nullable=True)
    slug: Mapped[str] = mapped_column(unique=True, nullable=True)
    content: Mapped[str] = mapped_column(unique=False, nullable=True)
    img_file: Mapped[str] = mapped_column(unique=False, nullable=True)
    date: Mapped[datetime] = mapped_column(unique=False, nullable=False)




@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']) : (page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
    # Pagination Logic:
    if (page == 1):
        prev = "#"
        upcomming = "/?page="+str(page+1)
    elif(page == last):
        prev = "/?page="+str(page-1)
        upcomming = "#"
    else:
        prev = "/?page="+str(page-1)
        upcomming = "/?page="+str(page+1)

    print(page)
    
    return render_template('index.html', params=params, posts=posts, prev=prev, upcomming=upcomming)



@app.route('/post/<string:post_slug>', methods=["GET"])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)




@app.route('/dashboard', methods = ['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template("dashboard.html", params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('username')
        userpass = request.form.get('password')
        if(username == params['admin_user'] and userpass == params['admin_password']):
            session['user'] = username
            posts = Posts.query.all()
            return render_template("dashboard.html", params=params, posts=posts)
        else:
            return render_template('login.html', params=params, wrongEntry=True)
    
    return render_template('login.html', params=params)



@app.route('/edit/<string:sno>', methods = ['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            new_title = request.form.get('title')
            new_subtitle = request.form.get('subtitle')
            new_slug = request.form.get('slug')
            new_content = request.form.get('content')
            new_img_file = request.form.get('img_file')
            new_date = datetime.now()
            
            if sno == '0':
                post = Posts(title=new_title, subtitle=new_subtitle, slug=new_slug, content=new_content, img_file=new_img_file, date=new_date)
                db.session.add(post)
                db.session.commit()
                return redirect('/edit/'+sno)
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = new_title
                post.subtitle = new_subtitle
                post.slug = new_slug
                post.content = new_content
                post.img_file = new_img_file
                post.date = new_date
                db.session.commit()
                print(new_img_file, sno, post.img_file)
                return redirect('/edit/'+sno)
        
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post, sno=sno)
    return redirect('/dashboard')



@app.route('/uploader', methods = ['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded Successfuly"
    return redirect('/dashboard')


@app.route('/about')
def about():
    return render_template('about.html', params=params)


@app.route('/contact', methods = ['GET', 'POST'])
def contact():

    if (request.method == 'POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        
        email_exists = db.session.query(Contacts.sno).filter_by(email=email).scalar() is not None
        if(email_exists):
            return render_template('contact.html', params=params, duplicate=True)
        else:
            entry = Contacts(name=name, email=email, phone_num=phone, mes=message, date=datetime.now())
            db.session.add(entry)
            db.session.commit()

            #send mail:
            # mail.send_message(
            #     'New Message form ' + name,
            #     sender = email,
            #     recipients = [params['gmail_user']],
            #     body = message + "\n" + phone
            # )

            
    return render_template('contact.html', params=params)

@app.route('/delete/<string:sno>', methods = ['GET', 'POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')
    

@app.route('/logout')
def logout():
    if 'user' in session and session['user'] == params['admin_user']:
        session.pop("user")
        return redirect('/dashboard') 


if __name__ == "__main__":
    app.run(debug=True)