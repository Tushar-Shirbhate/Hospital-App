import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/screen_arguments.dart';

class DoctorRequest extends StatefulWidget{
  @override
  State<DoctorRequest> createState() => _DoctorRequestState();
}

class _DoctorRequestState extends State<DoctorRequest> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _firestoreDBPatientList = FirebaseFirestore.instance.collection("users");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.request_page_outlined),
            title: Text(
                "Request"
            )
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _firestoreDBPatientList.doc(_auth.currentUser!.uid).collection('patientRequestList').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData) return CircularProgressIndicator();
            return  ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> _map = snapshot.data!.docs[index]
                  .data() as Map<String, dynamic>;
                  return SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(15,15,15,0.2),
                    child: InkWell(
                        onTap: () async{
                          Navigator.pushNamed(
                            context,
                            MyRoute.doctorRequestDetailRoute,
                            arguments: ScreenArguments(
                                _map['patientName'],
                                _map['email'],
                                _map['phoneNo'],
                                _map['uid'],
                                _map['doctorName'],
                                _map['doctorPost'],
                                _map['doctorSpeciality'],
                                _map['doctorEducation'],
                              _firestoreDBPatientList.doc(_auth.currentUser!.uid).collection('patientRequestList').doc().id,
                                snapshot.data!.docs[index].id,
                            ),
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
                                    "Date: --",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic)
                                ),Text(
                                "Time: --",
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