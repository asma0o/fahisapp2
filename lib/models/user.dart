import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String password;
  String email;
  String Name;
  String uid;
  List<CarCard> vehicle=[];

  UserData({
    required this.email,
    required this.password,
    required this.Name,
    required this.uid,
    required this.vehicle,
  });

// To convert the UserData(Data type) to   Map<String, Object>
  Map<String, dynamic> convert2Map() {
    return {
      "password": password,
      "email": email,
      "Name": Name, // Consider updating "Name" to "name" for consistency
      "uid": uid,
      "vehicle": vehicle.map((car) => car.convert2Map()).toList(),
    };
  }


  // function that convert "DocumentSnapshot" to a User
// function that takes "DocumentSnapshot" and return a User

  static UserData convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    var vehicleData = snapshot["vehicle"] as List<dynamic>;
    var vehicleList = vehicleData
        .map((car) => CarCard.convertSnap2Model(car as DocumentSnapshot))
        .toList();
    return UserData(
      password: snapshot["password"],
      email: snapshot["email"],
      Name: snapshot["Name"],
      uid: snapshot["uid"],
      vehicle: vehicleList,
    );
  }


}

class CarCard {
  String companyName;
  String carModel;
  String loogo;
  String latterPlate;

  int numPlate;

  CarCard({
    required this.companyName,
    required this.carModel,
    required this.loogo,
    required this.latterPlate,

    required this.numPlate,
  });

  Map<String, dynamic> convert2Map() {
    return {
      "companyName": companyName,
      "carModel": carModel,

      "loogo": loogo, // Consider updating "loogo" to "logo" for consistency
      "latterPlate": latterPlate,
      "numPlate": numPlate,
    };
  }


  // function that convert "DocumentSnapshot" to a User
// function that takes "DocumentSnapshot" and return a User

  static CarCard convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CarCard(
      companyName: snapshot["companyName"],
      carModel: snapshot["carModel"],

      loogo: snapshot["loogo"],
      latterPlate: snapshot["latterPlate"],
      numPlate: snapshot["numPlate"],
    );
  }

}

