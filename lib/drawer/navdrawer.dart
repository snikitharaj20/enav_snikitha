import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'navigatepage.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final user=FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:240,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(child: Text(user.displayName!)),
            ),
            ListTile(
              title: Text('My Account'),
            ),
            ListTile(
              title: Text('Gallery'),
            ),
            ListTile(
              title: Text('Navigate'),
              onTap: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=> NavigatePage(),
                  ),
                ),
              },
            ),
            ListTile(
              title: Text('LogOut'),
              onTap: ()=> FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
