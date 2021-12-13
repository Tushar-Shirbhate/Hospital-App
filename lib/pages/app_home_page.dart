// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/routes.dart';
//import 'package:tushar_h/utils/routes.dart';

class AppHomePage extends StatefulWidget {
  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(206, 147, 216, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(95, 0, 15, 0),
              child: Text(
                "",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color.fromRGBO(254, 23, 72, 1)),
              ),
            ),
            elevation: 0,
            backgroundColor: Color.fromRGBO(206, 147, 216, 1),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Card(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 70, 12, 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color.fromRGBO(254, 23, 72, 1),
                ),
                color: Color.fromRGBO(250, 228, 252, 1),
              ),
              height: size.height / 1.3,
              width: double.infinity,
              child: Container(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Column(children: [
                    Container(
                        height: size.height / 2.8,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(206, 147, 216, 1),
                                      spreadRadius: 5.0,
                                      blurRadius: 15.0,
                                      offset: Offset(8, 9),
                                    )
                                  ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  "Assets/images/app_icon.png",
                                  fit: BoxFit.fitHeight,
                                  height: 200,
                                ),
                              ),
                            ),
                          ),
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MyRoute.hospitalLoginRoute);
                      },
                      child: Card(
                        // margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        child: Container(
                            width: double.infinity,
                            height: 60,
                            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(206, 147, 216, 1),
                                  // color: Colors.black,
                                  spreadRadius: 5.0,
                                  blurRadius: 15.0,
                                  offset: Offset(8, 9),
                                )
                              ],
                              color: Color.fromRGBO(254, 23, 72, 1),
                              // color: Colors.red,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "Assets/images/hospital.png",
                                    fit: BoxFit.fitHeight,
                                    height: 60,
                                  ),
                                ),
                                Text(
                                  "  Hospital",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoute.loginRoute);
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            color: Color.fromRGBO(254, 23, 72, 1),
                            // color: Colors.purple,
                            //   boxShadow:[
                            //     BoxShadow(
                            //       color: Colors.black,
                            //       spreadRadius: 5.0,
                            //       blurRadius: 15.0,
                            //       offset: Offset(8, 9),
                            //     )
                            //   ]
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(206, 147, 216, 1),
                                // color: Colors.black,
                                spreadRadius: 5.0,
                                blurRadius: 15.0,
                                offset: Offset(8, 9),
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "Assets/images/crowd.png",
                                  fit: BoxFit.fitHeight,
                                  height: 60,
                                ),
                              ),
                              Text("Patient",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30)),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ])),
            ),
          ),
        ));
  }
}
