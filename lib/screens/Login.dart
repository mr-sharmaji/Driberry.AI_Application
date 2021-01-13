import 'package:drowsiness_detection/helper/SharedPreferencesHelper.dart';
import 'package:drowsiness_detection/main.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _textEditingControllerEmailField =
      TextEditingController();
  TextEditingController _textEditingControllerPasswordField =
      TextEditingController();
  String email = "rr@gmail.com";
  String password = "password";
  bool error = false;

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: _textEditingControllerEmailField,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    final passwordField = TextField(
      controller: _textEditingControllerPasswordField,
      obscureText: true,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    final loginButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: () {
        if (_textEditingControllerEmailField.text == email &&
            _textEditingControllerPasswordField.text == password) {
          setState(() {
            error = false;
          });
          SharedPreferencesHelper().setLoggedInStatus();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext ctx) => Layout(),
            ),
          );
        } else {
          setState(() {
            error = true;
          });
        }
      },
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF4278D4),
              Color(0xFF0A2656),
            ],
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Center(child: Text('Login', style: TextStyle(fontSize: 20))),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    child: Image.asset(
                      "asset/logo1.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  emailField,
                  SizedBox(
                    height: 24.0,
                  ),
                  passwordField,
                  SizedBox(
                    height: 36.0,
                  ),
                  loginButton,
                  SizedBox(
                    height: 16.0,
                  ),
                  error
                      ? Text(
                          "Email or password is incorrect",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      : Text("")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
