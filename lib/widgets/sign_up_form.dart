import 'package:flutter/material.dart';
import 'package:insta_flut/constants/size.dart';
import 'package:insta_flut/main_page.dart';
import 'package:insta_flut/utils/simple_snackbar.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Image.asset('assets/insta_text_logo.png'),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                decoration: getTextFieldDecor('Email'),
                validator: (String value) {
                  if (value.isEmpty || !value.contains("@")) {
                    return 'Please enter your email address!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _pwController,
                decoration: getTextFieldDecor('Password'),
                obscureText: true,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter any password!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _cpwController,
                decoration: getTextFieldDecor('Confirm Password'),
                obscureText: true,
                validator: (String value) {
                  if (value.isEmpty || value != _pwController.text) {
                    return 'Password does not match!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    final route = MaterialPageRoute(builder: (context)=>MainPage());
                    Navigator.pushReplacement(context, route);
                  }
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                disabledColor: Colors.blue[100],
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.grey[300],
                      height: 1,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 50,
                    color: Colors.grey[50],
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton.icon(
                  textColor: Colors.blue,
                  onPressed: () {
                    simpleSnackbar(context, 'facebook pressed');
                  },
                  icon: ImageIcon(AssetImage('assets/icon/facebook.png')),
                  label: Text('Login with Facebook')),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration getTextFieldDecor(String hint) {
    return InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300],
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Colors.grey[100],
        filled: true);
  }
}
