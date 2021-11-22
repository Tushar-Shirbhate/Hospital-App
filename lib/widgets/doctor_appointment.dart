import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/screen_arguments_appointment.dart';

class DoctorAppointment extends StatefulWidget{
  @override
  State<DoctorAppointment> createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  var firestoreDBPatientAppointment = FirebaseFirestore.instance.collection("patientRequestDetailList").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.doc_plaintext),
        title: Text(
          "Appointment"
        )
      ),
        body: StreamBuilder(
          stream: firestoreDBPatientAppointment,
          builder: (context, snapshot){
            if(!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
                itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(15,15,15,0.2),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MyRoute.doctorAppointmentDetailRoute,
                            arguments: ScreenArgumentsAppointment(
                              '${(snapshot.data! as QuerySnapshot).docs[index]['patientName']}',
                              '${(snapshot.data! as QuerySnapshot).docs[index]['date']}',
                              '${(snapshot.data! as QuerySnapshot).docs[index]['fromTime']}',
                              '${(snapshot.data! as QuerySnapshot).docs[index]['toTime']}',
                              '${(snapshot.data! as QuerySnapshot).docs[index].id}'
                            )
                          );
                        },
                        child: Card(
                            elevation: 5,
                            child: Container(
                                height: 100,
                                padding: EdgeInsets.fromLTRB(15,15,15,15),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          (snapshot.data! as QuerySnapshot)
                                              .docs[index]['patientName'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)
                                      ),
                                      Text(
                                          (snapshot.data! as QuerySnapshot)
                                              .docs[index]['date'],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18,
                                              fontStyle: FontStyle.italic)
                                      ),Text(
                                          "${(snapshot.data! as QuerySnapshot)
                                              .docs[index]['fromTime']} - ${(snapshot.data! as QuerySnapshot)
                                              .docs[index]['toTime']}",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18,
                                              fontStyle: FontStyle.italic)
                                      )
                                    ]
                                )
                            )
                        ),
                      )
                  );
                }
            );
          }
        )
    );
  }
}