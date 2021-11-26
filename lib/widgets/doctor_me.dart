import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
//import 'package:tushar_h/utils/routes.dart';

class DoctorMe extends StatefulWidget {
  @override
  State<DoctorMe> createState() => _DoctorMeState();
}

class _DoctorMeState extends State<DoctorMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(CupertinoIcons.heart_solid),
          title: Text("Me"),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(15),
              child: Align(
                  alignment: Alignment.center,
                  child: Column(children: [
                    SizedBox(height: 150),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MyRoute.doctorProfileRoute);
                      },
                      child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            color: Colors.red,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(CupertinoIcons.profile_circled),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          )),
                    ),
                    SizedBox(height: 10),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, MyRoute.doctorEditProfileRoute);
                    //   },
                    //   child: Container(
                    //       width: double.infinity,
                    //       padding: EdgeInsets.fromLTRB(25,0,25,0),
                    //       height: 60,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(35.0),
                    //           color: Colors.red,
                    //       ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Icon(Icons.edit),
                    //             Text(
                    //                 "Edit Profile",
                    //                 style: TextStyle(
                    //                     color: Colors.black,
                    //                     fontSize: 30
                    //                 )
                    //             ),
                    //             Icon(Icons.arrow_forward_ios),
                    //           ],
                    //         ),
                    //   ),
                    //),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MyRoute.doctorEditProfileRoute);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: Colors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(CupertinoIcons.clock_fill),
                            Text("History",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30)),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoute.settingRoute);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            color: Colors.red),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(CupertinoIcons.settings_solid),
                            Text("Settings",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30)),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                  ]))),
        ));
  }
}
