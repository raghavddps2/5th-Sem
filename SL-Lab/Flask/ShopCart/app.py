from flask import Flask,redirect,render_template,session,url_for,request
import os
app = Flask(__name__)

app.secret_key = os.urandom(10)

@app.route('/',methods=["GET","POST"])
def store():

    if request.method == "GET":
        return render_template('store.html')

    if request.method == "POST":
        for item in ["shirt","jeans","shoes"]:
            # If gets executed if we are doing for the first time.
            if item not in session:
                session[item] = int(request.form[item])
            else:
                session[item] = session[item] + int(request.form[item])
        return redirect(url_for('cart')) #This will send to the cart.

@app.route('/cart',methods=["GET","POST"])
def cart():
    cart = []
    for item in ["shirt","jeans","shoes"]: #For each item in the list we will iterate.
        cart.append({"name":item.capitalize(),"quantity":session[item]}) #Appending for each item.
    return render_template('cart.html',cart=cart) 

@app.route('/bill',methods=["POST","GET"])
def bill():

    amount = 0
    index = 0
    prices = [200,200,20000]
    cart = [] #This is going to store all the items. Each item will have a dictionary.
    for item in ["shirt","jeans","shoes"]:
        row = {}
        row["name"] = item.capitalize() #This will store the item name
        row["quantity"] = session[item] #This will store the quantity.
        row["price"] = session[item] * prices[index] #This will store the price for all the quantities of that item.
        amount = amount + row["price"] #This the total amount.
        cart.append(row) #This will just append in the cart.
        index = index + 1 #This just increases the index value.
    return render_template('bill.html',cart=cart,amount=amount)


if __name__ == "__main__":
    app.run(debug=True)