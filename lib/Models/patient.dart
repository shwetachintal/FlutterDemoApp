class Patient{
  int patientId;
  String firstName;
  String lastName;
  String preferredName;
  String addressLineOne;
  String addressLineTwo;
  String mobileNumber;
  String homePhone;
  String birthdate;
  String maritalStatus;
  String gender;

  Patient({
    this.patientId,
    this.firstName,
    this.lastName,
    this.preferredName,
    this.addressLineOne,
    this.addressLineTwo,
    this.mobileNumber,
    this.homePhone,
    this.birthdate,
    this.maritalStatus,
    this.gender
});

  int get pId => patientId;
  String get pFName => firstName;
  String get pLName => lastName;
  String get pPreferredName => preferredName;
  String get pAddLine1 => addressLineOne;
  String get pAddLine2 => addressLineTwo;
  String get pMobNumber => mobileNumber;
  String get pHomePhone => homePhone;
  String get pBirthdate => birthdate;
  String get pMaritalStatus => maritalStatus;
  String get pGender => gender;

  factory Patient.fromJson(Map<String, dynamic> data) => new Patient(
    patientId: data["patientId"],
    firstName: data["firstName"],
    lastName: data["lastName"],
    preferredName: data["preferredName"],
    addressLineOne: data["addressLineOne"],
    addressLineTwo: data["addressLineTwo"],
    mobileNumber: data["mobileNumber"],
    homePhone: data["homePhone"],
    birthdate: data["birthdate"],
    maritalStatus: data["maritalStatus"],
    gender: data["gender"],
  );

  Map<String, dynamic> toJson() => {
    "patientId": patientId,
    "firstName":firstName,
    "lastName":lastName,
    "preferredName":preferredName,
    "addressLineOne":addressLineOne,
    "addressLineTwo":addressLineTwo,
    "mobileNumber":mobileNumber,
    "homePhone":homePhone,
    "birthdate":birthdate,
    "maritalStatus":maritalStatus,
    "gender":gender,
  };

}