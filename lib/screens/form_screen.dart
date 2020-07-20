import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Form(
          autovalidate: true,
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Username is required!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if (value != "password") {
                    return "Password is incorrect!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              RaisedButton(
                onPressed: () {
                  if (_key.currentState.validate() == false) {
                    //Form is invalid
                    return;
                  }
                  //Form is valid
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
