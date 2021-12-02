// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/storage_service.dart';
import 'package:hospital_app/utils/user.dart';
import 'package:hospital_app/widgets/profile_widget.dart';
import 'package:hospital_app/widgets/text_field_widget.dart';
import 'package:hospital_app/widgets/user_preferences.dart';
import 'package:hospital_app/utils/routes.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final Map<String, dynamic> userMap;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestoreDBUserProf = FirebaseFirestore.instance;
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    //final user = UserPreferences.myUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Builder(builder: (context) {
        return StreamBuilder<DocumentSnapshot>(
            stream: _firestoreDBUserProf
                .collection("users")
                .doc(_auth.currentUser!.uid)
                .snapshots(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 32),
                physics: BouncingScrollPhysics(),
                children: [
                  FutureBuilder(
                      future: storage.downloadURL('Profile_pic.jpg'),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          return ProfileWidget(
                            imagepath: Image.network(
                              snapshot.data!,
                            ),
                            isEdit: true,
                            onClicked: () async {},
                          );
                        }
                        if (snapshot.connectionState ==
                                ConnectionState.waiting ||
                            !snapshot.hasData) {
                          return CircularProgressIndicator();
                        }
                        return CircularProgressIndicator();
                      }),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldWidget(
                    label: 'Full Name',
                    text: snapshot.data!['name'],
                    onChanged: (name) {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldWidget(
                    label: 'Email',
                    text: snapshot.data!['email'],
                    onChanged: (email) {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldWidget(
                    label: 'Phone No.',
                    text: snapshot.data!['phoneNo'],
                    onChanged: (address) {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldWidget(
                    label: 'Address',
                    text: snapshot.data!['address'],
                    maxLines: 5,
                    onChanged: (address) {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            final results = await FilePicker.platform.pickFiles(
                                allowMultiple: false,
                                type: FileType.custom,
                                allowedExtensions: ['png', 'jpg']);

                            if (results == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('No file is picked')));
                              return null;
                            }

                            final path = results.files.single.path!;
                            final name = results.files.single.name;

                            storage
                                .uploadFile(path, name)
                                .then((value) => print('Done'));
                          },
                          child: Text(
                            'Upload',
                            style: TextStyle(
                              fontSize: 16,
                              backgroundColor: Colors.blue,
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoute.profileRoute);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 16,
                              backgroundColor: Colors.blue,
                            ),
                          )),
                    ],
                  )
                ],
              );
            });
      }),
    );
  }
}
