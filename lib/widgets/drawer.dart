// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
// import 'package:tushar_h/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.deepPurple,
      child: ListView(
          //padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Username"),
                  accountEmail: Text("username@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    radius: 150,
                    // child: Image.asset(
                    //   "assets/images/userpic.png"
                    // ),
                    backgroundImage: NetworkImage(
                        "https://as2.ftcdn.net/v2/jpg/01/18/03/35/500_F_118033506_uMrhnrjBWBxVE9sYGTgBht8S5liVnIeY.jpg"),
                  )),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () {
                Navigator.pushNamed(context, MyRoute.profileRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.heart_fill,
                color: Colors.white,
              ),
              title: Text("Favourite",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () {
                Navigator.pushNamed(context, MyRoute.starredRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.doc_plaintext,
                color: Colors.white,
              ),
              title: Text("Appointment",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.doc_person,
                color: Colors.white,
              ),
              title: Text("Report",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bell,
                color: Colors.white,
              ),
              title: Text("Remainder",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: Text("Settings",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () {
                Navigator.pushNamed(context, MyRoute.settingRoute);
              },
            ),
          ]),
    ));
  }
}
