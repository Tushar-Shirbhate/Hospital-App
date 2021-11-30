// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
//import 'package:tushar_h/utils/routes.dart';

class AppHomePage extends StatefulWidget{
  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
          appBar: AppBar(
            title: Text(
              "Hospital App"
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(15),
                child: Align(
                    alignment: Alignment.center,
                    child: Column(
                        children: [
                          Container(
                              height: 300,
                            child:Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                          width: 5, color: Colors.lightBlueAccent),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: 5.0,
                                          blurRadius: 15.0,
                                          offset: Offset(8, 9),
                                        )
                                      ]),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                      'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?size=338&ext=jpg',
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ),
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(15.0),
                          //   child: Image.network(
                          //     'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?size=338&ext=jpg',
                          //   ),
                          // ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, MyRoute.hospitalLoginRoute);
                            },
                            child: Container(
                                width: double.infinity,
                                height: 60,
                                padding: EdgeInsets.fromLTRB(25,0,25,0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 5.0,
                                      blurRadius: 15.0,
                                      offset: Offset(8, 9),
                                    )
                                  ],
                                  color: Colors.red,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      CupertinoIcons.building_2_fill
                                    ),
                                    Text(
                                          "Hospital",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30
                                          ),
                                        ),
                                    Icon(
                                        Icons.arrow_forward_ios
                                    )
                                  ],
                                )
                            ),
                          ),
                          SizedBox(
                              height: 10
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, MyRoute.loginRoute);
                            },
                            child: Container(
                                width: double.infinity,
                                height: 60,
                              padding: EdgeInsets.fromLTRB(25,0,25,0),
                              decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35.0),
                                    color: Colors.purple,
                                    boxShadow:[
                                      BoxShadow(
                                        color: Colors.black,
                                        spreadRadius: 5.0,
                                        blurRadius: 15.0,
                                        offset: Offset(8, 9),
                                      )
                                    ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                        Icons.supervised_user_circle
                                    ),
                                    Text(
                                          "User",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30
                                          )
                                      ),
                                    Icon(
                                        Icons.arrow_forward_ios
                                    )
                                  ],
                                ),
                            ),
                          )
                        ]
                    )
                )
            ),
          )
      );
  }
}