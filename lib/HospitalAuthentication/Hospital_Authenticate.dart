// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hospital_app/pages/DoctorHomePage.dart';
// import 'package:hospital_app/pages/app_home_page.dart';
// import 'package:hospital_app/pages/home_page.dart';
//
// class HospitalAuthenticate extends StatefulWidget {
//   @override
//   _HospitalAuthenticateState createState() => _HospitalAuthenticateState();
// }
//
// class _HospitalAuthenticateState extends State<HospitalAuthenticate> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     if(_auth.currentUser != null){
//       return DoctorHomePage();
//     }
//     else{
//       return AppHomePage();
//     }
//   }
// }
