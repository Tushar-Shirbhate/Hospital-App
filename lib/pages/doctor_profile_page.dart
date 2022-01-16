// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:hospital_app/pages/doctor_edit_profile_page.dart';
//import 'package:hospital_app/pages/edit_profilePage.dart';
import 'package:hospital_app/utils/doctor.dart';
import 'package:hospital_app/utils/user.dart';
import 'package:hospital_app/widgets/profile_widget.dart';
import 'package:hospital_app/widgets/doctor_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({Key? key}) : super(key: key);

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  final doctor = DoctorPreferences.myDoctor;
  late final Map<String, dynamic> hospitalMap;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestoreDBHosProf = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 243, 247),
      body: StreamBuilder<DocumentSnapshot>(
          stream: _firestoreDBHosProf
              .collection("users")
              .doc(_auth.currentUser!.uid)
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return ListView(physics: BouncingScrollPhysics(), children: [
              Container(
                color: Colors.white,
                child: buildName(snapshot),
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    bulidPhoneNo(snapshot),
                    Divider(),
                    buildAddress(snapshot),
                  ],
                ),
              ),
            ]);
          }),
    );
  }

  buildName(snapshot) => Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CircleAvatar(
                backgroundImage: AssetImage("Assets/images/hospital.png"),
                radius: 50),
            const SizedBox(height: 10),
            Text(
              snapshot.data!['name'],
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              snapshot.data!['email'],
              style: TextStyle(
                color: Color.fromARGB(255, 155, 155, 155),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                // color: Colors.blue
              ),
            )
          ],
        ),
      );

  buildAddress(snapshot) => Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.building_2_fill,
                    color: Colors.black,
                  ),
                  Text(
                    ' Address',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                snapshot.data!['address'],
                style: TextStyle(
                    color: Color.fromARGB(255, 155, 155, 155),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.4),
              )
            ],
          ),
        ),
      );

  bulidPhoneNo(snapshot) => Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.black,
                  ),
                  Text(
                    ' Phone number',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                snapshot.data!['phoneNo'],
                style: TextStyle(
                    color: Color.fromARGB(255, 155, 155, 155),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.4),
              )
            ],
          ),
        ),
      );

  // buildEducation(Doctor doctor) => Container(
  //       padding: EdgeInsets.symmetric(horizontal: 48),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'Education',
  //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //           ),
  //           Text(
  //             doctor.education,
  //             style: TextStyle(fontSize: 16, height: 1.4),
  //           )
  //         ],
  //       ),
  //     );
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// class DoctorProfilePage extends StatefulWidget {
//   const DoctorProfilePage({Key? key}) : super(key: key);

//   @override
//   _DoctorProfilePageState createState() => _DoctorProfilePageState();
// }

// class _DoctorProfilePageState extends State<DoctorProfilePage> {
//   // late final Map<String, dynamic> hospitalMap;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestoreDBHosProf = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//               "Profile"
//           )
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: _firestoreDBHosProf.collection("users").doc(_auth.currentUser!.uid).snapshots(),
//           builder: (BuildContext context, snapshot){
//           if(!snapshot.hasData) return CircularProgressIndicator();
//           return  SingleChildScrollView(
//               padding: EdgeInsets.all(15),
//               child: Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.fromLTRB(15,0,0,0),
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                           snapshot.data!['name'],
//                           style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               fontStyle: FontStyle.italic
//                           )
//                       ),
//                     ),
//                     Container(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             IconButton(
//                                 onPressed: (){

//                                 },
//                                 icon: Icon(Icons.call)),
//                             Text(
//                                 snapshot.data!['phoneNo'],
//                                 style: TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.bold,
//                                     fontStyle: FontStyle.italic
//                                 )
//                             ),
//                           ],
//                         )
//                     ),
//                     Container(
//                         child: Row(
//                           children: [
//                             IconButton(
//                                 onPressed: (){

//                                 },
//                                 icon: Icon(Icons.email)
//                             ),
//                             Text(
//                                 snapshot.data!['email'],
//                                 style: TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.bold,
//                                     fontStyle: FontStyle.italic
//                                 )
//                             ),
//                           ],
//                         )
//                     ),
//                     Container(
//                         child: Row(
//                           children: [
//                             IconButton(
//                                 onPressed: (){

//                                 },
//                                 icon: Icon(CupertinoIcons.building_2_fill)
//                             ),
//                             Text(
//                                 snapshot.data!['address'],
//                                 style: TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.bold,
//                                     fontStyle: FontStyle.italic
//                                 )
//                             ),
//                           ],
//                         )
//                     ),
//                   ]
//               )
//           );
//         }
//       )
//           );
//   }
// }
