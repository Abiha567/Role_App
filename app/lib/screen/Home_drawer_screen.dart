import 'package:app/screen/Calling_feature.dart';
import 'package:app/screen/Order_tracking_screen.dart';
import 'package:app/screen/home_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> Home_screen())
                        );
                    },
                     icon: Icon(Icons.close),
                     ),
                    const Center(
                      child: Icon(
                        Icons.person,
                        size: 70,
                    )
                    )
                ],
              )
                 ),
             ListTile(
              leading: const Icon(Icons.map_outlined),
              title: const Text('Map'),
              onTap: () {
               Navigator.push(
             context, 
             MaterialPageRoute(builder: (context)=> const Order_tracking())
               );
              }),
              const Divider(),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Call'),
            onTap: () {
             Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=> const PhoneCall_screen())
               );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}