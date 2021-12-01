// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hospital_app/utils/user.dart';
import 'package:hospital_app/widgets/profile_widget.dart';
import 'package:hospital_app/widgets/text_field_widget.dart';
import 'package:hospital_app/widgets/user_preferences.dart';
import 'package:hospital_app/utils/routes.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagepath: user.imagepath,
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: 'Full Name',
            text: user.name,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: 'Email',
            text: user.email,
            onChanged: (email) {},
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: 'Address',
            text: user.address,
            maxLines: 5,
            onChanged: (address) {},
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, MyRoute.profileRoute);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
