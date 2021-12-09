// ignore_for_file: annotate_overrides, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:hospital_app/utils/themes.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _switchValue = false;
  bool isDarkMode = false;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(206, 147, 216, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color:  Color.fromRGBO(254, 23, 72, 1)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(100, 0,15,0),
            child: Text("Settings",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromRGBO(254, 23, 72, 1)),

            ),
          ),
          elevation: 0,
          backgroundColor: Color.fromRGBO(206, 147, 216, 1),
        ),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Row(
                children: [
                  Icon(Icons.lock,
                    color: Color.fromRGBO(254, 23, 72, 1),
                  ),
                  Text(
                    'Change Password',
                    style: TextStyle(
                      color: Color.fromRGBO(254, 23, 72, 1),
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        hintText: 'Enter new password',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Enter new password again',
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 15,
                indent: 15,
                endIndent: 15,
                thickness: 2,
                color: Color.fromRGBO(254, 23, 72, 1),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.dark_mode,
                        color: Color.fromRGBO(254, 23, 72, 1),
                      ),
                      Text(
                        'Dark Theme',
                        style: TextStyle(
                          color: Color.fromRGBO(254, 23, 72, 1),
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text('ON/OFF'),
                    trailing: ThemeSwitcher(
                      builder: (context) => Switch(
                        value: _switchValue,
                        onChanged: (bool newValue) {
                          setState(() {
                            _switchValue = newValue;
                            isDarkMode = newValue;
                            var theme = isDarkMode
                                ? MyThemes.darkTheme
                                : MyThemes.lightTheme;

                            final switcher = ThemeSwitcher.of(context)!;
                            switcher.changeTheme(theme: theme);
                          });
                        },
                      ),
                    ),
                  ),
                  Divider(
                    height: 15,
                    indent: 15,
                    endIndent: 15,
                    thickness: 2,
                    color: Color.fromRGBO(254, 23, 72, 1),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.contact_support,
                            color: Color.fromRGBO(254, 23, 72, 1),
                          ),
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              color: Color.fromRGBO(254, 23, 72, 1),
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ])));
  }
}
