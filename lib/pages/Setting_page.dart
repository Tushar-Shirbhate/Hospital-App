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
        appBar: AppBar(
          leading: IconButton(
            onPressed: null,
            icon: Icon(CupertinoIcons.settings),
          ),
          title: Text('Settings'),
        ),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Row(
                children: [
                  Icon(Icons.lock),
                  Text(
                    'Change Password',
                    style: TextStyle(
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
                color: Colors.blue,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.dark_mode),
                      Text(
                        'Dark Theme',
                        style: TextStyle(
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
                    color: Colors.blue,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.contact_support),
                          Text(
                            'Contact Us',
                            style: TextStyle(
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
