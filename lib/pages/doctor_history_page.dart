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
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(206, 147, 216, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color:  Color.fromRGBO(254, 23, 72, 1)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(100, 0,15,0),
            child: Text("History",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromRGBO(254, 23, 72, 1)),

            ),
          ),
          elevation: 0,
          backgroundColor: Color.fromRGBO(206, 147, 216, 1),
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
                                height: size.height / 2.8,
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
                                                    "Name: ${_map['patientName']}",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(09, 105, 105, 1),
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.bold,
                                                        fontStyle: FontStyle.italic
                                                    ),
                                                  ),
                                                  SizedBox(height:5),
                                                  Text(
                                                    "Email: ${_map['email']}",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(09, 105, 105, 1),
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.bold,
                                                        fontStyle: FontStyle.italic
                                                    ),
                                                  ),
                                                  SizedBox(height:5),
                                                  Text(
                                                    "Doctor: ${_map['doctorName']}",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(09, 105, 105, 1),
                                                        fontSize: 24,
                                                        fontWeight: FontWeight.bold,
                                                        fontStyle: FontStyle.italic
                                                    ),
                                                  ),
                                                  SizedBox(height:5),
                                                  Text(
                                                      "Date: ${_map['date']}",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(206, 123, 25, 1),
                                                          fontSize: 18,
                                                        fontStyle: FontStyle.italic
                                                      )
                                                  ),
                                                  SizedBox(height:5),
                                                  Text(
                                                      "Time: ${_map['fromTime']} - ${_map['toTime']}",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(206, 123, 25, 1),
                                                          fontSize: 18,
                                                          fontStyle: FontStyle.italic
                                                      )),

                                                ]
                                            ),
                                          ]
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
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
                                                      try{
                                                        if(x['reportFileUrl'] != null){
                                                          print("hi");
                                                          Navigator.push(
                                                              context, MaterialPageRoute(builder: (
                                                              context) =>
                                                              ReportView(x['reportFileUrl'])));
                                                        }

                                                      }
                                                      catch(e){
                                                        print("upload report");
                                                        Navigator.pushNamed(context, MyRoute.notReportRoute);
                                                      }
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
                                                                    color: CupertinoColors.white
                                                                ))))
                                                  );
                                                }
                                                //  }
                                                return Center(
                                                    child: SizedBox(height:40)
                                                );
                                              }
                                          ),
                                          InkWell(
                                            onTap: (){
                                              String id = snapshot
                                                  .data!.docs[index].id;
                                              _firestoreDBPatientAppointment
                                                  .doc(_auth.currentUser!.uid)
                                                  .collection('patientHistoryList')
                                                  .doc(id)
                                                  .delete();
                                              _firestoreDBPatientAppointment.doc(_auth.currentUser!.uid).collection("reportFileList")
                                                  .doc("${_map['date']}${_auth.currentUser!.displayName}${_map['doctorName']}")
                                                  .delete();
                                            },
                                            child: Container(
                                                width: 150,
                                                height: 37,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(254, 23, 72, 1),
                                                    borderRadius: BorderRadius.circular(20.0)
                                                ),
                                                child: Center(
                                                    child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: CupertinoColors.white
                                                        )))),
                                          )
                                        ],
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
