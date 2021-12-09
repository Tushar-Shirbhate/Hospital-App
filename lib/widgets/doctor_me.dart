import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/HospitalAuthentication/Hospital_Methods.dart';
import 'package:hospital_app/pages/doctor_profile_page.dart';
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
        backgroundColor: Color.fromRGBO(206, 147, 216, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(145, 0,15,0),
            child: Text("Profile",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromRGBO(254, 23, 72, 1)),

            ),
          ),
          elevation: 0,
          backgroundColor: Color.fromRGBO(206, 147, 216, 1),
          actions: [
            PopupMenuButton<int>(
              color: Color.fromRGBO(254, 23, 72, 1),
              icon: Icon(Icons.more_horiz,color: Color.fromRGBO(254, 23, 72, 1)),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.clock,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                            "History",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    )), PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.settings,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                            "Settings",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    )),
              ],
              onSelected: (item) => SelectedItem(context, item),
            ),
            Container(
              // margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
              // padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: IconButton(
                  onPressed: (){
                    hospitalLogOut(context);
                  },
                  icon: Icon(Icons.logout, color: Color.fromRGBO(254, 23, 72, 1),)
              ),
            ),
          ],
        ),
        body: DoctorProfilePage());
  }
  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.pushNamed(context, MyRoute.doctorHistoryRoute);
        break;
      case 1:
        Navigator.pushNamed(context, MyRoute.settingRoute);
        break;
    }
  }
}
