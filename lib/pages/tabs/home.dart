import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final bool pirStatus;
  const Home({super.key, required this.pirStatus});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color noAlertColor = const Color(0xff097134);
  Color alertColor = Colors.red;

  

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
                  width: 2,
                  color: widget.pirStatus ? alertColor : noAlertColor)),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              AvatarGlow(
                  endRadius: width - 80,
                  glowColor: widget.pirStatus ? alertColor : noAlertColor,
                  child: Text(widget.pirStatus ? "1" : "0",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color:
                                  widget.pirStatus ? alertColor : noAlertColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 80))),
              Positioned(
                  bottom: 50,
                  child: Text("Alerts registered.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: widget.pirStatus ? alertColor : noAlertColor,
                          fontWeight: FontWeight.w700)))
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
