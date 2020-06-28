import 'package:flutter/material.dart';
import 'package:simple_app/constants.dart';
import 'package:simple_app/screens/list_screen.dart';
import 'package:simple_app/widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  GlobalKey<ScaffoldState> scaffoldState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your email')),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your password')),
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Builder(builder: (context) {
                return RoundedButton(
                  onPressed: () {
                    if (email == "email" && password == "password") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListScreen()));
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Wrong login credentials'),
                      ));
                    }
                  },
                  displayText: 'Login',
                  color: Colors.lightBlueAccent,
                );
              })),
        ],
      ),
    );
  }
}
