// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/pages/DoctorHomePage.dart';
import 'package:hospital_app/pages/Setting_page.dart';
import 'package:hospital_app/pages/app_home_page.dart';
import 'package:hospital_app/pages/doctor_appointment_detail_page.dart';
import 'package:hospital_app/pages/doctor_edit_profile_page.dart';
import 'package:hospital_app/pages/doctor_login_page.dart';
import 'package:hospital_app/pages/doctor_profile_page.dart';
import 'package:hospital_app/pages/doctor_request_detail_page.dart';
import 'package:hospital_app/pages/home_page.dart';
import 'package:hospital_app/pages/hospital_detail_page.dart';
import 'package:hospital_app/pages/login_page.dart';
import 'package:hospital_app/pages/profile_page.dart';
import 'package:hospital_app/pages/starred_page.dart';
import 'package:hospital_app/utils/routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return  MaterialApp(
              debugShowCheckedModeBanner: false,
              //  initialRoute: MyRoute.appHomeRoute,
              routes: {
                "/": (context) => AppHomePage(),
                MyRoute.loginRoute: (context) => LoginPage(),
                MyRoute.homeRoute: (context) => HomePage(),
                MyRoute.loginRoute: (context) => LoginPage(),
                MyRoute.settingRoute: (context) => SettingPage(),
                MyRoute.starredRoute: (context) => StarredPage(),
                MyRoute.detailRoute: (context) => HospitalDetailPage(),
                MyRoute.profileRoute: (context) => ProfilePage(),
                MyRoute.doctorLoginRoute: (context) => DoctorLoginPage(),
                MyRoute.doctorHomeRoute: (context) => DoctorHomePage(),
                MyRoute.doctorAppointmentDetailRoute: (context) => DoctorAppointmentDetailPage(),
                MyRoute.doctorRequestDetailRoute: (context) => DoctorRequestDetailPage(),
                MyRoute.doctorEditProfileRoute: (context) => DoctorEditProfilePage(),
                MyRoute.doctorProfileRoute: (context) => DoctorProfilePage()
              });
        }
        return CircularProgressIndicator();
      },
    );


  }
}
