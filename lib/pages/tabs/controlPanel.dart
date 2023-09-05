import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transformer/widgets/controlCard.dart';

class ControlPanel extends StatefulWidget {
  final Function? onBatteryStatusChange;
  const ControlPanel({super.key, this.onBatteryStatusChange});

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ControlCardModel> controlItems = [
      ControlCardModel(
          icon: Iconsax.battery_full,
          canTweak: true,
          control: 'Battery',
          color: Theme.of(context).primaryColor,
          contentColor: const Color(0xFFE5E8E1),
          onChanged: widget.onBatteryStatusChange),
      ControlCardModel(
          icon: Iconsax.alarm,
          canTweak: false,
          control: 'Intrusion',
          color: const Color(0xFFE5E8E1),
          contentColor: Theme.of(context).primaryColor,
          onChanged: (){}),
      ControlCardModel(
          icon: Iconsax.chart,
          control: 'Oil Level',
          canTweak: false,
          color: const Color(0xFFE5E8E1),
          contentColor: Theme.of(context).primaryColor,
          onChanged: (){}),
      ControlCardModel(
          icon: Iconsax.hierarchy,
          control: 'Circuit',
          canTweak: false,
          color: const Color(0xFFE5E8E1),
          contentColor: Theme.of(context).primaryColor,
          onChanged: (){}),
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
                      childAspectRatio: .9,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => ControlCard(
                    onChanged: controlItems[index].onChanged,
                      color: controlItems[index].color,
                      canTweak: controlItems[index].canTweak,
                      control: controlItems[index].control,
                      icon: controlItems[index].icon,
                      contentColor: controlItems[index].contentColor)),
            ),
          ],
        ));
  }
}

class ControlCardModel {
  final bool canTweak;
  final IconData icon;
  final Color contentColor;
  final String control;
  final Color color;
  final Function? onChanged;
  ControlCardModel(
      {required this.icon,
      required this.canTweak,
      required this.control,
      required this.color,
      required this.contentColor,
      required this.onChanged});
}
