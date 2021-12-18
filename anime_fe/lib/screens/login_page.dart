import 'dart:convert';
import 'package:anime_fe/components/app_utils.dart';
import 'package:anime_fe/custom_widget/custom_form.dart';
import 'package:anime_fe/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  Widget _buildEmail() {
    return CustomForm(
      validator: (value){
        if (value.isEmpty || !AppUtils.isValidEmail(value)) {
          return "Please fill email correctly !";
        }
        return null;
      },
      labelText: "Email",
      obscureText: false,
      hintText: "Enter your email",
      onSave: (value){
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return CustomForm(
      validator: (value){
        if (value.length<3) {
          return "Password too short";
        }
        return null;
      },
      labelText: "Password",
      obscureText: false,
      hintText: "Enter your Password",
      onSave: (value){
        _password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Container(
                  child:Form(
                    key: _formkey,
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                            "Login",
                            style: TextStyles.largeTitle
                          ),
                        ),
                        SizedBox(height:30),
                        _buildEmail(),
                        SizedBox(height: 25,),
                        _buildPassword(),
                        SizedBox(height: 25,),
                        ElevatedButton(
                            onPressed: () async {
                              if (!_formkey.currentState.validate()) {
                                return;
                              }
                              _formkey.currentState.save();
                            },
                            child: Text(
                              "Login"
                            )
                        )
                      ],
                    )
                  )
                ),
              ),
            ),
          ),
        )
    );
  }
}
