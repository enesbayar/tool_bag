import 'package:flutter/material.dart';
import 'package:tool_bag/models/to_do.dart';
import 'package:tool_bag/services/dbHelper.dart';
import 'package:tool_bag/widgets/classic_text.dart';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  var dbHelper = DbHelper();
  List<ToDo> toDoList;
  int toDoCount = 0;

  @override
  void initState() {
    super.initState();
    getToDoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClassicText(
          text: "To Do List",
          fontSize: 18,
        ),
      ),
      body: buildToDoPage(context),
    );
  }

  Widget buildToDoPage(BuildContext context) {
     return ListView.builder(
        itemCount: toDoCount,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              elevation: 2.0,
              child: Row(
                children: [
                  Checkbox(
                    value: toDoList[index].isDone,
                    onChanged: (value){
                      toDoList[index].isDone = value;
                    },
                  ),
                  ClassicText(text: toDoList[index].description,)
                  //TODO: TO DO Add
                ],
              ));
        });
  }

  void getToDoList() async {
    var toDoListFuture = dbHelper.getToDoList();
    toDoListFuture.then((data) {
      setState(() {
        this.toDoList = data;
        toDoCount = data.length;
      });
    });
  }
}
