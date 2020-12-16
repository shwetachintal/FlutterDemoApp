
import 'package:flutter_app_demo/Models/patient.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String dbName = "patientDB.db";
  final String tablePatient = "patientTable";
  final String columnId = "patientId";
  final String columnFirstName = "firstName";
  final String columnLastName = "lastName";
  final String columnPreferredName = "preferredName";
  final String columnAddressLineOne = "addressLineOne";
  final String columnAddressLineTwo = "addressLineTwo";
  final String columnMobileNumber = "mobileNumber";
  final String columnHomePhone = "homePhone";
  final String columnBirthdate = "birthdate";
  final String columnMaritalStatus = "maritalStatus";
  final String columnGender = "gender";

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async{
    if(_db != null){
        return _db;
      }
    _db = await initDB();
    return _db;
  }

  initDB() async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,dbName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async{
      await db.execute("create table $tablePatient ("
          "$columnId integer primary key autoincrement, "
          "$columnFirstName text, "
          "$columnLastName text, "
          "$columnPreferredName text, "
          "$columnAddressLineOne text, "
          "$columnAddressLineTwo text, "
          "$columnMobileNumber text, "
          "$columnHomePhone text, "
          "$columnBirthdate text, "
          "$columnMaritalStatus text, "
          "$columnGender text"
          ")");
  }

  //Insert data while saving
  Future<int> create(Patient patient)async{
    var dbClient = await db;
    var result = await dbClient.insert(tablePatient, patient.toJson());
    return result;
  }

  //Retrieve to show on first screen
  Future<List> findAll() async{
    var dbClient = await db;
    var result = await dbClient.query(tablePatient, columns: [
      columnId,
      columnPreferredName,
      columnFirstName,
      columnLastName,
      columnMobileNumber,
      columnAddressLineOne,
      columnAddressLineTwo,
      columnGender,
      columnMaritalStatus,
      columnBirthdate
    ]);
    return result.toList();
  }

  Future<int> delete(int id) async{
    var dbClient = await db;
    return await dbClient
        .delete(tablePatient,where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Patient patient)async{
    var dbClient = await db;
    var result = await dbClient.update(tablePatient, patient.toJson(),
    where: "$columnId = ?",whereArgs: [patient.patientId]);
    return result;
  }



}
