import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transformer/widgets/controlCard.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ControlCardModel> controlItems = [
      ControlCardModel(
          icon: Iconsax.battery_full,
          control: 'Battery',
          color: Theme.of(context).primaryColor,
          contentColor: Theme.of(context).colorScheme.surface),
      ControlCardModel(
          icon: Iconsax.alarm,
          control: 'Intrusion',
          color: Theme.of(context).colorScheme.background,
          contentColor: Theme.of(context).primaryColor),
      ControlCardModel(
          icon: Iconsax.chart,
          control: 'Oil Level',
          color: Theme.of(context).colorScheme.background,
          contentColor: Theme.of(context).primaryColor),
      ControlCardModel(
          icon: Iconsax.hierarchy,
          control: 'Circuit',
          color: Theme.of(context).colorScheme.background,
          contentColor: Theme.of(context).primaryColor),
    ];
    return Scaffold(
        appBar: AppBar(
            title: Text('Control Panel',
                style: Theme.of(context).textTheme.titleLarge)),
        body: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              height: 500,
              child: GridView.builder(
                  itemCount: controlItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .8,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => ControlCard(
                      color: controlItems[index].color,
                      control: controlItems[index].control,
                      icon: controlItems[index].icon,
                      contentColor: controlItems[index].contentColor)),
            ),
          ],
        ));
  }
}

class ControlCardModel {
  final IconData icon;
  final Color contentColor;
  final String control;
  final Color color;
  ControlCardModel(
      {required this.icon,
      required this.control,
      required this.color,
      required this.contentColor});
}
