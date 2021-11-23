import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/screen_argument_appointment_list.dart';
import 'package:hospital_app/utils/screen_arguments_doctor_list.dart';

class HospitalDetailPage extends StatefulWidget{
  late final String name;


  @override
  State<HospitalDetailPage> createState() => _HospitalDetailPageState();
}

class _HospitalDetailPageState extends State<HospitalDetailPage> {

  @override
  Widget build(BuildContext context) {
    final argsDL = ModalRoute.of(context)!.settings.arguments as ScreenArgumentsDoctorList;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Hospital App")
        ),
        body: ListView.builder(
              itemCount: argsDL.doctorList.length,
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                    child: Card(
                      elevation : 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                          height: 165,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children:[
                                // Image.asset(
                                //   "assets/images/user.png",
                                // ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        argsDL.doctorList[index]['doctorName'],
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                                    Text(
                                        argsDL.doctorList[index]['doctorPost'],
                                        style: TextStyle(
                                          fontSize: 16,
                                        )
                                    ),
                                    Text(
                                        argsDL.doctorList[index]['doctorSpeciality'],
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    Text(
                                        argsDL.doctorList[index]['doctorEducation'],
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                  ]
                                ),
                              ]
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: (){
                                FirebaseFirestore.instance
                                    .collection("patientList")
                                    .add({"patientName":"Tushar"});
                                ScreenArgumentAppointmentList(argsDL.doctorList[index]['doctorName'],
                                  argsDL.doctorList[index]['doctorPost'],
                                argsDL.doctorList[index]['doctorSpeciality'],
                                argsDL.doctorList[index]['doctorEducation']);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 37,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(20.0)
                                ),
                                  child: Center(
                                      child: Text(
                                          "Get Appointment",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: CupertinoColors.black
                                          )))),
                            )
                          ]
                        )
                      )
                    )
                );
              }
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(32,0,0,0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    child: Icon(Icons.video_call),
                    onPressed: () {

                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  child: Icon(Icons.messenger_rounded),
                  onPressed: () {

                  },
                ),
              ),
            ]
          ),
          //]
     //   ),

      );
  }
}