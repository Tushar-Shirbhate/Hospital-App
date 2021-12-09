import 'package:flutter/material.dart';

class NotReport extends StatefulWidget {
  const NotReport({Key? key}) : super(key: key);

  @override
  _NotReportState createState() => _NotReportState();
}

class _NotReportState extends State<NotReport> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(206, 147, 216, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color:  Color.fromRGBO(254, 23, 72, 1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(95, 0,15,0),
          child: Text("Report",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color.fromRGBO(254, 23, 72, 1)),

          ),
        ),
        elevation: 0,
        backgroundColor: Color.fromRGBO(206, 147, 216, 1),
      ),
      body: Center(
        child: Container(
          height: size.height/2,
          child: Column(
            children: [
              Image.asset("Assets/images/report.png",
              fit: BoxFit.fitHeight, height: size.height/4,),
              SizedBox(height: size.height/25,),
              Text(
                  "No report uploaded yet",
                  style: TextStyle(
                   fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                    color:  Color.fromRGBO(254, 23, 72, 1),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}