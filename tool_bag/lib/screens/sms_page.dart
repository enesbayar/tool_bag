import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

import '../models/widget_model/pages_widget_model.dart';
import '../services/sms_services.dart';
import '../widgets/classic_text.dart';

class SmsPage extends StatefulWidget {
  @override
  _SmsPageState createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  SmsQuery smsQuery;
  List<SmsMessage> messages;
  @override
  void initState() {
    super.initState();
    smsQuery = smsService.smsQuery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClassicText(
          text: PagesWidgetModel().sms,
          fontSize: 18,
        ),
      ),
      body: buildSmsPage(),
    );
  }

  Widget buildSmsPage() {
    return FutureBuilder(
        future: smsService.getMessages(smsQuery),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, index) {
                return buildSmsItem(snapshot.data[index]);
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget buildSmsItem(data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.contacts,
                    size: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ClassicText(
                      text: data.sender,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.message,
                    size: 28,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ClassicText(
                        text: data.body,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
