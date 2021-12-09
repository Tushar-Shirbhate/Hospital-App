import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/screen_arguments_appointment.dart';
//DoctorAppointmentAccepted
class DoctorAppointmentAccepted extends StatefulWidget{
  @override
  State<DoctorAppointmentAccepted> createState() => _DoctorAppointmentAcceptedState();
}

class _DoctorAppointmentAcceptedState extends State<DoctorAppointmentAccepted> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _firestoreDBPatientAppointment = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(206, 147, 216, 1),
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
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border:  Border.all(color: Color.fromRGBO(254, 23, 72, 1),),
                                    color: Color.fromRGBO(250, 228, 252, 1),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  height: size.height / 6.8,
                                  width: double.infinity,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            _map['patientName'],
                                            style: TextStyle(
                                                color: Color.fromRGBO(09, 105, 105, 1),
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)
                                        ),
                                        Text(
                                            "Date: ${_map['date']}",
                                            style: TextStyle(
                                                color: Color.fromRGBO(206, 123, 25, 1),
                                                fontSize: 18,
                                                fontStyle: FontStyle.italic)
                                        ),Text(
                                            "Time: ${_map['fromTime']} - ${_map['toTime']}",
                                            style: TextStyle(
                                                color: Color.fromRGBO(206, 123, 25, 1),
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