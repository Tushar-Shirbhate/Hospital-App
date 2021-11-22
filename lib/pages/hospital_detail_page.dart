import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:tushar_h/pages/home_page.dart';

class HospitalDetailPage extends StatefulWidget{
  late final String name;


  @override
  State<HospitalDetailPage> createState() => _HospitalDetailPageState();
}

class _HospitalDetailPageState extends State<HospitalDetailPage> {
  final List <String> doctorName = <String>[
    "Doctor 1",
    "Doctor 2",
    "Doctor 3",
    "Doctor 4",
    "Doctor 5",
    "Doctor 6",
    "Doctor 7",
    "Doctor 8"
  ];

  final List <String> doctorPost = <String>[
    "Post 1",
    "Post 2",
    "Post 3",
    "Post 4",
    "Post 5",
    "Post 6",
    "Post 7",
    "Post 8",
  ];

  final List <String> doctorSpeciality = <String>[
   "Speciality 1",
   "Speciality 2",
   "Speciality 3",
   "Speciality 4",
   "Speciality 5",
   "Speciality 6",
   "Speciality 7",
   "Speciality 8",
  ];

  final List <String> doctorEducation = <String>[
   "Education 1",
   "Education 2",
   "Education 3",
   "Education 4",
   "Education 5",
   "Education 6",
   "Education 7",
   "Education 8",
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Hospital App")
        ),
        body:
          // Column(
        //   children: [
        //     Container(
        //         padding: EdgeInsets.all(15),
        //         child: Text(
        //             name,
        //             style: TextStyle(
        //                 fontSize: 30,
        //                 fontWeight: FontWeight.bold
        //             )
        //         )
        //     ),
          ListView.builder(
              itemCount: doctorName.length,
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                    child: Card(
                      elevation : 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                          height: 165,
                        padding: EdgeInsets.all(15),
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
                                        "${doctorName[index]}",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                                    Text(
                                        "${doctorPost[index]}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        )
                                    ),
                                    Text(
                                        "${doctorSpeciality[index]}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                    Text(
                                        "${doctorEducation[index]}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        )),
                                  ]
                                ),
                              ]
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              height: 37,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                                child: Center(
                                    child: Text(
                                        "Get Appointment",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: CupertinoColors.black
                                        ))))
                          ]
                        )
                      )
                    )
                );
              }
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(32,0,0,0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    child: Icon(Icons.video_call),
                    onPressed: () {

                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  child: Icon(Icons.messenger_rounded),
                  onPressed: () {

                  },
                ),
              ),
            ]
          ),
          //]
     //   ),

      );
  }
}