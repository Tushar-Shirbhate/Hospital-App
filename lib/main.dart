// ignore_for_file: prefer_const_constructors,

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/Authentication/Authenticate.dart';
import 'package:hospital_app/HospitalAuthentication/hospital_login_screen.dart';
import 'package:hospital_app/pages/DoctorHomePage.dart';
import 'package:hospital_app/pages/Setting_page.dart';
import 'package:hospital_app/pages/add_doctor_list_page.dart';
import 'package:hospital_app/pages/app_home_page.dart';
import 'package:hospital_app/pages/appointment_list.dart';
import 'package:hospital_app/pages/doctor_appointment_detail_page.dart';
import 'package:hospital_app/pages/doctor_edit_profile_page.dart';
import 'package:hospital_app/pages/doctor_login_page.dart';
import 'package:hospital_app/pages/doctor_profile_page.dart';
import 'package:hospital_app/pages/doctor_request_detail_page.dart';
import 'package:hospital_app/pages/edit_profilePage.dart';
import 'package:hospital_app/pages/home_page.dart';
import 'package:hospital_app/pages/hospital_detail_page.dart';
import 'package:hospital_app/Authentication/login_screen.dart';
import 'package:hospital_app/pages/profile_page.dart';
import 'package:hospital_app/pages/starred_page.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/themes.dart';
import 'package:hospital_app/widgets/appointment_requested.dart';
import 'package:hospital_app/widgets/user_preferences.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return ThemeProvider(
              //initTheme:
              //     user.isDarkmode ? MyThemes.darkTheme : MyThemes.lightTheme,
              child: Builder(
                  builder: (context) => MaterialApp(
                          debugShowCheckedModeBanner: false,
                          theme: ThemeProvider.of(context),

                          //  initialRoute: MyRoute.appHomeRoute,
                          routes: {
                            "/": (context) => Authenticate(),
                            MyRoute.appHomeRoute: (context) => AppHomePage(),
                            MyRoute.loginRoute: (context) => LoginScreen(),
                            MyRoute.hospitalLoginRoute: (context) => HospitalLoginScreen(),
                            MyRoute.homeRoute: (context) => HomePage(),
                            MyRoute.settingRoute: (context) => SettingPage(),
                            MyRoute.starredRoute: (context) => StarredPage(),
                            MyRoute.detailRoute: (context) =>
                                HospitalDetailPage(),
                            MyRoute.profileRoute: (context) => ProfilePage(),
                            MyRoute.editprofileRoute: (context) =>
                                EditProfilePage(),
                            MyRoute.doctorLoginRoute: (context) =>
                                DoctorLoginPage(),
                            MyRoute.doctorHomeRoute: (context) =>
                                DoctorHomePage(),
                            MyRoute.doctorAppointmentDetailRoute: (context) =>
                                DoctorAppointmentDetailPage(),
                            MyRoute.doctorRequestDetailRoute: (context) =>
                                DoctorRequestDetailPage(),
                            MyRoute.doctorEditProfileRoute: (context) =>
                                DoctorEditProfilePage(),
                            MyRoute.doctorProfileRoute: (context) =>
                                DoctorProfilePage(),
                            MyRoute.appointmentListRoute: (context) =>
                                AppointmentListPage(),
                            MyRoute.addDoctorListRoute: (context) =>
                            AddDoctorListPage(),
                            MyRoute.appointmentRequestedRoute: (context) =>
                            AppointmentRequested()
                          })));
        }
        return CircularProgressIndicator();
      },
    );
  }
}
