import 'package:sms/sms.dart';

abstract class ISMSServices{
  SmsQuery smsQuery();
  Future<List<SmsMessage>> getMessages(SmsQuery query);
}