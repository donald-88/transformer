import 'package:flutter/material.dart';
import 'package:transformer/widgets/notification-card.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  //read data
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
            child: Center(
                child: Text(
              "Notifications",
            )),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'map');
                      },
                      child: const NotificationCard());
                }),
          )
        ],
      ),
    );
  }
}
