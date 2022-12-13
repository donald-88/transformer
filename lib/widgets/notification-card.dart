import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle normal =
        GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.all(Radius.circular(14))),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Intruder alert", style: normal),
              Text("Blantyre, Umoyo House", style: normal)
            ],
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(60)),
                border: Border.all(width: 2, color: Colors.white)),
            child: Center(child: Text("0d", style: normal)),
          ),
        ],
      ),
    );
  }
}
