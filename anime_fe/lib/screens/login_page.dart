import 'package:anime_fe/components/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  Widget _buildEmail() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty || !AppUtils.isValidEmail(value)) {
          return "Please fill email correctly !";
        }
        return null;
      },
      decoration: InputDecoration(labelText: 'Email:'),
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      validator: (value) {
        if (value!.length<3) {
          return "Length too short!";
        }
        return null;
      },
      decoration: InputDecoration(labelText: 'Password:'),
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF84e4b6),
          body: Container(
            margin: EdgeInsets.all(10.0),
            child:Form(
              key: _formkey,
              child:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildEmail(),
                  _buildPassword(),
                  ElevatedButton(
                      onPressed: (){
                        if (!_formkey.currentState!.validate()) {
                          return;
                        }
                        _formkey.currentState!.save();
                        print(_email);
                        print(_password);
                      },
                      child: Text(
                        "Login"
                      )
                  )
                ],
              )
            )
          ),
        )
    );
  }
}
