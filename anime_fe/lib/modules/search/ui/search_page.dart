import 'package:anime_fe/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySearch extends StatefulWidget {
  const MySearch({Key key}) : super(key: key);

  @override
  _MySearchState createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  final TextEditingController textEditingController = TextEditingController();

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1), blurRadius: 12, color: Colors.green[700])
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      style: TextStyles.largeTitle.copyWith(fontSize: 18),
                      controller: textEditingController,
                      decoration: InputDecoration.collapsed(
                          hintText: "Search Here...",
                          hintStyle:
                              TextStyles.largeTitle.copyWith(fontSize: 18),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(width: 12),
                  SizedBox(width: 0, height: 60)
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Color(0xff146356), size: 35.0)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Search", style: TextStyles.pageTitle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.red,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 50,
                  height: 1,
                  color: Colors.purple,
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          searchBar()
        ],
      ),
    ));
  }
}
