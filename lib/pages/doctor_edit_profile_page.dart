// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hospital_app/utils/doctor.dart';
import 'package:hospital_app/utils/user.dart';
import 'package:hospital_app/widgets/profile_widget.dart';
import 'package:hospital_app/widgets/text_field_widget.dart';
import 'package:hospital_app/widgets/doctor_preferences.dart';

class DoctorEditProfilePage extends StatefulWidget {
  const DoctorEditProfilePage({Key? key}) : super(key: key);

  @override
  State<DoctorEditProfilePage> createState() => _DoctorEditProfilePageState();
}

class _DoctorEditProfilePageState extends State<DoctorEditProfilePage> {
  Doctor doctor = DoctorPreferences.myDoctor;
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
            imagepath: doctor.imagepath,
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: 'Full Name',
            text: doctor.name,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: 'Email',
            text: doctor.email,
            onChanged: (email) {},
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: 'Speciality',
            text: doctor.speciality,
            onChanged: (speciality) {},
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
              label: 'Education',
              text: doctor.education,
              maxLines: 3,
              onChanged: (education) {}),
          const SizedBox(
            height: 24,
          ),
          TextFieldWidget(
            label: 'Speciality',
            text: doctor.description,
            maxLines: 5,
            onChanged: (address) {},
          )
        ],
      ),
    );
  }
}
