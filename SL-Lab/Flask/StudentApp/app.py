from flask import Flask,redirect,render_template,request
import time
import re
app = Flask(__name__)

@app.route('/',methods=['GET','POST'])
def index():
    if request.method == "GET":
        return render_template('index.html',msg="Welcome to registration portal")

    else:
        usn = request.form['usn']
        dob = request.form['dob']

        if usn == "" or dob == "":
            return render_template('index.html',msg="Please fill the details properly.")
        
        #Now, we will perform whether date is entered properly or not, though it makes no sense here,
        # as in html input field i have specified as date itself
        try:
            print(dob) 
            time.strptime(dob,"%Y-%m-%d")  #This wont give any error, if proper time is there, else it will throw an error
                                        
        except ValueError: #We don't have to remember this as ValueError, type this strptime() function in python3 console, and we will get the error it generates.
            return render_template('index.html',msg="Time is not in proper format")
        
        #Check is usn is proper using regular expression.
        # ^ is used to specify the start of the string.
        # $ is used to specify the end of the string.
        usn_pattern = "^[1][A-Z][A-Z][0-9][0-9][A-Z][A-Z][0-9][0-9][0-9]$" #Now, we will match our usn with this format.

        #re.match, takes 2 arguments, one is the expression and other is on what to match to.
        if not re.match(usn_pattern,usn):
            return render_template('index.html',msg="USN format is invalid")

        #If none of the above is a problem, we simply send the usn and dob in a list
        details = [usn,dob]
        return render_template('success.html',details=details)




if __name__ == "__main__":
    app.run(debug=True)
