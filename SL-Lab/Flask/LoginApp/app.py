from flask import Flask,render_template,redirect,url_for,request #We import whatever we need from flask.
app = Flask(__name__) #Using this, we initialize the flask app in a varibale call app. This will be our main one to form routes.


@app.route('/') #This is just the default / route.
def index():
    return render_template('login.html',message="Welcome to Flask Login")

@app.route('/login',methods=['GET','POST'])
def login():


    #If we get a post request implying that the form is submitted, all we have to do is extract the usn(NOte that we specified the name as usn in html file)
    #Then we extract the password, we match them, if both are admin, the user logs in, else an error message is shown.
    if request.method == "POST":
        usn = request.form['usn']
        password = request.form['password']

        if usn == 'admin' and password == "admin": #Matching both of them, against admin.
            return redirect(url_for('success'))
        else:
            return render_template('login.html',message="Login Error")
    
    else:
        # This is when the user is giving a get request for the login page, this page makes no sense for not logged in user,
        # so what we do is, we just return the login html page only.
        return render_template('login.html',message="Welcome to Flask Login")

#LOgically, we should set a condition for this route using wraps, as this should be accessible only when logged in, 
#But as it can be assumed it is hidden from user, so its fine as of now.
@app.route('/success')
def success():
    return "Logged in successfully" #Here, all we do is return that the login is successfull.

    

if __name__ == "__main__":
    app.run(debug=True)
