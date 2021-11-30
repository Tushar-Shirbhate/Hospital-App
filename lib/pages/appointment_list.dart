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
          appBar: AppBar(
              title: Text("Appointment"),
            bottom:  TabBar(
              tabs: [
                Tab(text: "Requested"),
                Tab(text: "Accepted"),
              ]
            )
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