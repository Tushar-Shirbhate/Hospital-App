import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/screen_arguments.dart';

class  DoctorRequestDetailPage extends StatefulWidget{
  @override
  State<DoctorRequestDetailPage> createState() => _DoctorRequestDetailPageState();
}

class _DoctorRequestDetailPageState extends State<DoctorRequestDetailPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference firestoreDBPatientList = FirebaseFirestore.instance.collection('users');

  late DateTime pickedDate;
  late TimeOfDay time1;
  late TimeOfDay time2;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time1 = TimeOfDay.now();
    time2 = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {

    String date = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    String fromTime = "${time1.hour} : ${time1.minute}";
    String toTime = "${time2.hour} : ${time2.minute}";

    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    String patientListId = args.patientRequestListId;


    return Scaffold(
        appBar: AppBar(
            title: Text(
                "Requested Patient"
            )
        ),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.fromLTRB(15,0,0,0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Name: ${args.patientName}",
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
                        "Email: ${args.patientEmail}",
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
                        "Doctor: ${args.doctorName}",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                        )
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(25,0,15,0),
                      margin: EdgeInsets.fromLTRB(15,3.5,15,3.5),
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.blue),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            date,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30
                            ),
                          ),
                          IconButton(onPressed: _pickDate, icon: Icon(Icons.date_range)),
                        ],
                      )

                  ),
                  SizedBox(
                      height: 10
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(25,0,15,0),
                    margin: EdgeInsets.fromLTRB(15,3.5,15,3.5),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.blue),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            fromTime,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30
                            )
                        ),
                        IconButton(onPressed: _pickTime1, icon: Icon(Icons.lock_clock)),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 10
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(25,0,15,0),
                    margin: EdgeInsets.fromLTRB(15,3.5,15,3.5),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.blue),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            toTime,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30
                            )
                        ),
                        IconButton(onPressed: _pickTime2, icon: Icon(Icons.lock_clock)),
                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                            InkWell(
                            onTap: () async {
                              firestoreDBPatientList.doc(_auth.currentUser!.uid)
                                  .collection('patientAcceptedList')
                                  .add({
                                "patientName":args.patientName,
                                "email": args.patientEmail,
                                "phoneNo": args.patientPhoneNumber,
                                "patientUid": args.patientUid,
                                "doctorName": args.doctorName,
                                "doctorPost": args.doctorPost,
                                "doctorSpeciality": args.doctorSpeciality,
                                "doctorEducation": args.doctorEducation,
                                "date":date,
                                "fromTime":fromTime,
                                "toTime":toTime
                              });
                              firestoreDBPatientList.doc(args.patientUid)
                                  .collection('appointmentAcceptedDoctorList')
                                  .add({
                                "patientUid": args.patientUid,
                                "hospitalUid": _auth.currentUser!.uid,
                                "doctorName": args.doctorName,
                                "doctorPost": args.doctorPost,
                                "doctorSpeciality": args.doctorSpeciality,
                                "doctorEducation": args.doctorEducation,
                                "date":date,
                                "fromTime":fromTime,
                                "toTime":toTime
                              });

                              String id;
                               FirebaseFirestore.instance.collection("users")
                                  .doc(_auth.currentUser!.uid)
                                  .collection("patientRequestList")
                                   .where("email", isEqualTo: args.patientEmail)
                                   .where("doctorName", isEqualTo: args.doctorName)
                                   .where("patientName", isEqualTo: args.patientName)
                                   .where("uid", isEqualTo: args.patientUid)
                               .get()
                               .then((snapshot) {
                                   id = snapshot.docs[0].id;
                                   FirebaseFirestore.instance.collection("users")
                                       .doc(_auth.currentUser!.uid)
                                       .collection("patientRequestList").doc(id).delete();
                                   print(id);
                               });

                               String id2;
                               FirebaseFirestore.instance.collection("users")
                                  .doc(args.patientUid)
                                  .collection("appointmentRequestedDoctorList")
                                   .where("doctorName", isEqualTo: args.doctorName)
                                   .where("hospitalUid", isEqualTo: _auth.currentUser!.uid)
                               .get()
                               .then((snapshot) {
                                   id2 = snapshot.docs[0].id;
                                   FirebaseFirestore.instance.collection("users")
                                       .doc(args.patientUid)
                                       .collection("appointmentRequestedDoctorList").doc(id2).delete();
                                   print(id2);
                               });


                              //firestoreDBPatientList.doc(args.patientUid).collection('patientAcceptedList').add(patientRequest);
                              
                              //await firestoreDBPatientList.doc(patientListId).update({"patientName":"Patient 2"}).then((value) => print('updated'));
                            //await firestoreDBPatientList.doc(patientListId).delete().then((value) => print('deleted'));

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
                                      "Accept",
                                      style: TextStyle(
                                          fontSize: 26,
                                          color: Colors.white
                                      )
                                  ),
                                )
                            ),
                     //     );
                     //   }
                    ),
                      InkWell(
                        onTap: () async{
                          String id;
                          FirebaseFirestore.instance.collection("users")
                              .doc(_auth.currentUser!.uid)
                              .collection("patientRequestList")
                              .where("email", isEqualTo: args.patientEmail)
                              .where("doctorName", isEqualTo: args.doctorName)
                              .where("patientName", isEqualTo: args.patientName)
                              .where("uid", isEqualTo: args.patientUid)
                              .get()
                              .then((snapshot) {
                            id = snapshot.docs[0].id;
                            FirebaseFirestore.instance.collection("users")
                                .doc(_auth.currentUser!.uid)
                                .collection("patientRequestList").doc(id).delete();
                            print(id);
                          });

                          String id2;
                          FirebaseFirestore.instance.collection("users")
                              .doc(args.patientUid)
                              .collection("appointmentRequestedDoctorList")
                              .where("doctorName", isEqualTo: args.doctorName)
                              .where("hospitalUid", isEqualTo: _auth.currentUser!.uid)
                              .get()
                              .then((snapshot) {
                            id2 = snapshot.docs[0].id;
                            FirebaseFirestore.instance.collection("users")
                                .doc(args.patientUid)
                                .collection("appointmentRequestedDoctorList").doc(id2).delete();
                            print(id2);
                          });

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
                                "Reject",
                                style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white
                                ),
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ]
            )
        )
    );
  }
  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year-5),
      lastDate: DateTime(DateTime.now().year+5),
      initialDate: pickedDate,

    );

    if(date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }
  _pickTime1() async {
    TimeOfDay? t1 = await showTimePicker(
      context: context,
      initialTime: time1,
    );

    if(t1 != null) {
      setState(() {
        time1 = t1;
      });
    }
  } _pickTime2() async {
    TimeOfDay? t2 = await showTimePicker(
      context: context,
      initialTime: time2,
    );

    if(t2 != null) {
      setState(() {
        time2 = t2;
      });
    }
  }
}