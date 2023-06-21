import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String password;
  String email;

  String Name;
  // String uid;


  UserData({
    required this.email,
    required this.password,
    required this.Name,
    // required this.uid,

  });

// To convert the UserData(Data type) to   Map<String, Object>
  Map<String, dynamic> convert2Map() {
    return {
      "Password": password,
      "Email": email,
      "Name": Name,

      // "uid": uid,
   
    };
  }

  // function that convert "DocumentSnapshot" to a User
// function that takes "DocumentSnapshot" and return a User

  static convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserData(
      password: snapshot["Password"],
      email: snapshot["Email"],
      Name: snapshot["Name"],
      // uid: snapshot["uid"],

);
}
}
