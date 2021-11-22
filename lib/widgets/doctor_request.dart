import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/screen_arguments.dart';

class DoctorRequest extends StatefulWidget{
  @override
  State<DoctorRequest> createState() => _DoctorRequestState();
}

class _DoctorRequestState extends State<DoctorRequest> {
  var firestoreDBPatientList = FirebaseFirestore.instance.collection("patientList").snapshots();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.request_page_outlined),
            title: Text(
                "Request"
            )
        ),
        body: StreamBuilder(
          stream: firestoreDBPatientList,
          builder: (context, snapshot){
            if(!snapshot.hasData) return CircularProgressIndicator();
            return  ListView.builder(
                itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(15,15,15,0.2),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MyRoute.doctorRequestDetailRoute,
                            arguments: ScreenArguments(
                                (snapshot.data! as QuerySnapshot).docs[index]['patientName'],
                                (snapshot.data! as QuerySnapshot).docs[index].id
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
                                        (snapshot.data! as QuerySnapshot).docs[index]['patientName'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)
                                ),
                                Text(
                                    "--",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic)
                                ),Text(
                                "--",
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