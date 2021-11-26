// ignore_for_file: annotate_overrides, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:hospital_app/utils/themes.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final icon = CupertinoIcons.moon_stars;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: null,
            icon: Icon(CupertinoIcons.settings),
          ),
          title: Text('Settings'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                      builder: (context) => IconButton(
                        icon: Icon(icon),
                        onPressed: () {
                          final theme = isDarkMode
                              ? MyThemes.lightTheme
                              : MyThemes.darkTheme;

                          final switcher = ThemeSwitcher.of(context)!;
                          switcher.changeTheme(theme: theme);
                        },
                        // groupValue: 1,
                        // onChanged: null,
                        // activeColor: Colors.deepPurple,
                        // toggleable: true,
                      ),
                    ),
                  ),
                ],
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
                      Icon(Icons.notifications),
                      Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text('ON/OFF'),
                    trailing: LiteRollingSwitch(
                      value: false,
                      colorOn: Colors.blueAccent,
                      colorOff: Colors.grey,
                      iconOn: Icons.notifications_active,
                      iconOff: Icons.notifications_off,
                      onChanged: (bool position) {
                        // ignore: unused_label
                        themeMode:
                        ThemeMode.dark;
                      },
                      // groupValue: 1,
                      // onChanged: null,
                      // activeColor: Colors.deepPurple,
                      // toggleable: true,
                    ),
                  ),
                ],
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
        ));
  }
}
