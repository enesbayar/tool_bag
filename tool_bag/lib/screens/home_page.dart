import 'dart:ffi';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:tool_bag/screens/to_do_page.dart';
import 'package:tool_bag/widgets/classic_text.dart';
import 'package:tool_bag/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClassicText(text:"Tool Bag", fontSize: 18,),
      ),
      body: buildHomePage(context),
    );
  }

  Widget buildHomePage(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: deviceWidth,
          height: deviceHeight,
        ),
        Center(
            child: Container(
          height: deviceWidth - 30,
          width: deviceWidth - 30,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Center(
                  child: FloatingActionButton(
                    heroTag: UniqueKey(),
                onPressed: changeBrightness,
                child: Icon(Icons.ac_unit),
                tooltip: "Change Theme",
              )),
              Positioned(
                top: deviceWidth / 2 - 45,
                left: 15,
                child: FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: changeBrightness,
                  child: Icon(Icons.settings),
                  tooltip: "Settings",
                ),
              ),
              Positioned(
                top: deviceWidth / 2 - 45,
                right: 15,
                child: FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ToDoPage())),
                  child: Icon(Icons.check),
                  tooltip: "To do list",
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

}
