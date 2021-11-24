import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/screen_argument_appointment_list.dart';
import 'package:hospital_app/utils/screen_arguments_doctor_list.dart';

class AppointmentListPage extends StatefulWidget{
  late final String name;

  @override
  State<AppointmentListPage> createState() => _AppointmentListPageState();
}

class _AppointmentListPageState extends State<AppointmentListPage> {

  @override
  Widget build(BuildContext context) {
    final argsApL = ModalRoute.of(context)!.settings.arguments as ScreenArgumentAppointmentList;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Appointment")
      ),
      body: ListView.builder(
          itemCount: 1,
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
                                            argsApL.doctorName,
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            argsApL.doctorPost,
                                              style: TextStyle(
                                                fontSize: 16,
                                              )
                                          ),
                                          Text(
                                            argsApL.doctorSpeciality,
                                              style: TextStyle(
                                                fontSize: 16,
                                              )),
                                          Text(
                                            argsApL.doctorEducation,
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
                              Container(
                                  width: double.infinity,
                                  height: 37,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: Center(
                                      child: Text(
                                          "Cancel Appointment",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: CupertinoColors.black
                                          ))))
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