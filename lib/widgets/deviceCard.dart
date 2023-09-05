import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  final String value;
  final String metric;
  const DeviceCard({
    super.key, required this.value, required this.metric,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(value,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge),
              Text(metric,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.4)))
            ],
          ),
        ),
      ),
    );
  }
}