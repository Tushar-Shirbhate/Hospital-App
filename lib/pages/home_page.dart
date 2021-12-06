// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_app/pages/hospital_detail_page.dart';
import 'package:hospital_app/utils/routes.dart';
import 'package:hospital_app/utils/screen_arguments_doctor_list.dart';
import 'package:hospital_app/widgets/drawer.dart';
//import 'package:tushar_h/pages/hospital_detail_page.dart';
//import 'package:tushar_h/utils/routes.dart';
//import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:hospital_app/widgets/drawer.dart';
//import 'package:tushar_h/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var firestoreDB = FirebaseFirestore.instance.collection("users").snapshots();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Hospital App")),
      body: StreamBuilder(
          stream: firestoreDB,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
            return ListView.builder(
                itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                itemBuilder: (BuildContext context, int index) {
                  // List doctorList = (snapshot.data! as QuerySnapshot).docs[index]["doctorList"];
                  //Map<String, dynamic>  doctorList =
                  if ((snapshot.data! as QuerySnapshot).docs[index]
                          ['profession'] ==
                      "Hospital") {
                    String hospitalEmail = (snapshot.data! as QuerySnapshot).docs[index]['email'];
                    String hospitalPhoneNo = (snapshot.data! as QuerySnapshot).docs[index]['phoneNo'];
                    String id =
                        (snapshot.data! as QuerySnapshot).docs[index]['uid'];
                    return SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, MyRoute.detailRoute,
                              arguments: ScreenArgumentsDoctorList(id, hospitalEmail, hospitalPhoneNo));
                        },
                        child: Card(
                            elevation: 5,
                            child: Container(
                                padding: EdgeInsets.all(10),
                                height: size.height / 6.8,
                                width: double.infinity,
                              //  child: Row(
                                //    mainAxisAlignment:
                                 //       MainAxisAlignment.spaceBetween,
                               //     children: [
                                    child:  Column(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "${(snapshot.data! as QuerySnapshot).docs[index]['name']}",
                                                style: TextStyle(
                                                    // color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "${(snapshot.data! as QuerySnapshot).docs[index]['address']}",
                                                style: TextStyle(
                                                    //color: Colors.grey,
                                                    fontSize: 18,
                                                    fontStyle:
                                                        FontStyle.italic)),
                                            // Text(
                                            //     "${(snapshot.data! as QuerySnapshot)
                                            //         .docs[index]['hospitalRating']}",
                                            //     style: TextStyle(
                                            //       color: Colors.deepOrange,
                                            //       fontSize: 16,
                                            //     ))
                                          ]),
                                   //   Icon(CupertinoIcons.heart),
                                   // ]
                         //   )
                        )),
                      ),
                      //  );
                    );
                  }
                  return Container();
                });
          }),
      drawer: MyDrawer(),
    );
  }
}
