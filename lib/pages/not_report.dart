import 'package:flutter/material.dart';

class NotReport extends StatefulWidget {
  const NotReport({Key? key}) : super(key: key);

  @override
  _NotReportState createState() => _NotReportState();
}

class _NotReportState extends State<NotReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
      ),
      body: Center(
        child: Container(
          child: Text("No report uploaded yet"),
        ),
      ),
    );
  }
}