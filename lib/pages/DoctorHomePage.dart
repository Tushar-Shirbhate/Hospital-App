import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/widgets/add_doctor_list_page.dart';
import 'package:hospital_app/widgets/doctor_appointment.dart';
import 'package:hospital_app/widgets/doctor_appointment_accepted.dart';
import 'package:hospital_app/widgets/doctor_me.dart';
import 'package:hospital_app/widgets/doctor_appointment_requested.dart';

class DoctorHomePage extends StatefulWidget{
  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  int selectIndex = 0;

  static List<Widget> _widgetOptions = <Widget> [
    DoctorAppointment(),
    AddDoctorListPage(),
    DoctorMe(),
  ];

  void _onItemTapped(int index){
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(selectIndex)
        ),
        bottomNavigationBar: Container(
          color: Color.fromRGBO(206, 147, 216, 1),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),),
            child: BottomNavigationBar(
              backgroundColor:  Color.fromRGBO(254, 23, 72, 1),
              elevation: 5,
              selectedItemColor: Colors.white,
             selectedFontSize: 15,
              // selectedIconTheme: ,
              showSelectedLabels: true,
              unselectedItemColor: Colors.white,
               showUnselectedLabels: false,
              items:  <BottomNavigationBarItem> [
              BottomNavigationBarItem(
                // activeIcon: Icon(CupertinoIcons.doc_plaintext,size: 30,color:  Colors.white),
                  icon: Image.asset("Assets/images/appointment.png", fit: BoxFit.fitHeight, height: 27,),
                  // icon: Icon(CupertinoIcons.doc_plaintext,size: 27, color: Colors.white,),
                  label: "Appointment"
              ),  BottomNavigationBarItem(
                 //activeIcon: Icon(Icons.request_page_outlined,size: 30,color: Colors.white),
                  icon: Image.asset("Assets/images/myDoctor.png", fit: BoxFit.fitHeight, height: 27,),
                  label: "Doctors",
                ),
                BottomNavigationBarItem(
                   //activeIcon: Icon(CupertinoIcons.heart_solid,size: 30,color: Colors.white),
                    icon: Image.asset("Assets/images/like.png", fit: BoxFit.fitHeight, height: 27),
                    // icon: Icon(CupertinoIcons.heart_solid,size: 27,color:  Colors.white),
                  label: "Me"
                ),
              ],
              currentIndex: selectIndex,
              onTap: _onItemTapped,
            ),
          ),
        )
      );
  }
}