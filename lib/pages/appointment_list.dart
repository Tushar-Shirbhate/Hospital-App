import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/screen_argument_appointment_list.dart';
import 'package:hospital_app/utils/screen_arguments_doctor_list.dart';
import 'package:hospital_app/widgets/appointment_accepted.dart';
import 'package:hospital_app/widgets/appointment_requested.dart';

class AppointmentListPage extends StatefulWidget{
  @override
  State<AppointmentListPage> createState() => _AppointmentListPageState();
}

class _AppointmentListPageState extends State<AppointmentListPage> {

  @override
  Widget build(BuildContext context) {
      return DefaultTabController(
        length: 2,
        child:  Scaffold(
          backgroundColor: Color.fromRGBO(206, 147, 216, 1),
          appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined, color:  Color.fromRGBO(254, 23, 72, 1)),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Color.fromRGBO(206, 147, 216, 1),
              // backgroundColor:  Color.fromRGBO(254, 23, 72, 1),
              elevation: 0,
              title:  Padding(
                padding: const EdgeInsets.fromLTRB(60, 0,15,0),
                child: Text("Appointment",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromRGBO(254, 23, 72, 1)),

                ),
              ),
            bottom:  TabBar(
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
                      child: Tab(text: "Requested",)),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(254, 23, 72, 1),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
                      width: double.infinity,
                      child: Tab(text: "Accepted")),
                ]
            ),
          ),
          body:  TabBarView(
              children: <Widget>[
                AppointmentRequested(),
                AppointmentAccepted(),
              ]
          ),
        ) ,
      );
  }
}