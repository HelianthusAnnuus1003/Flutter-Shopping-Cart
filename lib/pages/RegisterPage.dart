import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var emailFormController = TextEditingController();
  var passwordFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 40, bottom: 80, left: 30, right: 30),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: Text(
                            "Sign up your account",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellowAccent,
                            ),
                          ),
                        ),
                        Text(
                          "Sign in with your email and password of continue with social media",
                          style: TextStyle(
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            color: Colors.black26,
                          ),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      maxLength: 30,
                      autofocus: true,
                      controller: emailFormController,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Please enter your email!";
                        bool emailValid = RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(value);
                        if (!emailValid)
                          return "Your email is invalid. Please re-enter email!";
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                        hintText: "Enter your email",
                        labelText: "Email",
                        suffixIcon: Icon(Icons.email),
                        iconColor: Colors.yellowAccent,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Colors.yellow),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Colors.yellow),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordFormController,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Please enter your password!";
                        if (value.length > 8)
                          return "Your password cannot be more than 8 characters!";
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                        hintText: "Enter your password",
                        labelText: "Password",
                        iconColor: Colors.yellowAccent,
                        suffixIcon: Icon(Icons.lock),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Colors.yellow),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Colors.yellow),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot a password? ",
                        style: TextStyle(
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          color: Colors.black26,
                        ),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var email = emailFormController.text;
                          var password = passwordFormController.text;
                          Navigator.pushNamed(context, "/loginPage");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Sign up failed. Please check the information again!")));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        primary: Colors.yellow,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      child: Text("Sign up",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          alignment: Alignment.center,
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(100)),
                              color: Colors.grey.shade300),
                          child: TextButton(
                            child: Icon(Icons.account_circle),
                            style: TextButton.styleFrom(
                              primary: Colors.orange,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          alignment: Alignment.center,
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(100)),
                              color: Colors.grey.shade300),
                          child: TextButton(
                            child: Icon(Icons.facebook),
                            style: TextButton.styleFrom(
                              primary: Colors.orange,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(100)),
                              color: Colors.grey.shade300),
                          child: TextButton(
                            child: Icon(Icons.apple),
                            style: TextButton.styleFrom(
                              primary: Colors.orange,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Do you have an account?",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, "/loginPage");
                              },
                            text: "Log in",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.yellow,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

authentication(String userName, String passWord) {
  if (userName == 'admin' && passWord == 'lecongquocduy1003') {
    return true;
  } else {
    return false;
  }
}
