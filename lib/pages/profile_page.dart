// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/Authentication/Methods.dart';
//import 'package:hospital_app/pages/edit_profilePage.dart';
import 'package:hospital_app/utils/storage_service.dart';
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
  final Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
// final user = UserPreferences.myUser;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 243, 247),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "Hospital App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xff8f94fb),
        actions: [
          Container(
            child: IconButton(
                onPressed: () {
                  logOut(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: _firestoreDBUserProf
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
                backgroundColor: Color(0xff8f94fb),
                backgroundImage: AssetImage("Assets/images/patient_2.png"),
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

  // buildEducation(User doctor) => Container(
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
  // buildName(snapshot) => Column(
  //       children: [
  //         Text(
  //           snapshot.data!['name'],
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //             fontSize: 24,
  //           ),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           snapshot.data!['email'],
  //           style: TextStyle(color:Color.fromRGBO(1,1,1,1),
  // ),
  //         )
  //       ],
  //     );
  //
  // buildAddress(snapshot) => Container(
  //       padding: EdgeInsets.symmetric(horizontal: 48),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'Address',
  //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //           ),
  //           Text(
  //             snapshot.data!['address'],
  //             style: TextStyle(fontSize: 16, height: 1.4),
  //           )
  //         ],
  //       ),
  //     );
  //
  // buildPhone(snapshot) => Container(
  //       padding: EdgeInsets.symmetric(horizontal: 48),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             'Phone No.',
  //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //           ),
  //           Text(
  //             snapshot.data!['phoneNo'],
  //             style: TextStyle(fontSize: 16, height: 1.4,
  //               color: Colors.black,
  //             ),
  //           )
  //         ],
  //       ),
  //     );


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
