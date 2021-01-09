import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tool_bag/models/hes_code.dart';
import 'package:tool_bag/models/widget_model/pages_widget_model.dart';
import 'package:tool_bag/services/dbHelper_hes_code.dart';
import 'package:tool_bag/widgets/classic_text.dart';
import 'package:tool_bag/widgets/custom_button.dart';

class HesCodePage extends StatefulWidget {
  @override
  _HesCodePageState createState() => _HesCodePageState();
}

class _HesCodePageState extends State<HesCodePage> {
  var dbHelper = DbHelperForHesCode();
  List<HesCode> hesCodeList;
  int hesCodeCount = 0;

  TextEditingController hesCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    getHesCodeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ClassicText(
        text: PagesWidgetModel.hesCode,
        fontSize: 18,
      )),
      body: SingleChildScrollView(child: buildHesCodePage()),
    );
  }

  Widget buildHesCodePage() {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: hesCodeController,
                    decoration: InputDecoration(labelText: PagesWidgetModel.hesCode),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: PagesWidgetModel.name),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    text: PagesWidgetModel.validityDate,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 25),
        CustomButton(
          text: PagesWidgetModel.save.toUpperCase(),
          fontWeight: FontWeight.bold,
          fontSize: 24,
          width: 300,
          height: 50,
          onPressed: () {
            if (hesCodeController.text.isNotEmpty &&
                nameController.text.isNotEmpty) {
              addHesCode();
            }
          },
        ),
        SizedBox(height: 60),
        ClassicText(
          text: PagesWidgetModel.hesCodeList,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 20),
        Container(
          width: 350,
          height: 250,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: hesCodeCount == 0
                  ? Center(
                    child: ClassicText(
                        text: PagesWidgetModel.empty,
                        fontSize: 18,
                      ),
                  )
                  : ListView.builder(
                      itemCount: hesCodeCount,
                      itemBuilder: (BuildContext context, index) {
                        return buildHesCodeItem(hesCodeList[index]);
                      },
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHesCodeItem(HesCode hesCode) {
    return Stack(
      children: [
        Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed:()=> deleteHesCode(hesCode),
            )),
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.healing),
                Text(hesCode.hesCode),
              ],
            ),
            Row(
              children: [
                Icon(Icons.person),
                Text(hesCode.name),
              ],
            ),
            Row(
              children: [
                Icon(Icons.date_range),
                Text(hesCode.validityDate),
              ],
            ),
            Divider(
              thickness: 1.5,
            )
          ],
        ),
      ],
    );
  }

  void getHesCodeList() {
    var hesCodeListFuture = dbHelper.getToDoList();
    hesCodeListFuture.then((data) {
      setState(() {
        this.hesCodeList = data;
        hesCodeCount = data.length;
      });
    });
  }

  void addHesCode() async {
    HesCode _hesCode = HesCode(
        hesCode: hesCodeController.text,
        name: nameController.text,
        validityDate: DateFormat.yMMMd().format(selectedDate));
    var result = await dbHelper.insert(_hesCode);
    if (result != null) {
      getHesCodeList();
    } else {
      throw Exception("db exception");
    }
  }

  void deleteHesCode(HesCode hesCode) async {
    var result = dbHelper.delete(hesCode.id);
    if (result != null) {
      getHesCodeList();
    } else {
      throw Exception("db exception");
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2028),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
