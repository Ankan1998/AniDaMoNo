import 'dart:convert';
import 'package:anime_fe/components/app_utils.dart';
import 'package:anime_fe/custom_widget/custom_form.dart';
import 'package:anime_fe/custom_widget/custom_text_button.dart';
import 'package:anime_fe/modules/home/ui/HomePage.dart';
import 'package:anime_fe/modules/signup/bloc/sign_up_bloc.dart';
import 'package:anime_fe/modules/signup/model/signup_model.dart';
import 'package:anime_fe/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  SignUpModel signUpModel = SignUpModel();

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

  Widget _buildLoginError(String msg) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          msg,
          style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 18
          ),
        ),
      ],
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
                                  "Join Us",
                                  style: TextStyles.largeTitle
                              ),
                            ),
                            BlocConsumer<SignUpBloc, SignUpState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                builder: (context, state) {
                                  if (state is SignUpSuccess) {
                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()));

                                    });
                                  } else if(state is SignUpFailure){
                                    return _buildLoginError("Recheck Credential");
                                  } else if(state is NetworkIssue){
                                    return _buildLoginError("No Internet Connection");
                                  }
                                  return Container();
                                }
                            ),
                            SizedBox(height:30),
                            _buildName(),
                            SizedBox(height:30),
                            _buildEmail(),
                            SizedBox(height: 25,),
                            _buildPassword(),
                            SizedBox(height: 35,),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextButton(
                                  height:48,
                                  width: 72,
                                  bgColor: Colors.green[800],
                                  borderRadius: 20.0,
                                  borderColor: Colors.grey[500],
                                  onPressed: () async {
                                    if (!_formkey.currentState.validate()) {
                                      return;
                                    }
                                    _formkey.currentState.save();
                                    signUpModel.name = _name;
                                    signUpModel.email = _email;
                                    signUpModel.password = _password;
                                    context.read<SignUpBloc>().add(StartSignUpEvent(signUpModel));

                                  },
                                  title: "Sign-Up",
                                  textStyle: TextStyles.button1,
                                ),
                                CustomTextButton(
                                    height:48,
                                    width: 48,
                                    bgColor: Colors.black45,
                                    borderRadius: 20.0,
                                    borderColor: Colors.grey[500],
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  title: "Go Back",
                                  textStyle: TextStyles.button1
                                )
                              ],
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
