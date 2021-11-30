import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/screen_argument_appointment_list.dart';
import 'package:hospital_app/utils/screen_arguments_doctor_list.dart';

class HospitalDetailPage extends StatefulWidget {
  late final String name;

  @override
  State<HospitalDetailPage> createState() => _HospitalDetailPageState();
}

class _HospitalDetailPageState extends State<HospitalDetailPage> {
  final CollectionReference _firestoreDBDoctorList =
      FirebaseFirestore.instance.collection("users");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool getAppointment = false;

  @override
  Widget build(BuildContext context) {
    final argsDL =
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsDoctorList;
    String id = argsDL.id;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Hospital App")),
      body: StreamBuilder(
          stream: _firestoreDBDoctorList
              .doc(id)
              .collection("doctorList")
              .snapshots(),
          builder: (BuildContext context, snapshots) {
            if (!snapshots.hasData)
              return Center(child: CircularProgressIndicator());
            return ListView.builder(
                itemCount: (snapshots.data! as QuerySnapshot).docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> map = (snapshots.data! as QuerySnapshot)
                      .docs[index]
                      .data() as Map<String, dynamic>;

                  return SingleChildScrollView(
                      child: Card(
                          elevation: 5,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0)),
                              height: 200,
                              padding: EdgeInsets.all(15),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      // Image.asset(
                                      //   "assets/images/user.png",
                                      // ),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              map['doctorName'],
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(map['doctorPost'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                )),
                                            Text(map['doctorSpeciality'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                )),
                                            Text(map['doctorEducation'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                )),
                                          ]),
                                    ]),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: Text("Add Doctor Detail"),
                                            content: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 10),
                                                  Text(
                                                      "Do you want to send request for appointment to ${map['doctorName']}?",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                onPressed: () async {
                                                  Map<String, dynamic>
                                                      doctorList = {
                                                    "doctorName":
                                                        map['doctorName'],
                                                    "doctorPost":
                                                        map['doctorPost'],
                                                    "doctorSpeciality":
                                                        map['doctorSpeciality'],
                                                    "doctorEducation":
                                                        map['doctorEducation'],
                                                    "hospitalUid": id
                                                  };
                                                  _firestoreDBDoctorList
                                                      .doc(_auth
                                                          .currentUser!.uid)
                                                      .collection(
                                                          'appointmentRequestedDoctorList')
                                                      .add(doctorList);

                                                  var _firestore =
                                                      FirebaseFirestore
                                                          .instance
                                                          .collection("users")
                                                          .doc(_auth
                                                              .currentUser!
                                                              .uid);
                                                  DocumentSnapshot snapshot =
                                                      await _firestore.get();
                                                  FirebaseFirestore.instance
                                                      .collection("users")
                                                      .doc(id)
                                                      .collection(
                                                          'patientRequestList')
                                                      .add({
                                                    'patientName':
                                                        snapshot['name'],
                                                    'phoneNo':
                                                        snapshot['phoneNo'],
                                                    'email': snapshot['email'],
                                                    'uid':
                                                        _auth.currentUser!.uid,
                                                    'doctorName':
                                                        map['doctorName'],
                                                    "doctorPost":
                                                        map['doctorPost'],
                                                    "doctorSpeciality":
                                                        map['doctorSpeciality'],
                                                    "doctorEducation":
                                                        map['doctorEducation'],
                                                  });

                                                  Navigator.pushNamed(
                                                      context,
                                                      MyRoute
                                                          .appointmentListRoute);
                                                },
                                                child: Text("Done"),
                                              ),
                                              SizedBox(width: 120),
                                              FlatButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Text("Cancel"),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Container(
                                          width: double.infinity,
                                          height: 37,
                                          decoration: BoxDecoration(
                                              color: Colors.greenAccent,
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: Center(
                                              child: Text("Get Appointment",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: CupertinoColors
                                                          .black)))),
                                    )
                                  ]))));
                });
          }),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(32, 0, 0, 0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              child: Icon(Icons.call),
              onPressed: () {},
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            child: Icon(Icons.messenger_rounded),
            onPressed: () {},
          ),
        ),
      ]),
      //]
      //   ),
    );
  }
}
