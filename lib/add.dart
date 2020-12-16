import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/Helpers/database_helper.dart';

import 'Models/patient.dart';
import 'main.dart';


class AddPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AddPageState();
  }

}

class AddPageState extends State<AddPage>{
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
                  decoration: InputDecoration(
                      hintText: "First Name",
                      labelText: "First Name Required",
                      labelStyle: TextStyle(color: Colors.red) ,
                  ),
                  controller: txtEditingControllerFirstName,
                  keyboardType: TextInputType.text ,

                ),

                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Last Name",
                    labelText: "Last Name Required",
                    labelStyle: TextStyle(color: Colors.red)

                  ),
                  controller: txtEditingControllerLasttName,
                  keyboardType: TextInputType.text ,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Preferred Name", labelText: "Preferred Name"),
                  controller: txtEditingControllerPreferredName,
                  keyboardType: TextInputType.text ,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Address Line1", labelText: "Address Line1"),
                  controller: txtEditingControllerAddressLine1,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Address Line2", labelText: "Address Line2"),
                  controller: txtEditingControllerAddressLine2,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Mobile Number", labelText: "Mobile Number"),
                  controller: txtEditingControllerMobile,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Home Phone", labelText: "Home Phone"),
                  controller: txtEditingControllerHomePhone,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
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
                  decoration: InputDecoration(hintText: "Marital Status", labelText: "Marital Status"),
                  controller: txtEditingControllerMaritalStatus,
                  keyboardType: TextInputType.text ,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Gender", labelText: "Gender"),
                  controller: txtEditingControllerGender,
                  keyboardType: TextInputType.text ,
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
                          var patient = new Patient(
                            firstName: txtEditingControllerFirstName.text,
                            lastName: txtEditingControllerLasttName.text,
                            preferredName: txtEditingControllerPreferredName.text,
                            addressLineOne: txtEditingControllerAddressLine1.text,
                            addressLineTwo: txtEditingControllerAddressLine2.text,
                              mobileNumber: txtEditingControllerMobile.text,
                            homePhone: txtEditingControllerHomePhone.text,
                            birthdate: selectedDate,
                            maritalStatus: txtEditingControllerMaritalStatus.text,
                            gender: txtEditingControllerGender.text
                          );
                          var db = DatabaseHelper();
                          await db.create(patient);
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


