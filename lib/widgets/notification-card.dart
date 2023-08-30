import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.all(Radius.circular(14))),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Intruder alert"),
              Text("Blantyre, Umoyo House")
            ],
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(60)),
                border: Border.all(width: 2, color: Colors.white)),
            child: const Center(child: Text("0d",)),
          ),
        ],
      ),
    );
  }
}
