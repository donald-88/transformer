import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color noAlertColor = Colors.green;
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
                  color:alertColor)),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Text('0', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 80, color: Colors.green)),
              Positioned(
                  bottom: 50,
                  child: Text("Alerts registered.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700, color: Colors.green)))
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
