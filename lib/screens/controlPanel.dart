import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  var rowItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Control Panel',
                style: Theme.of(context).textTheme.titleLarge)),
        body: SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          height: 500,
          child: GridView.builder(
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2),
              itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Iconsax.battery_full,
                            size: 32,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text('Battery',
                              style: Theme.of(context).textTheme.titleMedium),
                          Switch(value: false, onChanged: (value) {})
                        ],
                      ),
                    ),
                  )),
        ));
  }
}
