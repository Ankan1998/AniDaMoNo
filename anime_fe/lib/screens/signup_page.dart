import 'dart:convert';
import 'package:anime_fe/components/app_utils.dart';
import 'package:anime_fe/custom_widget/custom_form.dart';
import 'package:anime_fe/custom_widget/custom_text_button.dart';
import 'package:anime_fe/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';

  Widget _buildName() {
    return CustomForm(
      validator: (value){
        if (value.isEmpty || !AppUtils.isValidName(value)) {
          return "Only alphabets allowed!";
        }
        return null;
      },
      labelText: "Name",
      obscureText: false,
      hintText: "Enter your Name",
      onSave: (value){
        _name = value;
      },
    );
  }

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
      obscureText: true,
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
                                  "Come Abroad",
                                  style: TextStyles.largeTitle
                              ),
                            ),
                            SizedBox(height:30),
                            _buildName(),
                            SizedBox(height:30),
                            _buildEmail(),
                            SizedBox(height: 25,),
                            _buildPassword(),
                            SizedBox(height: 35,),
                            CustomTextButton(
                              height:48,
                              width: 72,
                              borderRadius: 20.0,
                              borderColor: Colors.grey[500],
                              onPressed: () async {
                                if (!_formkey.currentState.validate()) {
                                  return;
                                }
                                _formkey.currentState.save();
                              },
                              title: "Sign-Up",
                              textStyle: TextStyles.button1,
                            ),
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
