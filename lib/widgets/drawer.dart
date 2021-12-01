// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/Authentication/Methods.dart';
import 'package:hospital_app/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.blue,
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              accountName: Text("${_auth.currentUser!.displayName}"),
              accountEmail: Text("${_auth.currentUser!.email}"),
              currentAccountPicture: CircleAvatar(
                // child: Image.asset(
                //   "assets/images/userpic.png"
                // ),
                backgroundImage: NetworkImage(
                  'https://images.ctfassets.net/6rsj5ae0g75g/6nf3rNaaVaUqYcoAcciSeC/a43b6f3da7352837e0db54dc86339420/Last_few_hours_more_for_FlutterLive._Join_us_from_anywhere_around_the_world._Flutter_Excitement_flutterio.jpg?w=450&fl=progressive&q=100',
                ),
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
        // ListTile(
        //   leading: Icon(
        //     CupertinoIcons.heart_fill,
        //     color: Colors.white,
        //   ),
        //   title: Text("Favourite",
        //       textScaleFactor: 1.2,
        //       style: TextStyle(
        //         color: Colors.white,
        //       )),
        //   onTap: () {
        //     Navigator.pushNamed(context, MyRoute.starredRoute);
        //   },
        // ),
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
          onTap: () {
            Navigator.pushNamed(context, MyRoute.appointmentListRoute);
          },
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
          onTap: () {
            Navigator.pushNamed(
                context,
                MyRoute.reportRoute
            );
          },
        ),
        // ListTile(
        //   leading: Icon(
        //     CupertinoIcons.bell,
        //     color: Colors.white,
        //   ),
        //   title: Text("Reminder",
        //       textScaleFactor: 1.2,
        //       style: TextStyle(
        //         color: Colors.white,
        //       )),
        //   onTap: () {},
        // ),
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
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.white,
          ),
          title: Text("Log Out",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.white,
              )),
          onTap: () {
            logOut(context);
          },
        ),
      ]),
    ));
  }
}
