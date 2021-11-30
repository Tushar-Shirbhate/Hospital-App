// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hospital_app/pages/doctor_edit_profile_page.dart';
// import 'package:hospital_app/pages/edit_profilePage.dart';
// import 'package:hospital_app/utils/doctor.dart';
// import 'package:hospital_app/utils/user.dart';
// import 'package:hospital_app/widgets/profile_widget.dart';
// import 'package:hospital_app/widgets/doctor_preferences.dart';
//
// class DoctorProfilepage extends StatelessWidget {
//   const DoctorProfilepage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final doctor = DoctorPreferences.myDoctor;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: null, icon: Icon(CupertinoIcons.profile_circled)),
//         title: Text('Profile'),
//       ),
//       body: ListView(
//         physics: BouncingScrollPhysics(),
//         children: [
//           ProfileWidget(
//             imagepath: doctor.imagepath,
//             onClicked: () async {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                     builder: (context) => DoctorEditProfilePage()),
//               );
//             },
//           ),
//           const SizedBox(height: 24),
//           buildName(doctor),
//           const SizedBox(height: 24),
//           bulidSpeciality(doctor),
//           const SizedBox(height: 24),
//           buildEducation(doctor),
//           const SizedBox(height: 48),
//           buildDescription(doctor),
//         ],
//       ),
//     );
//   }
//
//   buildName(Doctor doctor) => Column(
//         children: [
//           Text(
//             doctor.name,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 24,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             doctor.email,
//             style: TextStyle(color: Colors.blue),
//           )
//         ],
//       );
//
//   buildDescription(Doctor doctor) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 48),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Description',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               doctor.description,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             )
//           ],
//         ),
//       );
//
//   bulidSpeciality(Doctor doctor) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 48),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Speciality',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               doctor.speciality,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             )
//           ],
//         ),
//       );
//
//   buildEducation(Doctor doctor) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 48),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Education',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               doctor.education,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             )
//           ],
//         ),
//       );
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({Key? key}) : super(key: key);

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  // late final Map<String, dynamic> hospitalMap;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestoreDBHosProf = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Profile"
          )
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestoreDBHosProf.collection("users").doc(_auth.currentUser!.uid).snapshots(),
          builder: (BuildContext context, snapshot){
          if(!snapshot.hasData) return CircularProgressIndicator();
          return  SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15,0,0,0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          snapshot.data!['name'],
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                          )
                      ),
                    ),
                    Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: (){

                                },
                                icon: Icon(Icons.call)),
                            Text(
                                snapshot.data!['phoneNo'],
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic
                                )
                            ),
                          ],
                        )
                    ),
                    Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: (){

                                },
                                icon: Icon(Icons.email)
                            ),
                            Text(
                                snapshot.data!['email'],
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic
                                )
                            ),
                          ],
                        )
                    ),
                    Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: (){

                                },
                                icon: Icon(CupertinoIcons.building_2_fill)
                            ),
                            Text(
                                snapshot.data!['address'],
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic
                                )
                            ),
                          ],
                        )
                    ),
                  ]
              )
          );
        }
      )
          );
  }
}
