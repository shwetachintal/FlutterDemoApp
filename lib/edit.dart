import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Helpers/database_helper.dart';

import 'Models/patient.dart';
import 'main.dart';


class EditPage extends StatefulWidget{
  Patient patient;

  EditPage({Key key, this.patient}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new EditPageState();
  }

}

class EditPageState extends State<EditPage>{
  var maritalStatusItems = ['Single','Married','Other'];
  var genderItems = ['Male','Female','Unknown'];
  var txtEditingControllerFirstName = new TextEditingController();
  var txtEditingControllerLasttName = new TextEditingController();
  var txtEditingControllerPreferredName = new TextEditingController();
  var txtEditingControllerAddressLine1 = new TextEditingController();
  var txtEditingControllerAddressLine2 = new TextEditingController();
  var txtEditingControllerMobile = new TextEditingController();
  var txtEditingControllerHomePhone = new TextEditingController();
  var txtEditingControllerMaritalStatus = new TextEditingController();
  var txtEditingControllerGender = new TextEditingController();

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
    txtEditingControllerFirstName.text = widget.patient.firstName;
    txtEditingControllerLasttName.text = widget.patient.lastName;
    txtEditingControllerPreferredName.text = widget.patient.preferredName;
    txtEditingControllerAddressLine1.text = widget.patient.addressLineOne;
    txtEditingControllerAddressLine2.text = widget.patient.addressLineTwo;
    txtEditingControllerMobile.text = widget.patient.mobileNumber;
    txtEditingControllerHomePhone.text = widget.patient.homePhone;
    txtEditingControllerMaritalStatus.text = widget.patient.maritalStatus;
    txtEditingControllerGender.text = widget.patient.gender;
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add Patients here"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: "First Name"),
                  controller: txtEditingControllerFirstName,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Last Name"),
                  controller: txtEditingControllerLasttName,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Preferred Name"),
                  controller: txtEditingControllerPreferredName,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Address Line1"),
                  controller: txtEditingControllerAddressLine1,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Address Line2"),
                  controller: txtEditingControllerAddressLine2,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Mobile Number"),
                  controller: txtEditingControllerMobile,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Home Phone"),
                  controller: txtEditingControllerHomePhone,
                ),
                //Date Picker Button
                FlatButton(
                  child: Text("Select Birthdate"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){
                    selectTimePicker(context);
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      enabled: false,
                      hintText: selectedDate
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Marital Status"),
                  controller: txtEditingControllerMaritalStatus,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Gender"),
                  controller: txtEditingControllerGender,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text("Save"),
                        onPressed: () async{
                          widget.patient.firstName = txtEditingControllerFirstName.text;
                          widget.patient.lastName = txtEditingControllerLasttName.text;
                          widget.patient.preferredName = txtEditingControllerPreferredName.text;
                          widget.patient.addressLineOne = txtEditingControllerAddressLine1.text;
                          widget.patient.addressLineTwo =  txtEditingControllerAddressLine2.text;
                          widget.patient.mobileNumber = txtEditingControllerMobile.text;
                          widget.patient.homePhone = txtEditingControllerHomePhone.text;
                          widget.patient.birthdate = selectedDate;
                          widget.patient.maritalStatus = txtEditingControllerMaritalStatus.text;
                          widget.patient.gender = txtEditingControllerGender.text;

                          var db = DatabaseHelper();
                          await db.update(widget.patient);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));

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


