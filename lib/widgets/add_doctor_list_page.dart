import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/HospitalAuthentication/Hospital_Methods.dart';

class AddDoctorListPage extends StatefulWidget {
  const AddDoctorListPage({Key? key}) : super(key: key);

  @override
  _AddDoctorListPageState createState() => _AddDoctorListPageState();
}

class _AddDoctorListPageState extends State<AddDoctorListPage> {
  final TextEditingController _doctorName = TextEditingController();
  final TextEditingController _doctorPost = TextEditingController();
  final TextEditingController _doctorSpeciality = TextEditingController();
  final TextEditingController _doctorEducation = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _firestoreDBDoctorList =
      FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    // final argsDL = ModalRoute.of(context)!.settings.arguments as ScreenArgumentsDoctorList;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(206, 147, 216, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(110, 0,15,0),
          child: Text("Doctors List",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color.fromRGBO(254, 23, 72, 1)),

          ),
        ),
          backgroundColor: Color.fromRGBO(206, 147, 216, 1),
        actions: [
          Container(
            child: IconButton(
              color: Color.fromRGBO(254, 23, 72, 1),
              icon: Icon(Icons.add, size: 25,),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Add Doctor Detail"),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          TextField(
                              controller: _doctorName,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Enter Doctor Name",
                                  labelText: "Doctor Name")),
                          SizedBox(height: 20),
                          TextField(
                              controller: _doctorPost,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.watch_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Post",
                                  labelText: "Enter Post")),
                          SizedBox(height: 20),
                          TextField(
                              controller: _doctorSpeciality,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.all_inclusive_sharp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Speciality",
                                  labelText: "Enter Speciality")),
                          SizedBox(height: 20),
                          TextField(
                              controller: _doctorEducation,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.school),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  hintText: "Education",
                                  labelText: "Enter Education")),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          Map<String, dynamic> doctorList = {
                            "doctorName": _doctorName.text,
                            "doctorPost": _doctorPost.text,
                            "doctorSpeciality": _doctorSpeciality.text,
                            "doctorEducation": _doctorEducation.text,
                          };
                          _firestoreDBDoctorList
                              .doc(_auth.currentUser!.uid)
                              .collection('doctorList')
                              .add(doctorList);

                          _doctorName.clear();
                          _doctorPost.clear();
                          _doctorSpeciality.clear();
                          _doctorEducation.clear();

                          Navigator.of(ctx).pop();
                        },
                        child: Text("Done"),
                      ),
                      SizedBox(width: 90),
                      FlatButton(
                        onPressed: () {
                          _doctorName.clear();
                          _doctorPost.clear();
                          _doctorSpeciality.clear();
                          _doctorEducation.clear();
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: IconButton(
                onPressed: (){
                  hospitalLogOut(context);
                },
                icon: Icon(Icons.logout, color: Color.fromRGBO(254, 23, 72, 1),)
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestoreDBDoctorList
              .doc(_auth.currentUser!.uid)
              .collection("doctorList")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
            if (snapshots.hasData) {
              return ListView.builder(
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> map = snapshots.data!.docs[index]
                        .data() as Map<String, dynamic>;
                    return SingleChildScrollView(
                        child: Padding(
                      padding:  EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                            height: size.height / 4.9,
                            width: double.infinity,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                                      color: Color.fromRGBO(09, 105, 105, 1),
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(map['doctorPost'],
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(206, 123, 25, 1),
                                                      fontSize: 16,
                                                    )),
                                                Text(map['doctorSpeciality'],
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(206, 123, 25, 1),
                                                      fontSize: 16,
                                                    )),
                                                Text(map['doctorEducation'],
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(206, 123, 25, 1),
                                                      fontSize: 16,
                                                    )),
                                              ]),
                                          IconButton(
                                              onPressed: () {
                                                String id = snapshots
                                                    .data!.docs[index].id;
                                                _firestoreDBDoctorList
                                                    .doc(_auth.currentUser!.uid)
                                                    .collection('doctorList')
                                                    .doc(id)
                                                    .delete();
                                              },
                                              icon: Icon(Icons.delete, color: Color.fromRGBO(254, 23, 72, 1),))
                                        ]),
                                  ]))),
                    ));
                  });
            }
            return Center(child: CircularProgressIndicator());
          }),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color.fromRGBO(254, 23, 72, 1),
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (ctx) => AlertDialog(
      //         title: Text("Add Doctor Detail"),
      //         content: SingleChildScrollView(
      //           child: Column(
      //             children: [
      //               SizedBox(height: 10),
      //               TextField(
      //                   controller: _doctorName,
      //                   autofocus: false,
      //                   keyboardType: TextInputType.text,
      //                   textInputAction: TextInputAction.next,
      //                   decoration: InputDecoration(
      //                       prefixIcon: Icon(Icons.person),
      //                       border: OutlineInputBorder(
      //                         borderRadius: BorderRadius.circular(10),
      //                       ),
      //                       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      //                       hintText: "Enter Doctor Name",
      //                       labelText: "Doctor Name")),
      //               SizedBox(height: 20),
      //               TextField(
      //                   controller: _doctorPost,
      //                   autofocus: false,
      //                   keyboardType: TextInputType.text,
      //                   textInputAction: TextInputAction.next,
      //                   decoration: InputDecoration(
      //                       prefixIcon: Icon(Icons.watch_outlined),
      //                       border: OutlineInputBorder(
      //                         borderRadius: BorderRadius.circular(10),
      //                       ),
      //                       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      //                       hintText: "Post",
      //                       labelText: "Enter Post")),
      //               SizedBox(height: 20),
      //               TextField(
      //                   controller: _doctorSpeciality,
      //                   autofocus: false,
      //                   keyboardType: TextInputType.text,
      //                   textInputAction: TextInputAction.next,
      //                   decoration: InputDecoration(
      //                       prefixIcon: Icon(Icons.all_inclusive_sharp),
      //                       border: OutlineInputBorder(
      //                         borderRadius: BorderRadius.circular(10),
      //                       ),
      //                       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      //                       hintText: "Speciality",
      //                       labelText: "Enter Speciality")),
      //               SizedBox(height: 20),
      //               TextField(
      //                   controller: _doctorEducation,
      //                   autofocus: false,
      //                   keyboardType: TextInputType.text,
      //                   textInputAction: TextInputAction.done,
      //                   decoration: InputDecoration(
      //                       prefixIcon: Icon(Icons.school),
      //                       border: OutlineInputBorder(
      //                         borderRadius: BorderRadius.circular(10),
      //                       ),
      //                       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      //                       hintText: "Education",
      //                       labelText: "Enter Education")),
      //             ],
      //           ),
      //         ),
      //         actions: <Widget>[
      //           FlatButton(
      //             onPressed: () async {
      //               Map<String, dynamic> doctorList = {
      //                 "doctorName": _doctorName.text,
      //                 "doctorPost": _doctorPost.text,
      //                 "doctorSpeciality": _doctorSpeciality.text,
      //                 "doctorEducation": _doctorEducation.text,
      //               };
      //               _firestoreDBDoctorList
      //                   .doc(_auth.currentUser!.uid)
      //                   .collection('doctorList')
      //                   .add(doctorList);
      //
      //               _doctorName.clear();
      //               _doctorPost.clear();
      //               _doctorSpeciality.clear();
      //               _doctorEducation.clear();
      //
      //               Navigator.of(ctx).pop();
      //             },
      //             child: Text("Done"),
      //           ),
      //           SizedBox(width: 90),
      //           FlatButton(
      //             onPressed: () {
      //               _doctorName.clear();
      //               _doctorPost.clear();
      //               _doctorSpeciality.clear();
      //               _doctorEducation.clear();
      //               Navigator.of(ctx).pop();
      //             },
      //             child: Text("Cancel"),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
      //]
      //   ),
    );
  }
}
