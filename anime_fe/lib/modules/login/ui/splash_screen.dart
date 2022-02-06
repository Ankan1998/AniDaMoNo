import 'package:anime_fe/modules/home/model/user_info.dart';
import 'package:anime_fe/modules/profile/ui/profile_page.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserInfo _userInfo = UserInfo();

  @override
  void initState() {
    super.initState();
    shared_pref();
  }

  void shared_pref() async {
    final prefs = await SharedPreferences.getInstance();
    final String btoken = prefs.getString('token');
    if (btoken == null) {
      Timer(
          Duration(seconds: 5),
          () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()),
              ));
    } else {
      _userInfo.setAuthToken(btoken);
      Timer(
          Duration(seconds: 5),
          () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyProfile())));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AvatarView(
                radius: 120,
                borderWidth: 1,
                borderColor: Colors.orange[800],
                avatarType: AvatarType.CIRCLE,
                backgroundColor: Colors.grey[700],
                imagePath: "images/anifox.png",
                placeHolder: Container(
                  child: Icon(
                    Icons.person,
                    size: 60,
                  ),
                ),
                errorWidget: Container(
                  child: Icon(
                    Icons.error,
                    size: 60,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100.0),
            Text('Anime API',
                style: TextStyle(
                    color: Color(0xff6962BA),
                    fontSize: 48,
                    fontWeight: FontWeight.w300,
                    fontFamily: GoogleFonts.roboto().fontFamily))
          ],
        ));
  }
}
