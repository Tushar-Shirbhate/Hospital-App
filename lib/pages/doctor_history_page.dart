import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/pages/report_view.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/screen_arguments_appointment.dart';

class DoctorHistoryPage extends StatefulWidget {
  const DoctorHistoryPage({Key? key}) : super(key: key);

  @override
  _DoctorHistoryPageState createState() => _DoctorHistoryPageState();
}

class _DoctorHistoryPageState extends State<DoctorHistoryPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _firestoreDBPatientAppointment = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(CupertinoIcons.clock_fill),
            title: Text(
                "History"
            )
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _firestoreDBPatientAppointment.doc(_auth.currentUser!.uid).collection('patientHistoryList').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> _map = snapshot.data!.docs[index]
                        .data() as Map<String, dynamic>;
                    return SingleChildScrollView(
                        child: Card(
                            elevation : 5,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                height: 245,
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
                                                    "Name: ${_map['patientName']}",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.bold,
                                                        fontStyle: FontStyle.italic
                                                    ),
                                                  ),
                                                  SizedBox(height:5),
                                                  Text(
                                                    "Email: ${_map['email']}",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.bold,
                                                        fontStyle: FontStyle.italic
                                                    ),
                                                  ),
                                                  SizedBox(height:5),
                                                  Text(
                                                    "Doctor: ${_map['doctorName']}",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.bold,
                                                        fontStyle: FontStyle.italic
                                                    ),
                                                  ),
                                                  SizedBox(height:5),
                                                  Text(
                                                      "Date: ${_map['date']}",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color:  Colors.black54,
                                                        fontStyle: FontStyle.italic
                                                      )
                                                  ),
                                                  SizedBox(height:5),
                                                  Text(
                                                      "Time: ${_map['fromTime']} - ${_map['toTime']}",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                          color:  Colors.black54,
                                                          fontStyle: FontStyle.italic
                                                      )),

                                                ]
                                            ),
                                          ]
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),

                                      StreamBuilder(
                                          stream: _firestoreDBPatientAppointment.doc(_auth.currentUser!.uid).collection("reportFileList").doc("${_map['date']}${_map['patientName']}${_map['doctorName']}").snapshots(),
                                          builder: (context, AsyncSnapshot snapshot) {

                                            var x = snapshot.data;

                                            if (!snapshot.hasData) {
                                              return Center(child: CircularProgressIndicator());
                                            }
                                            if (snapshot.hasData) {
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context, MaterialPageRoute(builder: (
                                                      context) =>
                                                      ReportView(x['reportFileUrl'])));
                                                },
                                                child:  Container(
                                                    width: 150,
                                                    height: 37,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blueAccent,
                                                        borderRadius: BorderRadius.circular(20.0)
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            "Report",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: CupertinoColors.black
                                                            ))))
                                              );
                                            }
                                            //  }
                                            return Center(
                                                child: SizedBox(height:40)
                                            );
                                          }
                                      ),
                                    ]
                                )
                            )
                        )
                    );
                  }
              );
            }
        )
    );
  }
}
