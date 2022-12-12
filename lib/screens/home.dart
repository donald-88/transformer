import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms/sms.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextStyle numbers =
      GoogleFonts.poppins(fontSize: 64, fontWeight: FontWeight.w400);
  TextStyle alerts =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);


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
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: width - 80,
        width: width - 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(width)),
            border: Border.all(width: 2, color: Colors.white)),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Text(count.toString(), style: numbers),
            Positioned(
                bottom: 50, child: Text("Alerts registered.", style: alerts))
          ],
        ),
      ),
    );
  }
}
