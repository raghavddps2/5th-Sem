Basically, when it comes to storing data inside the broswer, we use these three methods, called as Local storage, Session storage and cookies.

All the above three are browser dependent, for example, if you access a website on mozilla firefox and save some details there in any of the above three storage, it won't be visible to you in Google chrome or safari. Only mozilla have that browser storage data available.


##### Property&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cookies&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Local Storage&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Session Storage



Capacity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4kb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10mb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5mb

Browsers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HTML4/5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HTML5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HTML5

Accessible&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Any window&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Any window&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Same tab

Expires&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manually set&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Never&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;On tab close

StorageLoc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Browser +server&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Browser &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Browser

sendWithReq&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No


###### Now, one important thing here, the session we use in python flask, stores the data in a session cokkie and not the session storage!!!

1. The above is very important to note, as the word     session implies that it might be using session  storage, but if we look in the browser it actaully   stores the data in a cookie.

2. The importance of the secret_key in case of a flask session cookie is that, flask cryptographically signs the cookie. It means the data cannot be modified easily without the secret key

3. Once our session cookie is set, at every request, the authenticity is verified by unsigning it using the same secret key.

4. The only advantage the cookies or session here in flask provides is that it cannot be modified by the user. Why it is calllled session sometimes, because this secret key is same as the session id for each unique session.