import 'package:sms/sms.dart';

abstract class SmsServices{
  SmsQuery smsQuery();
  Future<List<SmsMessage>> getMessages(SmsQuery query);
}

class SmsService extends SmsServices{
  @override
  Future<List<SmsMessage>> getMessages(SmsQuery query) async{
    List<SmsMessage> messages = await query.getAllSms;
    return messages;
  }

  @override
  SmsQuery smsQuery() {
    SmsQuery query = SmsQuery();
    return query;
  }

}
final SmsService smsService = SmsService();