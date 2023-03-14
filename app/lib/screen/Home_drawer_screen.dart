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
            //     image: DecorationImage(
            //       alignment: Alignment.topCenter,
            //       image: AssetImage( "assets/badge.webp", )
            //  ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 const Center(child: Icon(Icons.person,size: 80,)),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> Home_screen())
                        );
                    },
                     icon: const Icon(Icons.cancel)
                     ),
                ],
              )
                 ),
          ListTile(
              leading: Icon(Icons.map_outlined),
              title: Text('Map'),
              onTap: () {
                Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> Order_tracking())
                        );
              }
              ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Call'),
            onTap: () {
              Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> PhoneCall_screen())
                        );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
