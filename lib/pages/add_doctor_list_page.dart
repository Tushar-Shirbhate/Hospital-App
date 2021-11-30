import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final CollectionReference _firestoreDBDoctorList = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    // final argsDL = ModalRoute.of(context)!.settings.arguments as ScreenArgumentsDoctorList;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Doctor List")
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestoreDBDoctorList.doc(_auth.currentUser!.uid).collection("doctorList").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots){
          if(snapshots.hasData){
            return ListView.builder(
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> map = snapshots.data!.docs[index]
                      .data() as Map<String, dynamic>;
                  return SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                            elevation : 5,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                height: 140,
                                padding: EdgeInsets.all(15),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            Text(
                                                map['doctorPost'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                )
                                            ),
                                            Text(
                                                map['doctorSpeciality'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                )),
                                            Text(
                                                map['doctorEducation'],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                )),
                                          ]
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            String id = snapshots.data!.docs[index].id;
                                            _firestoreDBDoctorList.doc(_auth.currentUser!.uid).collection('doctorList').doc(id).delete();
                                          },
                                          icon: Icon(Icons.delete)
                                      )
                                    ]
                                ),
                                ]
                            )
                        )
                    ),
                  )
                  );
                }
            );
          }
          return Center(child: CircularProgressIndicator());
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("Add Doctor Detail"),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height: 10
                    ),
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
                       labelText: "Doctor Name"
                    )
                ),
                  SizedBox(
                      height: 20
                  ), TextField(
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
                      labelText: "Enter Post"
                    )
                ),
                  SizedBox(
                      height: 20
                  ), TextField(
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
                      labelText: "Enter Speciality"
                    )
                ),
                  SizedBox(
                      height: 20
                  ), TextField(
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
                      labelText: "Enter Education"
                    )
                ),
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
                    _firestoreDBDoctorList.doc(_auth.currentUser!.uid).collection('doctorList').add(doctorList);

                    _doctorName.clear();
                    _doctorPost.clear();
                    _doctorSpeciality.clear();
                    _doctorEducation.clear();

                    Navigator.of(ctx).pop();
                  },
                  child: Text("Done"),
                ),
                SizedBox(width:90),
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
      //]
      //   ),
    );
  }
}
