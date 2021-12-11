import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/HospitalAuthentication/Hospital_Methods.dart';
import 'package:hospital_app/widgets/doctor_appointment_accepted.dart';
import 'package:hospital_app/widgets/doctor_appointment_requested.dart';

class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentState createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        child:  Scaffold(
            backgroundColor: Color.fromRGBO(206, 147, 216, 1),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Center(
                child: Container(
                color: Color.fromRGBO(206, 147, 216, 1),
                  width: double.infinity,
                    padding: EdgeInsets.fromLTRB(85, 5, 5, 5),
                    child: Image.asset("Assets/images/doctor.png", fit: BoxFit.fitHeight, height: 50,)
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: IconButton(
                    onPressed: (){
                     hospitalLogOut(context);
                    },
                      icon: Icon(Icons.logout, color: Color.fromRGBO(254, 23, 72, 1),)
                  ),
                )
              ],
              elevation: 0,
              backgroundColor: Color.fromRGBO(206, 147, 216, 1),
              bottom: TabBar(
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  indicatorColor: Color.fromRGBO(254, 23, 72, 1),
                    tabs: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(254, 23, 72, 1),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
                          width: double.infinity,
                          child: Tab(text: "Accepted")), Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(254, 23, 72, 1),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
                          width: double.infinity,
                          child: Tab(text: "Requested",)),


                    ]
                ),

          ),
          body:  TabBarView(
              children: <Widget>[
                DoctorAppointmentAccepted(),
                DoctorAppointmentRequested(),
              ]
          ),
        ) ,
    );
  }
}