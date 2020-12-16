import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Helpers/database_helper.dart';
import 'package:flutter_app_demo/Models/patient.dart';
import 'package:flutter_app_demo/details.dart';

import 'add.dart';


void main() {

  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  final GlobalKey<NavigatorState> _navigator = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigator,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Maximeyes Patient Data"),
          actions:<Widget> [
            PopupMenuButton(
              itemBuilder: (content) => [
                PopupMenuItem(
                    value:1,
                    child: Text("Add")),
              ],
              onSelected: (int menu){
                if(menu == 1){
                  _navigator.currentState.push(MaterialPageRoute(builder: (content) => AddPage()));
                }
              },
            )
          ],
        ),
        body: MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var db = new DatabaseHelper();
    return Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List>(
          future: db.findAll(),
          builder: (context, AsyncSnapshot<List> snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    Patient patient = Patient.fromJson(snapshot.data[index]);
                    return Card(
                      child: ListTile(
                        title: Text(patient.firstName+" "+patient.lastName),
                        subtitle: Text(patient.mobileNumber),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDetailsPage(
                            patient: patient,
                          )));
                        },
                      ),
                    );
                  });
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
    );
  }
}

/*class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Maximeyes Patient Data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var navigatorKey = GlobalKey<NavigatorState>();


  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
        navigatorKey: navigatorKey,
        actions:<Widget> [
          PopupMenuButton(
              itemBuilder: (content) => [
                PopupMenuItem(
                    value:1,
                    child: Text("Add")),
              ],
            onSelected: (int menu){
                if(menu == 1){
                  navigatorKey.currentState.push(MaterialPageRoute(builder: null));
                }
            },
          )
        ],
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
