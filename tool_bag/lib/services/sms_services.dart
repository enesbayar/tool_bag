import 'package:sms/sms.dart';

import 'isms_services.dart';

class SMService extends ISMSServices {
  @override
  Future<List<SmsMessage>> getMessages(SmsQuery query) async {
    List<SmsMessage> messages = await query.getAllSms;
    return messages;
  }

  @override
  SmsQuery smsQuery() {
    SmsQuery query = SmsQuery();
    return query;
  }
}

final SMService smsService = SMService();
