import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarredPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<String> hospitalName = <String>[
      'Hospital 1',
      'Hospital 2',
      'Hospital 3',
      'Hospital 4',
      'Hospital 5',
      'Hospital 6',
      'Hospital 7',
      'Hospital 8',
      'Hospital 1',
      'Hospital 2',
      'Hospital 3',
      'Hospital 4',
      'Hospital 5',
      'Hospital 6',
      'Hospital 7',
      'Hospital 8'
    ];
    final List<String> hospitalAddress = <String>[
      'Address 1',
      'Address 2',
      'Address 3',
      'Address 4',
      'Address 5',
      'Address 6',
      'Address 7',
      'Address 8',
      'Address 1',
      'Address 2',
      'Address 3',
      'Address 4',
      'Address 5',
      'Address 6',
      'Address 7',
      'Address 8'
    ];
    final List<num> hospitalRating = <num>[
      5.0,
      4.9,
      4.8,
      4.7,
      4.6,
      4.5,
      4.4,
      4.3,
      4.2,
      4.1,
      4.0,
      3.9,
      3.8,
      3.7,
      3.6,
      3.5
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Starred'),
      ),
      body: ListView.builder(
          itemCount: hospitalName.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${hospitalName[index]}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text("${hospitalAddress[index]}",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic)),
                              Text("${hospitalRating[index]}",
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16,
                                  ))
                            ]),
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   child:
                           Icon(
                            CupertinoIcons.heart_fill
                          ),
                        // )
                      ]),
                ),
              ),
            );
          }),
    ));
  }
}
