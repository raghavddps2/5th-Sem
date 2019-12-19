from flask import Flask,session,request,redirect,url_for,render_template
import time
import re
app = Flask(__name__)

@app.route('/',methods=["GET","POST"])
def index():

    #Simply sends this if a get request.
    if request.method == "GET":
        return render_template('index.html',msg="Welcome to the student marks portal")
    
    usn = request.form['usn'].upper()
    dob = request.form['dob']
    
    #The below is for checking if the date is in proer format. 
    # time.strptime() is the function we will use.
    #According to dcos, it takes the string we got and the matcher as "%Y-%m-%d"
    try:
        time.strptime(dob,"%Y-%m-%d") # We use this one, when we specify type as date in html
        # time.strftime(dob,"%d/%m/%Y")  #This when not specified as date in html
    except ValueError:
        msg = "Enter the date in proper format"
        return render_template('index.html',msg=msg)


    # This is for checking if the usn is in proper format
    pattern = "^[0-9][A-Z][A-Z][0-9][0-9][A-Z][A-Z][0-9][0-9][0-9]$"
    if not re.match(pattern,usn):
        msg = "The entered usn does not match the pattern"
        return render_template('index.html',msg=msg)
    

    #This once all checks are done(one more check of negative left) and we wanna calculate the average
    marks1 = int(request.form["marks1"])
    marks2 = int(request.form["marks2"])
    marks3 = int(request.form["marks3"])
    
    #This does the negative check.
    if marks1 < 0 or marks2 < 0 or marks3 < 0:
        return render_template('index.html',msg="Marks cannot be negative")
        
    #The steps below will calculate the average and will show to the user, taking on a separate page.(result.html), not necessary though.
    average = (marks1+marks2+marks3)/3.0
    msg = "The average of the three subjects is " + str(average)
    return render_template('result.html',msg=msg,usn=usn,dob=dob)


if __name__ == "__main__":
    app.run(debug=True)