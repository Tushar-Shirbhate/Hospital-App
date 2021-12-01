import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/screen_arguments_appointment.dart';

class DoctorAppointment extends StatefulWidget{
  @override
  State<DoctorAppointment> createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _firestoreDBPatientAppointment = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.doc_plaintext),
        title: Text(
          "Appointment"
        )
      ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _firestoreDBPatientAppointment.doc(_auth.currentUser!.uid).collection('patientAcceptedList').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> _map = snapshot.data!.docs[index]
                  .data() as Map<String, dynamic>;
                  return SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(15,15,15,0.2),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MyRoute.doctorAppointmentDetailRoute,
                            arguments: ScreenArgumentsAppointment(
                              _map["patientName"],
                                _map["email"],
                                _map["phoneNo"],
                                _map["patientUid"],
                                _map["hospitalUid"],
                                _map["doctorName"],
                                _map["doctorPost"],
                                _map["doctorSpeciality"],
                                _map["doctorEducation"],
                                _map["date"],
                                _map["fromTime"],
                                _map["toTime"],
                              _firestoreDBPatientAppointment.doc(_auth.currentUser!.uid).collection('patientAcceptedList').doc().id,
                              snapshot.data!.docs[index].id,
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
                                         _map['patientName'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)
                                      ),
                                      Text(
                                          "Date: ${_map['date']}",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18,
                                              fontStyle: FontStyle.italic)
                                      ),Text(
                                          "Time: ${_map['fromTime']} - ${_map['toTime']}",
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