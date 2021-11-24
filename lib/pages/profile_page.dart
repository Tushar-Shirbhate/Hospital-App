// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final imageUrl =
      "https://images.ctfassets.net/6rsj5ae0g75g/6nf3rNaaVaUqYcoAcciSeC/a43b6f3da7352837e0db54dc86339420/Last_few_hours_more_for_FlutterLive._Join_us_from_anywhere_around_the_world._Flutter_Excitement_flutterio.jpg?w=450&fl=progressive&q=100";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: null, icon: Icon(CupertinoIcons.profile_circled)),
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              Image(
                image: NetworkImage(imageUrl),
                alignment: Alignment.center,
                width: 200,
                height: 200,
              )
            ]),
            Divider(
              height: 15,
              indent: 15,
              endIndent: 15,
              thickness: 2,
              color: Colors.blue,
            ),
            Row(
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  )
                ])),
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
                    Text(
                      'Phone no.',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '1234-5678-9',
                        ),
                      )
                    ]))
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
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Address',
                        ),
                      )
                    ]))
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
                    Text(
                      'E-mail ID',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'test123@gmail.com',
                        ),
                      )
                    ]))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
