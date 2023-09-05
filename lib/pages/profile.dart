import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transformer/services/authService.dart';
import 'package:transformer/widgets/deviceCard.dart';


class Profile extends StatelessWidget {
  Profile({super.key});
   final AuthService _auth = AuthService();

   void signOut() async{
     await _auth.signOut();
   }

  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text('Profile', style: Theme.of(context).textTheme.titleLarge)),
      body: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            const CircleAvatar(radius: 64),
            const SizedBox(height: 16),
            Text('David Blane', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Text('Lilongwe South West',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.4))),
            const SizedBox(height: 20),
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              DeviceCard(
                value: '204',
                metric: "Active",
              ),
              DeviceCard(
                value: '1',
                metric: "Inactive",
              ),
              DeviceCard(
                value: '5',
                metric: 'IDK',
              )
            ]),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                        leading: Icon(Iconsax.clipboard_export,color: Theme.of(context).colorScheme.primary),
                        title: Text('Report a Problem',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary))),
                    ListTile(
                        leading:  Icon(Iconsax.call, color: Theme.of(context).colorScheme.primary),
                        title: Text('Help',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary))),
                    ListTile(
                      onTap: signOut,
                        leading: Icon(Iconsax.logout, color: Theme.of(context).colorScheme.primary),
                        title: Text('Logout',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
