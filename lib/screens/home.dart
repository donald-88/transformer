import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color noAlertColor = const Color(0xff097134);
  Color alertColor = Colors.red;

  late bool ledstatus; //boolean value to track LED status, if its ON or OFF
  late IOWebSocketChannel channel;
  late bool connected;

  @override
  void initState() {
    ledstatus = false; //initially leadstatus is off so its FALSE
    connected = false;

    // Future.delayed(Duration.zero, () async {
    //   channelconnect(); //connect to WebSocket wth NodeMCU
    // });
    super.initState();
  }

  channelconnect() {
    //function to connect
    try {
      channel =
          IOWebSocketChannel.connect("ws://192.168.0.1:81"); //channel IP : Port
      channel.stream.listen(
        (message) {
          print(message);
          setState(() {
            if (message == "connected") {
              connected = true; //message is "connected" from NodeMCU
            } else if (message == "poweron:success") {
              ledstatus = true;
            } else if (message == "poweroff:success") {
              ledstatus = false;
            }
          });
        },
        onDone: () {
          //if WebSocket is disconnected
          print("Web socket is closed");
          setState(() {
            connected = false;
          });
        },
        onError: (error) {
          print(error.toString());
        },
      );
    } catch (_) {
      print("error on connecting to websocket.");
    }
  }

  Future<void> sendcmd(String cmd) async {
    if (connected == true) {
      if (ledstatus == false && cmd != "poweron" && cmd != "poweroff") {
        print("Send the valid command");
      } else {
        channel.sink.add(cmd); //sending Command to NodeMCU
      }
    } else {
      channelconnect();
      print("Websocket is not connected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'notification');
        },
        child: Container(
          height: width - 80,
          width: width - 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(width)),
              border: Border.all(
                  width: 2, color: ledstatus ? alertColor : noAlertColor)),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              AvatarGlow(
                  endRadius: width - 80,
                  glowColor: const Color(0xff097134),
                  child: Text(ledstatus ? "1" : "0",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 80))),
              Positioned(
                  bottom: 50,
                  child: Text("Alerts registered.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700)))
            ],
          ),
        ),
      ),
    );
  }
}

class AlertNotification {
  final String message;
  final String location;
  final DateTime date;
  final String sender;

  AlertNotification(
      {required this.message,
      required this.location,
      required this.date,
      required this.sender});
}
