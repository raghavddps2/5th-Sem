"""
    1b. Python and JavaScript - ATM Application: Design a HTML form that displays user’s current balance,
     an input field to enter amount and buttons to withdraw or deposit money.
     Validate the form such that negative amount cannot be entered and Users
     cannot withdraw more than 5000 at one time. The maximum number of transactions  is 5.
"""

from flask import Flask,render_template,session,request,redirect,url_for
import os

app = Flask(__name__)
app.secret_key = os.urandom(10)



#Now, this is very very very important, usually, what happens is when we close the browser, the data goes. 
#This is just because, the session was not permanent. To make the session, permanent, we have to specify 
#the session.permanent as True, otherwise, the session is lost as soon as the browser window is closed.

@app.before_request
def before_request():
    session.permanent = True

@app.route('/',methods=["POST","GET"])
def index():
    print("hi")
    try:
            balance = session["balance"]
            count = session["count"]
    except KeyError:
            balance = session["balance"] = 8000
            count = session["count"] = 0

    if request.method == "GET":
        msg = "Welcome to INDIA BANK ATM"
        bal = session["balance"]
        cnt = session["count"]
        return render_template('index.html',msg=msg,bal=bal,cnt=cnt)


    else:  

        bal = session["balance"]
        cnt = session["count"]
        
        if session["count"] >= 5:
            msg = "Transaction expired"
            return render_template('index.html',msg=msg,cnt=cnt,bal=bal)

        amount = request.form["amount"]
        if amount == "":
            msg = "The entered amount is not valid"
            return render_template('index.html',msg=msg,bal=bal,cnt=cnt)
            
        amount = int(request.form["amount"])
        if amount < 0:
            msg = "Amount cannot be negative"
            return render_template('index.html',msg=msg,bal=bal,cnt=cnt)
            
        if request.form["action"] == "Withdraw":
            bal = session["balance"]
            cnt = session["count"]
            if amount > balance:
                msg = "Withdrawn amount greater than available"
                return render_template('index.html',msg=msg,bal=bal,cnt=cnt)
            elif amount > 5000:
                msg = "Cannot Withdraw more than 5000"
                return render_template('index.html',msg=msg,bal=bal,cnt=cnt)
            else:
                balance =  balance - amount
                session["balance"] = balance
                count += 1
                session["count"] = count
                msg = "Amount withdrawn"
                bal = balance
                cnt = count
                return render_template('index.html',msg=msg,bal=balance,cnt=count)
        
        if request.form["action"] == "Deposit":

            balance = balance + amount
            session["balance"] = balance
            count += 1
            session["count"] = count
            msg = "Amount deposited"
            bal = balance
            cnt = count
            return render_template('index.html',msg=msg,bal=balance,cnt=cnt)
    
    return "some error!!"
if __name__ == "__main__":
    app.run(debug=True)