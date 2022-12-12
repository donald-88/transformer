import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const locationAnim = 'assets/location.riv';
    TextStyle normal =
        GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);
    TextStyle heading =
        GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold);
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Center(
              child: Text(
            "Notifications",
            style: heading,
          )),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.all(Radius.circular(14))),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Intrusion Alert", style: normal,),
                  Text("Area 47, Gateway Mall", style: normal,)
                ],
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    border: Border.all(width: 2, color: Colors.white)),
                child: Center(child: Text("0m", style: normal)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
