// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/pages/edit_profilePage.dart';
import 'package:hospital_app/utils/user.dart';
import 'package:hospital_app/widgets/profile_widget.dart';
import 'package:hospital_app/widgets/user_preferences.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: null, icon: Icon(CupertinoIcons.profile_circled)),
        title: Text('Profile'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagepath: user.imagepath,
            onClicked: () async {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            },
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 48),
          buildAddress(user),
        ],
      ),
    );
  }

  buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.blue),
          )
        ],
      );

  buildAddress(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              user.address,
              style: TextStyle(fontSize: 16, height: 1.4),
            )
          ],
        ),
      );
}
