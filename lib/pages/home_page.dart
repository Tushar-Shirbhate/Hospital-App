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
  var firestoreDB = FirebaseFirestore.instance.collection("hospitalList").snapshots();

  //late SearchBar searchBar;

  // AppBar buildAppBar(BuildContext context) {
  //   return AppBar(
  //       backgroundColor: Colors.blue,
  //       title: Text("Hospital App"));
  //    //  actions: [searchBar.getSearchAction(context)]);
  // }

  // _HomePageState() {
  //   searchBar = SearchBar(
  //     inBar: false,
  //     setState: setState,
  //     onSubmitted: print,
  //     buildDefaultAppBar: buildAppBar,
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
       title: Text("Hospital App")
     ),
   //  appBar: searchBar.build(context),
      body: StreamBuilder(
              stream: firestoreDB,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return ListView.builder(
                    itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                    itemBuilder: (BuildContext context, int index)
                {
                  return SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Card(
                        elevation: 5,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            height: 100,
                            width: double.infinity,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context, MyRoute.detailRoute,);
                                          },
                                          child: Text(
                                              "${(snapshot.data! as QuerySnapshot)
                                                  .docs[index]['hospitalName']}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Text(
                                            "${(snapshot.data! as QuerySnapshot)
                                                .docs[index]['hospitalAddress']}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18,
                                                fontStyle: FontStyle.italic)),
                                        Text(
                                            "${(snapshot.data! as QuerySnapshot)
                                                .docs[index]['hospitalRating']}",
                                            style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 16,
                                            ))
                                      ]),
                                  Icon(CupertinoIcons.heart),
                                ]))),
                    //  );
                  );
                });
              }
      ),
      drawer: MyDrawer(),
    );
  }
}
