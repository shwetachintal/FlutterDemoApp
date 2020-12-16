import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Helpers/database_helper.dart';
import 'package:flutter_app_demo/edit.dart';

import 'Models/patient.dart';
import 'main.dart';


class PatientDetailsPage extends StatefulWidget{
  Patient patient;

  PatientDetailsPage({Key key, this.patient}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PatientDetailsPageState();
  }

}

class PatientDetailsPageState extends State<PatientDetailsPage>{

  //DatePicker Implementation
  var selectedDate;
  DateTime birthDate = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context)async{
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: birthDate,
        firstDate: DateTime(1960),
        lastDate: birthDate);
    setState(() {
      birthDate = picked;
      selectedDate = birthDate.toString();
      print(selectedDate);
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Patient Details"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    "First Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.patient.firstName),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Last Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.patient.lastName),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Preferred Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.patient.preferredName?? "N/A"),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Address Line1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.patient.addressLineOne?? "N/A"),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Address Line2",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.patient.addressLineTwo?? "N/A"),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Contact Number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.patient.mobileNumber?? "N/A"),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Birthdate",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.patient.birthdate?? "N/A"),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Marital Status",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.patient.maritalStatus?? "N/A"),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(
                  "Gender",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Text(widget.patient.gender?? "N/A"),
                Padding(
                  padding: EdgeInsets.all(5),
                ),



                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text("Edit"),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage(
                            patient: widget.patient,
                          )));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5,right: 5),
                    ),
                    Expanded(
                      child: RaisedButton(
                        child: Text("Delete"),
                        onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return new AlertDialog(
                                  title: Text("Confirm"),
                                  content: Text("Are you Sure?"),
                                  actions: <Widget>[
                                    FlatButton(
                                        child: Text("OK"),
                                        onPressed: () async{
                                          var db = DatabaseHelper();
                                          await db.delete(widget.patient.patientId);
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                                        },
                                    ),
                                    FlatButton(
                                      child: Text("Cancel"),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5,right: 5),
                    ),
                    Expanded(
                      child: RaisedButton(
                        child: Text("Cancel"),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//Radio Buttons Implementation starts
/*class RadioGroup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RadioGroupState();
  }
}
class RadioGroupState extends State<RadioGroup>{
  String dChoice = "Single";
  int dIndex = 0;

 List<MyStatus> maritalStatus = [
    MyStatus(index:0,Choice:"Single"),
    MyStatus(index:1,Choice:"Married"),
    MyStatus(index:2,Choice:"Other"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Wrap{
          children:<Widget>[

          ]
        }
      ],
    );
  }

}*/
//Radio Buttons Implementation ends


