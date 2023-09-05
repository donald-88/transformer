import 'package:flutter/material.dart';

class ControlCard extends StatelessWidget {
  final Color color;
  final Color contentColor;
  final String control;
  final IconData icon;
  final bool canTweak;
  final Function? onChanged;
  const ControlCard({
    super.key,
    required this.color,
    required this.control,
    required this.icon,
    required this.contentColor,
    required this.canTweak,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 32,
              color: contentColor,
            ),
            Text(control,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: contentColor, fontWeight: FontWeight.bold)),
            canTweak
                ? Switch(
                    inactiveTrackColor: color,
                    thumbColor: MaterialStateProperty.all<Color>(contentColor),
                    trackOutlineColor:
                        MaterialStateProperty.all<Color>(contentColor),
                    value: false,
                    onChanged: (value) {})
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
