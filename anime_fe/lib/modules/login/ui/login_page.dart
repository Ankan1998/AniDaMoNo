import 'dart:convert';
import 'package:anime_fe/components/app_utils.dart';
import 'package:anime_fe/custom_widget/custom_form.dart';
import 'package:anime_fe/custom_widget/custom_text_button.dart';
import 'package:anime_fe/modules/home/ui/HomePage.dart';
import 'package:anime_fe/modules/login/bloc/login_bloc.dart';
import 'package:anime_fe/modules/login/model/login_model.dart';
import 'package:anime_fe/modules/signup/ui/signup_page.dart';
import 'package:anime_fe/themes/app_text_style.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  LoginModel loginModel = LoginModel();

  Widget _buildEmail() {
    return CustomForm(
      validator: (value) {
        if (value.isEmpty || !AppUtils.isValidEmail(value)) {
          return "Please fill email correctly !";
        }
        return null;
      },
      labelText: "Email",
      obscureText: false,
      hintText: "Enter your email",
      onSave: (value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return CustomForm(
      validator: (value) {
        if (value.length < 3) {
          return "Password too short";
        }
        return null;
      },
      labelText: "Password",
      obscureText: true,
      hintText: "Enter your Password",
      onSave: (value) {
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
                    child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AvatarView(
                              radius: 60,
                              borderWidth: 2,
                              borderColor: Colors.grey[400],
                              avatarType: AvatarType.CIRCLE,
                              backgroundColor: Colors.grey[700],
                              imagePath: "images/kurama.png",
                              placeHolder: Container(
                                child: Icon(Icons.person, size: 60,),
                              ),
                              errorWidget: Container(
                                child: Icon(Icons.error, size: 60,),
                              ),
                            ),
                            Container(
                              child: Text(
                                  "Konnichiwa",
                                  style: TextStyles.largeTitle
                              ),
                            ),
                            BlocConsumer<LoginBloc, LoginState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                if (state is LoginSuccess) {
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  });
                                }
                                else if(state is LoginFailure){
                                  return _buildLoginError("Invalid Credentials !!!");
                                } else if(state is NetworkIssue){
                                  return _buildLoginError("No Internet Connection");
                                }
                                return Container();
                              }
                            ),
                            SizedBox(height: 30),
                            _buildEmail(),
                            SizedBox(height: 25,),
                            _buildPassword(),
                            SizedBox(height: 35,),
                            CustomTextButton(
                              height: 48,
                              width: 72,
                              bgColor: Colors.green[800],
                              borderRadius: 20.0,
                              borderColor: Colors.grey[500],
                              onPressed: () async {
                                if (!_formkey.currentState.validate()) {
                                  return;
                                }
                                _formkey.currentState.save();
                                loginModel.email = _email;
                                loginModel.password = _password;
                                context.read<LoginBloc>().add(VerifyLoginEvent(loginModel));
                              },
                              title: "Sign-in",
                              textStyle: TextStyles.button1,
                            ),
                            SizedBox(height: 25,),
                            GestureDetector(
                              onTap: () {
                                // coming back to this screen focus is already taking - fixed
                                FocusManager.instance.primaryFocus
                                    .unfocus();
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignupPage()));
                              },
                              child: Text(
                                "Don't have Account? Signup",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                    decoration: TextDecoration.underline
                                ),
                              ),
                            )
                          ],
                        )
                      )
                 )
                ),
            ),
          ),
        )
    );
  }
}
