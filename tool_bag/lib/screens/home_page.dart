import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:tool_bag/models/widget_model/pages_widget_model.dart';
import 'package:tool_bag/screens/gallery_page.dart';
import 'package:tool_bag/screens/hes_code_page.dart';
import 'package:tool_bag/screens/search_page.dart';
import 'package:tool_bag/screens/sms_page.dart';
import 'package:tool_bag/screens/to_do_page.dart';
import 'package:tool_bag/widgets/classic_text.dart';
import 'package:tool_bag/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  bool defaultUI = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ClassicText(
            text: PagesWidgetModel.homePageAppBar,
            fontSize: 18,
          ),
        ),
        body: AnimatedCrossFade(
          duration: Duration(milliseconds: 500),
          firstChild: buildHomePage(context),
          secondChild: buildCustomHomePage(context),
          crossFadeState: defaultUI == true
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ));
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
        Positioned(
          top: 80,
          right: deviceWidth / 2 - 30,
          child: FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: changeBrightness,
            child: Icon(Icons.brightness_4),
            tooltip: PagesWidgetModel.changeTheme,
          ),
        ),
        Center(
            child: Container(
          height: deviceWidth - 30,
          width: deviceWidth - 30,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Center(
                child: FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: search,
                  child: Icon(Icons.search),
                  tooltip: PagesWidgetModel.searchOnGoogle,
                ),
              ),
              Positioned(
                top: deviceWidth / 2 - 45,
                left: 15,
                child: FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HesCodePage())),
                  child: Icon(Icons.healing),
                  tooltip: PagesWidgetModel.hesCode,
                ),
              ),
              Positioned(
                top: deviceWidth / 2 - 45,
                right: 15,
                child: FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ToDoPage())),
                  child: Icon(Icons.check),
                  tooltip: PagesWidgetModel.toDoList,
                ),
              ),
              Positioned(
                right: deviceWidth / 2 - 45,
                top: 15,
                child: FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GalleryPage())),
                  child: Icon(Icons.photo_album),
                  tooltip: PagesWidgetModel.gallery,
                ),
              ),
              Positioned(
                right: deviceWidth / 2 - 45,
                bottom: 15,
                child: FloatingActionButton(
                  heroTag: UniqueKey(),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SmsPage())),
                  child: Icon(Icons.sms),
                  tooltip: PagesWidgetModel.sms,
                ),
              ),
            ],
          ),
        )),
        Positioned(
          right: deviceWidth / 2 - 30,
          bottom: 80,
          child: FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () {
              setState(() {
                defaultUI = false;
              });
            },
            child: Icon(Icons.restore_page),
            tooltip: PagesWidgetModel.changeUI,
          ),
        ),
      ],
    );
  }

  Widget buildCustomHomePage(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: deviceWidth,
          height: deviceHeight,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 160,
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  onPressed: changeBrightness,
                  text: PagesWidgetModel.changeTheme,
                ),
                CustomButton(
                  onPressed: search,
                  text: PagesWidgetModel.searchOnGoogle,
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ToDoPage())),
                  text: PagesWidgetModel.toDoList,
                ),
                CustomButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GalleryPage())),
                  text: PagesWidgetModel.gallery,
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SmsPage())),
                  text: PagesWidgetModel.sms,
                ),
                CustomButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HesCodePage())),
                  text: PagesWidgetModel.hesCode,
                ),
              ],
            ),
            SizedBox(height: 25),
            CustomButton(
                onPressed: () {
                  setState(() {
                    defaultUI = true;
                  });
                },
                text: PagesWidgetModel.changeUI),
          ],
        ),
      ],
    );
  }

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  Future<void> search() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: TextField(
            controller: textEditingController,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              hintText: PagesWidgetModel.alertSearch,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: ClassicText(text: PagesWidgetModel.close, fontSize: 14.0),
              onPressed: () {
                textEditingController.clear();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: ClassicText(
                text: PagesWidgetModel.searchOnGoogle,
                fontSize: 14.0,
              ),
              onPressed: () {
                String url = textEditingController.text;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage(url)));
                textEditingController.clear();
              },
            ),
          ],
        );
      },
    );
  }
}
