import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/utils/screen_arguments.dart';

class  DoctorRequestDetailPage extends StatefulWidget{
  @override
  State<DoctorRequestDetailPage> createState() => _DoctorRequestDetailPageState();
}

class _DoctorRequestDetailPageState extends State<DoctorRequestDetailPage> {
  final CollectionReference firestoreDBPatientList = FirebaseFirestore.instance.collection('patientList');

  late DateTime pickedDate;
  late TimeOfDay time1;
  late TimeOfDay time2;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time1 = TimeOfDay.now();
    time2 = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {

    String date = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    String fromTime = "${time1.hour} : ${time1.minute}";
    String toTime = "${time2.hour} : ${time2.minute}";

    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    String patientListId = args.patientListId;


    return Scaffold(
        appBar: AppBar(
            title: Text(
                "Request Detail"
            )
        ),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.fromLTRB(15,0,0,0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                        args.patientName,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(25,0,15,0),
                      margin: EdgeInsets.fromLTRB(15,3.5,15,3.5),
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.blue),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            date,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30
                            ),
                          ),
                          IconButton(onPressed: _pickDate, icon: Icon(Icons.date_range)),
                        ],
                      )

                  ),
                  SizedBox(
                      height: 10
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(25,0,15,0),
                    margin: EdgeInsets.fromLTRB(15,3.5,15,3.5),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.blue),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            fromTime,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30
                            )
                        ),
                        IconButton(onPressed: _pickTime1, icon: Icon(Icons.lock_clock)),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 10
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(25,0,15,0),
                    margin: EdgeInsets.fromLTRB(15,3.5,15,3.5),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.blue),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            toTime,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30
                            )
                        ),
                        IconButton(onPressed: _pickTime2, icon: Icon(Icons.lock_clock)),
                      ],
                    ),
                  ),
                  SizedBox(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          Map<String,dynamic> patientRequest = {"patientName":args.patientName,"date":date,"fromTime":fromTime,"toTime":toTime};
                          FirebaseFirestore.instance.collection("patientRequestDetailList").add(patientRequest);

                        //await firestoreDBPatientList.doc(patientListId).update({"patientName":"Patient 2"}).then((value) => print('updated'));
                        await firestoreDBPatientList.doc(patientListId).delete().then((value) => print('deleted'));

                          Navigator.pop(context);
                          },
                        child: Container(
                            width: 125,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.greenAccent,
                            ),
                            child: Center(
                              child: Text(
                                  "Accept",
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white
                                  )
                              ),
                            )
                        ),
                      ),
                      InkWell(
                        onTap: () async{
                          await firestoreDBPatientList.doc(patientListId).delete().then((value) => print('deleted'));
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 125,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.redAccent,
                            ),
                            child: Center(
                              child: Text(
                                "Reject",
                                style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white
                                ),
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ]
            )
        )
    );
  }
  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year-5),
      lastDate: DateTime(DateTime.now().year+5),
      initialDate: pickedDate,

    );

    if(date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }
  _pickTime1() async {
    TimeOfDay? t1 = await showTimePicker(
      context: context,
      initialTime: time1,
    );

    if(t1 != null) {
      setState(() {
        time1 = t1;
      });
    }
  } _pickTime2() async {
    TimeOfDay? t2 = await showTimePicker(
      context: context,
      initialTime: time2,
    );

    if(t2 != null) {
      setState(() {
        time2 = t2;
      });
    }
  }
}