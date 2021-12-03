// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/Authentication/Methods.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/storage_service.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final Storage storage = Storage();
  late final Map<String, dynamic> userMap;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestoreDBUserProf = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.blue,
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          child: StreamBuilder<DocumentSnapshot>(
            stream: _firestoreDBUserProf
                .collection("users")
                .doc(_auth.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              future:
              storage.downloadURL('Profile_pic.jpg');
              // if (!snapshot.hasData) return CircularProgressIndicator();
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  accountName: Text(
                    snapshot.data!['name'],
                    style: TextStyle(fontSize: 5, color: Colors.white),
                  ),
                  accountEmail: Text(
                    snapshot.data!['email'],
                    style: TextStyle(fontSize: 5, color: Colors.black),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                      snapshot.data!,
                    ),
                    //'https://images.ctfassets.net/6rsj5ae0g75g/6nf3rNaaVaUqYcoAcciSeC/a43b6f3da7352837e0db54dc86339420/Last_few_hours_more_for_FlutterLive._Join_us_from_anywhere_around_the_world._Flutter_Excitement_flutterio.jpg?w=450&fl=progressive&q=100',
                  ),
                );
              }
              // if (snapshot.connectionState == ConnectionState.waiting ||
              //   !snapshot.hasData)
              return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
            },
          ),
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
            Navigator.pushNamed(context, MyRoute.reportRoute);
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

  // Widget error(snapshot) {
  //   if (snapshot.connectionState == ConnectionState.waiting ||
  //       !snapshot.hasData) {
  //     return Container(
  //       alignment: Alignment.center,
  //       width: 10,
  //       height: 10,
  //       child: CircularProgressIndicator(
  //         color: Colors.white,
  //       ),
  //     );
  //   }
  //   ;
  // }
}
