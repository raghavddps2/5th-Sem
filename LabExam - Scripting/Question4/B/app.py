from flask import Flask,render_template,redirect,request,session,url_for

app = Flask(__name__)
app.secret_key = "raghav@M"

@app.route('/',methods=["POST","GET"])
def store():
    if request.method == "GET":
        return render_template('store.html')
    
    if request.method == "POST":
        for item in ["eggs","bread","milk"]:
            
            #If item not present in session cookie
            if item not in session:
                session[item] = int(request.form[item])
            # If item present.
            else:
                session[item] = int(session[item]) + int(request.form[item])

        return redirect(url_for('cart'))

@app.route('/cart')
def cart():

    cart = [] #We initializze the empty cart.
    total = 0 #INitial cart price

    #The total price will automatically, be correct, no need to store it in session, as we are calculating it every time
    #according to the quantity present in the cart.
    for item in [("eggs",10),("milk",20),("bread",30)]:
        cart.append({"name":item[0],"quantity":session[item[0]],"price": int(session[item[0]])*item[1]})
        total += int(session[item[0]]) * item[1]
    return render_template('cart.html',cart=cart,total=total)

if __name__ == "__main__":
    app.run(debug=True)