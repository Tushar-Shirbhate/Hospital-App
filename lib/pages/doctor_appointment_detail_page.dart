import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/pages/report_view.dart';
import 'package:hospital_app/utils/screen_arguments_appointment.dart';

class DoctorAppointmentDetailPage extends StatefulWidget{
  @override
  State<DoctorAppointmentDetailPage> createState() => _DoctorAppointmentDetailPageState();
}

class _DoctorAppointmentDetailPageState extends State<DoctorAppointmentDetailPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _firestoreDBPatientRequestList = FirebaseFirestore.instance.collection("users");
  String reportUrl = "";
  int? number;
  late String patientApListId;
  late String patientNameAp;
  bool isReport = false;
  late bool present;
  String date = "";
  String patientName = "";
  String doctorName = "";
  String patientUid = "";

  @override
  Widget build(BuildContext context) {
    final argsAp = ModalRoute.of(context)!.settings.arguments as ScreenArgumentsAppointment;

     // patientApListId = argsAp.patientAcceptListId;
     // patientNameAp = argsAp.patientName;
    date = argsAp.date;
    patientName = argsAp.patientName;
    doctorName = argsAp.doctorName;
    patientUid = argsAp.patientUid;


      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Appointment Detail"
          )
        ),
        body: SingleChildScrollView(
                padding: EdgeInsets.all(15),
                 child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.fromLTRB(15,0,0,0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "Name: ${argsAp.patientName}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.fromLTRB(15,0,0,0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "Email: ${argsAp.email}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.fromLTRB(15,0,0,0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "Doctor: ${argsAp.doctorName}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                        padding: EdgeInsets.fromLTRB(15,0,0,0),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.date_range),
                               Text(
                                   " Date: ${argsAp.date}",
                                    style: TextStyle(
                                   fontSize: 24,
                                   fontWeight: FontWeight.bold,
                                   fontStyle: FontStyle.italic
                                    )
                         ),
                      ],
                     )
                    ),
                    SizedBox(height: 20),
                    Container(
                        padding: EdgeInsets.fromLTRB(15,0,0,0),
                        child: Row(
                           children: [
                                Icon(Icons.lock_clock),
                              Text(
                                  " Time: ${argsAp.fromTime} - ${argsAp.toTime}",
                                style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                                )
                              ),
                           ],
                         )
                      ),
                    SizedBox(
                       height: 40
                    ),
                    Container(
                      width: double.infinity,
                      height: 105,
                       child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                                 onTap: uploadReportToFirebase,
                                 child: Icon(
                                 Icons.upload_file,
                                 size: 50,
                                 color: Colors.grey,
                             ),
                          ),
                            Text(
                              "Upload Report",
                              style: TextStyle(
                                 fontSize: 24,
                                 fontWeight: FontWeight.bold,
                                 fontStyle: FontStyle.italic,
                                 color: Colors.grey
                              )
                            )
                          ]
                       )
                    ),
                       SizedBox(height: 20,),
                       StreamBuilder(
                          stream: _firestoreDBPatientRequestList.doc(_auth.currentUser!.uid).collection("reportFileList").doc("${date}${patientName}${doctorName}").snapshots(),
                           builder: (context, AsyncSnapshot snapshot) {

                               var x = snapshot.data;

                               if (!snapshot.hasData) {
                                 return CircularProgressIndicator();
                               }
                               if (snapshot.hasData) {
                                 return InkWell(
                                   onTap: () {
                                     Navigator.push(
                                         context, MaterialPageRoute(builder: (
                                         context) =>
                                         ReportView(x['reportFileUrl'])));
                                   },
                                   child: Container(
                                       width: double.infinity,
                                       height: 40,
                                       // padding: EdgeInsets.fromLTRB(135,0,135,0),
                                       margin: EdgeInsets.fromLTRB(
                                           80, 0, 80, 0),
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(
                                             15),
                                         color: Colors.blue,
                                       ),
                                       child: Center(
                                         child: Text(
                                           "Report",
                                           style: TextStyle(
                                               color: Colors.white,
                                               fontSize: 26
                                           ),),
                                       )
                                   ),
                                 );
                               }
                           //  }
                               return Center(
                                   child: SizedBox(height:40)
                               );
                           }
                       ),
                    SizedBox(height: 40,),
                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                 onTap: () async{
                                 // await _firestoreDBPatientRequestList.doc(patientApListId).delete().then((value) => print('deleted'));
                                  Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 125,
                                    height: 50,
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.greenAccent,
                                    ),
                                   child: Center(
                                      child: Text(
                                           "Done",
                                          style: TextStyle(
                                          fontSize: 26,
                                              color: Colors.white
                                )
                             ),
                          )
                      ),
                  ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                            },
                                child: Container(
                                    width: 125,
                                    height: 50,
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.redAccent,
                                    ),
                                    child: Center(
                                      child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white
                                    )))
                                ),
                              )
                            ],
                        ),
                  ],
                 ),
              ),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(60,0,0,30),
              child: FloatingActionButton(
                child: Icon(Icons.call),
                onPressed: (){

                },
              ),
            ), Padding(
              padding: EdgeInsets.fromLTRB(0,0,28,30),
              child: FloatingActionButton(
                child: Icon(Icons.messenger_rounded),
                onPressed: (){

                },
              ),
            ),
          ],
        ),
      );
  }

  uploadReportToFirebase() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File pick = File(result!.files.single.path.toString());
    var file = pick.readAsBytesSync();
    String name = DateTime.now().millisecondsSinceEpoch.toString();

    var reportFile =  FirebaseStorage.instance.ref().child(name).child("/.pdf");
    UploadTask task = reportFile.putData(file);
    TaskSnapshot snapshot = await task;
    reportUrl = await snapshot.ref.getDownloadURL();

    await _firestoreDBPatientRequestList.doc(_auth.currentUser!.uid).collection("reportFileList").doc("${date}${patientName}${doctorName}").set({
      "reportFileUrl": reportUrl,
      "num": "Report-${date}${patientName}${doctorName}"
    });
    await _firestoreDBPatientRequestList.doc(patientUid).collection("reportFileList").doc("${date}${patientName}${doctorName}").set({
      "reportFileUrl": reportUrl,
      "num": "Report-${date}${patientName}${doctorName}"
    });
}
}







