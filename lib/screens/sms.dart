import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class SMSReceiver extends StatefulWidget {
  @override
  State<SMSReceiver> createState() => _SMSReceiverState();
}

class _SMSReceiverState extends State<SMSReceiver> {
  String myMessage = "";
  int count = 0;

  @override
  void initState() {
    super.initState();

    SmsReceiver receiver = SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) => setState(() {
          myMessage = msg.body;
          count++;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SMS Listener App'),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Text(myMessage);
            }));
  }
}
