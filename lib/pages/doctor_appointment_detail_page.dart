import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/pages/report_view.dart';
import 'package:hospital_app/utils/screen_arguments_appointment.dart';

class DoctorAppointmentDetailPage extends StatefulWidget{
  @override
  State<DoctorAppointmentDetailPage> createState() => _DoctorAppointmentDetailPageState();
}

class _DoctorAppointmentDetailPageState extends State<DoctorAppointmentDetailPage> {
  final CollectionReference firestoreDBPatientRequestList = FirebaseFirestore.instance.collection('patientRequestDetailList');
  String reportUrl = "";
  int? number;
  late String patientApListId;
  late String patientNameAp;
  bool isReport = false;
  late bool present;

  @override
  Widget build(BuildContext context) {
    final argsAp = ModalRoute.of(context)!.settings.arguments as ScreenArgumentsAppointment;

     patientApListId = argsAp.patientAcceptListId;
     patientNameAp = argsAp.patientName;

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
                    Container(
                      padding: EdgeInsets.fromLTRB(15,0,0,0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          argsAp.patientName,
                          style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                          )
                      ),
              ),
                     Container(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            IconButton(
                              onPressed: (){

                          },
                              icon: Icon(Icons.date_range)),
                               Text(
                                   argsAp.date,
                                    style: TextStyle(
                                   fontSize: 24,
                                   fontWeight: FontWeight.bold,
                                   fontStyle: FontStyle.italic
                                    )
                         ),
                      ],
                     )
                    ),
                    Container(
                         child: Row(
                           children: [
                              IconButton(
                               onPressed: (){

                              },
                                icon: Icon(Icons.lock_clock)
                              ),
                              Text(
                                argsAp.fromTime,
                                style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                                )
                              ),
                           ],
                         )
                      ),
                    Container(
                         child: Row(
                            children: [
                              IconButton(
                                 onPressed: (){

                                },
                                 icon: Icon(Icons.lock_clock)
                             ),
                               Text(
                                argsAp.toTime,
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
                               // onTap: (){
                                 onTap: uploadReportToFirebase,
                                //   setState(() {
                                //   isReport = !isReport;
                                // });
                                // },
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
                          stream: FirebaseFirestore.instance.collection("reportFileList").doc("${patientNameAp}").snapshots(),
                           builder: (context, AsyncSnapshot snapshot) {
                             //DocumentSnapshot x = snapshot.data!;
                             //String id = snapshot.data!.doc("${patientNameAp}").id;
                          //   if(isReport) {
                               var x = snapshot.data;
                               // if(id.isEmpty){

                              // }
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
                                           x["num"],
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
                                  await firestoreDBPatientRequestList.doc(patientApListId).delete().then((value) => print('deleted'));
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
   //number = Random().nextInt(10);

    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File pick = File(result!.files.single.path.toString());
    var file = pick.readAsBytesSync();
    String name = DateTime.now().millisecondsSinceEpoch.toString();

    var reportFile =  FirebaseStorage.instance.ref().child(name).child("/.pdf");
    UploadTask task = reportFile.putData(file);
    TaskSnapshot snapshot = await task;
    reportUrl = await snapshot.ref.getDownloadURL();

    await FirebaseFirestore.instance.collection("reportFileList").doc("${patientNameAp}").set({
      "reportFileUrl": reportUrl,
     // "num": "Report-"+number.toString()
      "num": "Report-${patientNameAp}"
    });
}

}







