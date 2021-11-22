import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorProfilePage extends StatefulWidget{
  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         leading: Icon(CupertinoIcons.profile_circled),
           title: Text(
               "Profile"
           )
       ),
       body: SingleChildScrollView(
         padding: EdgeInsets.all(15),
         child: Column(
//   mainAxisAlignment: MainAxisAlignment.start,
//   crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               padding: EdgeInsets.fromLTRB(15,0,0,0),
               alignment: Alignment.centerLeft,
               child: Text(
                   "Doctor Name",
                   style: TextStyle(
                       fontSize: 30,
                       fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic
                   )
               ),
             ),
             Container(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     IconButton(
                         onPressed: (){

                         },
                         icon: Icon(Icons.all_inclusive_sharp)),
                     Text(
                         "Doctor Post",
                         style: TextStyle(
                             fontSize: 24,
                             fontWeight: FontWeight.bold,
                             fontStyle: FontStyle.italic
                         )
                     ),
                   ],
                 )
             ),
             Container(
                 child: Row(
                   children: [
                     IconButton(
                         onPressed: (){

                         },
                         icon: Icon(Icons.health_and_safety)
                     ),
                     Text(
                         "Doctor Speciality",
                         style: TextStyle(
                             fontSize: 24,
                             fontWeight: FontWeight.bold,
                             fontStyle: FontStyle.italic
                         )
                     ),
                   ],
                 )
             ),Container(
                 child: Row(
                   children: [
                     IconButton(
                         onPressed: (){

                         },
                         icon: Icon(Icons.school)
                     ),
                     Text(
                         "Doctor Education",
                         style: TextStyle(
                             fontSize: 24,
                             fontWeight: FontWeight.bold,
                             fontStyle: FontStyle.italic
                         )
                     ),
                   ],
                 )
             ),
           ],
         ),
       ),
     );
  }
}