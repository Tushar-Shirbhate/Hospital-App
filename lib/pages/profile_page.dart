// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/pages/edit_profilePage.dart';
import 'package:hospital_app/utils/user.dart';
import 'package:hospital_app/widgets/profile_widget.dart';
import 'package:hospital_app/widgets/user_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final Map<String, dynamic> userMap;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestoreDBUserProf = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // final user = UserPreferences.myUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: null, icon: Icon(CupertinoIcons.profile_circled)),
        title: Text('Profile'),
      ),
      body: Builder(builder: (context) {
        return StreamBuilder<DocumentSnapshot>(
            stream: _firestoreDBUserProf
                .collection("users")
                .doc(_auth.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  // ProfileWidget(
                  //   imagepath: user.imagepath,
                  //   onClicked: () async {
                  //     Navigator.of(context).push(
                  //       MaterialPageRoute(
                  //           builder: (context) => EditProfilePage()),
                  //     );
                  //   },
                  // ),
                  const SizedBox(height: 24),
                  buildName(snapshot),
                  const SizedBox(height: 48),
                  buildPhone(snapshot),
                  const SizedBox(height: 48),
                  buildAddress(snapshot),
                ],
              );
            });
      }),
    );
  }

  buildName(snapshot) => Column(
        children: [
          Text(
            snapshot.data!['name'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            snapshot.data!['email'],
            style: TextStyle(color: Colors.blue),
          )
        ],
      );

  buildAddress(snapshot) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              snapshot.data!['address'],
              style: TextStyle(fontSize: 16, height: 1.4),
            )
          ],
        ),
      );

  buildPhone(snapshot) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone No.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              snapshot.data!['phoneNo'],
              style: TextStyle(fontSize: 16, height: 1.4),
            )
          ],
        ),
      );
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   late final Map<String, dynamic> userMap;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestoreDBUserProf = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Profile")),
//         body: StreamBuilder<DocumentSnapshot>(
//             stream: _firestoreDBUserProf
//                 .collection("users")
//                 .doc(_auth.currentUser!.uid)
//                 .snapshots(),
//             builder: (BuildContext context, snapshot) {
//               if (!snapshot.hasData) return CircularProgressIndicator();
//               return SingleChildScrollView(
//                   padding: EdgeInsets.all(15),
//                   child: Column(children: [
//                     Container(
//                       padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
//                       alignment: Alignment.centerLeft,
//                       child: Text(snapshot.data!['name'],
//                           style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               fontStyle: FontStyle.italic)),
//                     ),
//                     Container(
//                         child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         IconButton(onPressed: () {}, icon: Icon(Icons.call)),
//                         Text(snapshot.data!['phoneNo'],
//                             style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 fontStyle: FontStyle.italic)),
//                       ],
//                     )),
//                     Container(
//                         child: Row(
//                       children: [
//                         IconButton(onPressed: () {}, icon: Icon(Icons.email)),
//                         Text(snapshot.data!['email'],
//                             style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 fontStyle: FontStyle.italic)),
//                       ],
//                     )),
//                     Container(
//                         child: Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(CupertinoIcons.building_2_fill)),
//                         Text(snapshot.data!['address'],
//                             style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 fontStyle: FontStyle.italic)),
//                       ],
//                     )),
//                   ]));
//             }));
//   }
// }
