import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentRequested extends StatefulWidget {
  const AppointmentRequested({Key? key}) : super(key: key);

  @override
  _AppointmentRequestedState createState() => _AppointmentRequestedState();
}

class _AppointmentRequestedState extends State<AppointmentRequested> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _firestoreDBApDoctorList = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(206, 147, 216, 1),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestoreDBApDoctorList.doc(_auth.currentUser!.uid).collection("appointmentRequestedDoctorList").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
            if(!snapshots.hasData) return Center(child: CircularProgressIndicator());
            return ListView.builder(
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> map =snapshots.data!.docs[index]
                      .data() as Map<String, dynamic>;
                  return SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                              padding: EdgeInsets.all(12),
                              height: size.height / 3.7,
                              width: double.infinity,
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
                                                  map['doctorName'],
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(09, 105, 105, 1),
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                Text(
                                                    map['doctorPost'],
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(206, 123, 25, 1),
                                                      fontSize: 16,
                                                    )
                                                ),
                                                Text(
                                                    map['doctorSpeciality'],
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(206, 123, 25, 1),
                                                      fontSize: 16,
                                                    )),
                                                Text(
                                                    map['doctorEducation'],
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(206, 123, 25, 1),
                                                      fontSize: 16,
                                                    )),
                                              ]
                                          ),
                                        ]
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: Text("Cancel Request"),
                                            content: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                      height: 10
                                                  ),
                                                  Text(
                                                      "Do you want to Cancel Request appointment to ${map['doctorName']}?",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                onPressed: () async {
                                                  String id ;
                                                  FirebaseFirestore.instance.collection("users")
                                                      .doc(map['hospitalUid'])
                                                      .collection("patientRequestList")
                                                      .where("email", isEqualTo: map['email'])
                                                      .where("doctorName", isEqualTo: map['doctorName'])
                                                      .where("patientName", isEqualTo: map['patientName'])
                                                      .get()
                                                      .then((snapshot) {
                                                    id = snapshot.docs[0].id;
                                                    FirebaseFirestore.instance.collection("users")
                                                        .doc(map['hospitalUid'])
                                                        .collection("patientRequestList").doc(id).delete();
                                                    print(id);
                                                  });

                                                  String id2;
                                                  FirebaseFirestore.instance.collection("users")
                                                      .doc(_auth.currentUser!.uid)
                                                      .collection("appointmentRequestedDoctorList")
                                                      .where("doctorName", isEqualTo:   map['doctorName'])
                                                      .where("hospitalUid", isEqualTo:   map['hospitalUid'],)
                                                      .get()
                                                      .then((snapshot) {
                                                    id2 = snapshot.docs[0].id;
                                                    FirebaseFirestore.instance.collection("users")
                                                        .doc(_auth.currentUser!.uid)
                                                        .collection("appointmentRequestedDoctorList").doc(id2).delete();
                                                    print(id2);
                                                  });
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Text("Done"),
                                              ),
                                              SizedBox(width:120),
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
                                      child:Container(
                                          margin: EdgeInsets.fromLTRB(50, 5, 50, 5),
                                          width: double.infinity,
                                          height: 37,
                                          decoration: BoxDecoration(
                                              color: Colors.black45,
                                              borderRadius:
                                              BorderRadius.circular(20.0)),
                                          child: Center(
                                              child: Text("Pending...",
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      color: CupertinoColors
                                                          .white)))),
                                    )
                                  ]
                              )
                          )
                      )
                  );
                }
            );
          }
      ),
    );
  }
}
