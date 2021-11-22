import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/widgets/doctor_appointment.dart';
import 'package:hospital_app/widgets/doctor_me.dart';
import 'package:hospital_app/widgets/doctor_request.dart';

class DoctorHomePage extends StatefulWidget{
  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  int _selectIndex = 0;

  static List<Widget> _widgetOptions = <Widget> [
    DoctorAppointment(),
    DoctorRequest(),
    DoctorMe(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectIndex)
        ),
        bottomNavigationBar: BottomNavigationBar(
         // backgroundColor: Colors.blue,
          elevation: 5,
          selectedItemColor: Colors.red,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.doc_plaintext),
                label: "Appointment"
            ),  BottomNavigationBarItem(
                icon: Icon(Icons.request_page_outlined),
                label: "Request"
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_solid),
              label: "Me"
            ),
          ],
          currentIndex: _selectIndex,
          onTap: _onItemTapped,
        )
      );
  }
}