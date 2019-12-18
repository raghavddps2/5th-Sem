from flask import Flask,render_template,redirect,request,session,url_for

app = Flask(__name__)
app.secret_key = "raghav@123M"

@app.route('/',methods=["POST","GET"])
def index():

    try:
        amt = session['amount']
    except:
        session['amount'] = 0

    if request.method == "GET":
        msg = "Welcome"
        return render_template('index.html',msg=msg)
    
    if request.method == "POST":

        if request.form['eggs'] == "" or request.form['bread'] == "" or request.form['milk'] == "":
            msg = "Please enter the quantity"
            return render_template('index.html',msg=msg)

        if int(request.form["eggs"]) < 0 or int(request.form["bread"]) < 0 or int(request.form['milk']) < 0:
            msg = "Quantity cannot be negative"
            return render_template('index.html',msg=msg)
        
        amt += int(request.form['eggs'])*10 + int(request.form['bread'])*20 + int(request.form['milk'])*30
        session['amount'] = amt
        return render_template('index.html',amount=amt)
if __name__ == "__main__":
    app.run(debug=True)