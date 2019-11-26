from flask import Flask,request,session,render_template,redirect
import os

app = Flask(__name__)

#We will set up the secret key for the session. For encrypt and decrypting of data we need this.
app.secret_key = os.urandom(10)

@app.route('/',methods=['GET','POST'])
def index():

    #Here, where the role of session comes in. We initialize the balance from the session variables.
    #If the session does not exist it says an error, and we create a session.
    #To clear the session, the simple command we have is session.clear()
    # A session is like a dictionary that stores the value corresponding to a key. 
    try:
        balance = session["balance"] #For getting the balance everytime a request to this page arrives.
        count = session["count"] #For getting the count everytime.
    except KeyError:
        balance = session["balance"] = 8000 #We initialize the session amount.
        count = session["count"] = 0 #We initailize the count here, so that we can keep track of transactions.
    

    if request.method == "GET":
        return render_template('index.html',message="",balance=balance,sess_count=count) 
        #We return the above Whenever we receive a get request for the page.
    
    if request.method == "POST":

        #As soon as we receive a post request, we will check for the following 3 things.
        # 1. Whether user has left that as blank.
        # 2. Whether user has entered a negative account.
        # 3. Whether user has exceeded the allowed number of transactions.

        if request.form["amount"] == "":
            msg = "Amount is required"
            print("Check if this ever gets executed because of client side javascript")
            return render_template('index.html',balance=balance,message=msg,sess_count=count)

        if int(request.form["amount"]) < 0:
            msg = "Amount entered is negative"
            print("I am executed when client side is commented")
            return render_template('index.html',message=msg,balance=balance,sess_count=count)
        
        if session['count'] == 5:
            msg = "5 transactions complete, no more allowed"
            return render_template('index.html',balance=balance,message=msg,sess_count=count)
        
        #Now, we will check if the button pressed is withdraw.
            # Inside this, we will check if the more amount is withrawn than balance or more than 5000.

        if request.form["action"] == "Withdraw":

            if int(request.form["amount"]) > 5000 or int(request.form["amount"]) > session["balance"]:
                msg =  "Requested amount greater than available" if (int(request.form["amount"]) > session["balance"]) else "Withdrawn amount cannot be greater than 5000" 
                return render_template('index.html',balance=balance,msg=msg,sess_count=count)

            else:

                balance = balance - int(request.form["amount"])
                session["balance"] = balance
                session["count"] += 1
                count = session["count"]
                msg = "Money withdrawn"
                return render_template('index.html',balance=balance,message=msg,sess_count=count)

        if request.form["action"] == "Deposit":

            if int(request.form["amount"]) > 10000:
                msg = "Amount greater than 10000 cannot be deposited"
                return render_template('index.html',message=msg,balance=balance,sess_count=count) 
            
            else:

                balance = balance + int(request.form["amount"])
                session["balance"] = balance
                session["count"] = session["count"]+1
                count = session["count"]
                msg = "Money deposited"
                return render_template('index.html',message=msg,balance=balance,sess_count=count)

if __name__ == "__main__":
    app.run(debug=True)

