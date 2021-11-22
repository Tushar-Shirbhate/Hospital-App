import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorEditProfilePage extends StatefulWidget{
  @override
  State<DoctorEditProfilePage> createState() => _DoctorEditProfilePageState();
}

class _DoctorEditProfilePageState extends State<DoctorEditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.edit),
          title: Text(
              "Edit Profile"
          )
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),
                  labelText: "Edit Name",
                  hintText: "Enter New Name"
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                        color: Colors.blue
                    )
                ),
                labelText: "Edit Post",
                hintText: "Enter New Post",
              ),
            ),SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),
                  labelText: "Edit Speciality",
                  hintText: "Enter New Speciality"
              ),
            ),SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),
                  labelText: "Edit Education",
                  hintText: "Enter New Education"
              ),
            ),SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),
                  labelText: "Edit Hospital Name",
                  hintText: "Enter New Hospital Name"
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 125,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.greenAccent,
                    ),
                    child: Center(
                      child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.white
                          )
                      ),
                    )
                ),
                Container(
                    width: 125,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.redAccent,
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white
                        ),
                      ),
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}