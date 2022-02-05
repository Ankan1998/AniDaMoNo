import 'package:anime_fe/custom_widget/custom_text_button.dart';
import 'package:anime_fe/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyles.pageTitle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(
                child: Stack(
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height * 0.125,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300'),
                  backgroundColor: Colors.transparent,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.2,
                  left: MediaQuery.of(context).size.height * 0.2,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(width: 3, color: Colors.grey[600])),
                      child: Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text(
                          "Name",
                        ),
                        subtitle: Text("Ankan Sharma"),
                        trailing: Icon(Icons.edit),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "E-mail",
                        ),
                        subtitle: Text("xyz@xyz.com"),
                        trailing: Icon(Icons.edit),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Created At",
                        ),
                        subtitle: Text("23 July, 2021"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Updated At",
                        ),
                        subtitle: Text("23 July, 2021"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CustomTextButton(
              height: 48,
              buttonWidth: MediaQuery.of(context).size.width * 0.9,
              bgColor: Color(0xFF146356),
              borderRadius: 20.0,
              borderColor: Color(0xFF146356),
              onPressed: () async {},
              title: "Logout",
              textStyle: TextStyles.button1,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextButton(
              height: 48,
              buttonWidth: MediaQuery.of(context).size.width * 0.9,
              bgColor: Color(0xFF146356),
              borderRadius: 20.0,
              borderColor: Color(0xFF146356),
              onPressed: () async {},
              title: "Delete My Account",
              textStyle: TextStyles.button1,
            )
          ],
        ),
      ),
    ));
  }
}
