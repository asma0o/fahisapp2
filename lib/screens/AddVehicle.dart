import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fahisapp/models/car_models.dart';
import 'package:fahisapp/shared/AppBar.dart';
import 'package:flutter/material.dart';
//import 'package:untitled3/firebase_services/firestore.dart';
//import 'package:untitled3/shared/constant/app-bar.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  CollectionReference AddVehicle =
      FirebaseFirestore.instance.collection('AddVehicle');

  final _PlateNController = TextEditingController();
  final _PlateLController = TextEditingController();
  final _VinController = TextEditingController();
  final _MakerController = TextEditingController();
  final _ModelController = TextEditingController();
  final _MyearController = TextEditingController();


  final CollectionReference<Map<String, dynamic>> companiesCollection =
FirebaseFirestore.instance.collection('companies');

void addCompanyToFirestore(Company company) {
  companiesCollection.add(company.toJson());
}

Future<List<Company>> getCompaniesFromFirestore() async {
  final snapshot = await companiesCollection.get();
  return snapshot.docs.map((doc) => Company.fromJson(doc.data())).toList();
}


  List<Company> companies = [];
  List<String> companiess = [];
  List<CarModel> carModels = [];
  List<String> features = [];
  String selectedCompany = '';
  String selectedCarModel = '';
  String selectedFeature = '';

  Future<void> fetchCompanies() async {
  final List<Company> fetchedCompanies = await getCompaniesFromFirestore();
  setState(() {
    companies = fetchedCompanies;
    companies.forEach((element) {
      companiess.add(element.name);
      print(element.name);
    });
  });
}
  Future<void> fetchCarModels() async {
  final selectedCompanyObj = companies.firstWhere((company) => company.name == selectedCompany);
  setState(() {
    carModels = selectedCompanyObj.carModels;
    selectedCarModel = '';
    selectedFeature = '';
  });
}

Future<void> fetchFeatures() async {
  final selectedCompanyObj = companies.firstWhere((company) => company.name == selectedCompany);
  final selectedCarModelObj =
  selectedCompanyObj.carModels.firstWhere((carModel) => carModel.name == selectedCarModel);
  setState(() {
    features = selectedCarModelObj.features;
    selectedFeature = '';
  });
}

  String selectedValue = '';

  List<String> dropdownValues = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];


  @override
  void initState() {
    super.initState();
    fetchCompanies();


    // Start listening to changes.
  }

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: "اضافة مركبة",
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              color: Color.fromARGB(255, 240, 238, 234),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "تفاصيل المركبة",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffE36D00),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                    decoration: BoxDecoration(
                      color: Color(0x59D5D4D0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "شركة السيارة",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          Center(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('MVehicle')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                List<DropdownMenuItem> clientItem = [];

                                if (!snapshot.hasData) {
                                  const CircularProgressIndicator();
                                } else {
                                  final clients =
                                      snapshot.data!.docs.reversed.toList();
                                  for (var client in clients) {
                                    clientItem.add(
                                      DropdownMenuItem(
                                        value: client.id,
                                        child: Text(
                                          client['name'],
                                        ),
                                      ),
                                    );
                                  }
                                }
                                return CustomSearchableDropDown(
                                  items: clientItem,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      border: Border.all(color: Colors.grey)),
                                  onChanged: (clientValue) {
                                    _MakerController.text;
                                    print(clientValue);
                                  },
                                  dropDownMenuItems: ['name'],
                                  dropdownHintText: 'الرجاء اختيار الشركة',
                                  label: 'الرجاء اختيار الشركة',
                                );
                                //
                              },
                            ),
                          ),


                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "موديل السيارة",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          Center(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('MVehicle')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                List<DropdownMenuItem> clientItem = [];

                                if (!snapshot.hasData) {
                                  const CircularProgressIndicator();
                                } else {
                                  final clients =
                                      snapshot.data!.docs.reversed.toList();
                                  for (var client in clients) {
                                    clientItem.add(
                                      DropdownMenuItem(
                                        value: client.id,
                                        child: Text(
                                          client['name'],
                                        ),
                                      ),
                                    );
                                  }
                                }
                                return CustomSearchableDropDown(
                                  items: clientItem,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      border: Border.all(color: Colors.grey)),
                                  onChanged: (clientValue) {
                                    _ModelController.text;

                                    print(clientValue);
                                  },
                                  dropDownMenuItems: ['name'],
                                  dropdownHintText: 'الرجاء اختيار الموديل',
                                  label: 'الرجاء اختيار الموديل',
                                );
                                //
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "سنة صنع السيارة",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          Center(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('MVehicle')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                List<DropdownMenuItem> clientItem = [];

                                if (!snapshot.hasData) {
                                  const CircularProgressIndicator();
                                } else {
                                  final clients =
                                      snapshot.data!.docs.reversed.toList();
                                  for (var client in clients) {
                                    clientItem.add(
                                      DropdownMenuItem(
                                        value: client.id,
                                        child: Text(
                                          client['name'],
                                        ),
                                      ),
                                    );
                                  }
                                }
                                return CustomSearchableDropDown(
                                  items: clientItem,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      border: Border.all(color: Colors.grey)),
                                  onChanged: (clientValue) {
                                    _MyearController.text;
                                    print(clientValue);
                                  },
                                  dropDownMenuItems: ['name'],
                                  dropdownHintText: 'الرجاء اختيار السنة',
                                  label: 'الرجاء اختيار السنة',
                                );
                                //
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "رقم لوحة السيارة",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: SizedBox(
                                  width: 90,
                                  height: 70,
                                  child: Center(
                                    child: TextField(
                                      controller: _PlateLController,
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                      maxLength: 3,
                                      decoration: InputDecoration(
                                        hintText: "ex: ABC",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: SizedBox(
                                  width: 90,
                                  height: 70,
                                  child: Center(
                                    child: TextField(
                                      controller: _PlateNController,
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      maxLength: 4,
                                      decoration: InputDecoration(
                                        hintText: "ex:1234",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "رقم هيكل السيارة",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 75,
                            child: TextField(
                              controller: _VinController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              maxLength: 17,
                              decoration: InputDecoration(
                                hintText: "الرجاء ادخال رقم هيكل السيارة",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "عدد الأميال",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 55,
                            child: TextField(
                              controller: _VinController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                hintText: "الرجاء ادخال عدد الأميال",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13)),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x33FEC163),
                                    Color(0xBFDE4313),
                                  ],
                                ),
                              ),
                              height: 40,
                              width: 250,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(0, 253, 229, 216),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                                onPressed: () async {
                                  Navigator.pushNamed(context, '/MobileScerren');
                                  print('Selected Company: $selectedCompany');
                                  print('Selected Car Model: $selectedCarModel');
                                  print('Selected Feature: $selectedFeature');
                                  DocumentReference documentRef = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid);

// Add an item to a list field
                                  documentRef.update({
                                    'vehicle': FieldValue.arrayUnion([
                                      {  'companyName': "$selectedCompany",
                                        'carModel': "$selectedCarModel",
                                        'uid': "uidwww",
                                        'loogo': "https://firebasestorage.googleapis.com/v0/b/fahisapp-55cb0.appspot.com/o/car-logos%2FAudi.png?alt=media&token=7581e7cc-4139-494d-b730-fcdd7e153cea",
                                        'latterPlate': "$selectedFeature",
                                        'numPlate': 22,}
                                    ]),
                                  })
                                      .then((value) {
                                    print('Item added to list field successfully!');
                                  })
                                      .catchError((error) {
                                    print('Failed to add item to list field: $error');
                                  });
                                  //
                                  // FirestoreMethods().AddVehicle(
                                  //   PlateLetter: _PlateLController.text,
                                  //   PlateNo: _PlateNController,
                                  //   VIN: _VinController.text,
                                  //   VehicleModel: _ModelController,
                                  //   vehicleMakeYear: _MyearController,
                                  //   vehicleMaker: _MakerController,
                                  //   context: context,
                                  // );
                                },
                                child: Text(
                                  "حفظ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///to get Company list
// ///
// final CollectionReference<Map<String, dynamic>> companiesCollection =
// FirebaseFirestore.instance.collection('companies');
//
// void addCompanyToFirestore(Company company) {
//   companiesCollection.add(company.toJson());
// }
//
// Future<List<Company>> getCompaniesFromFirestore() async {
//   final snapshot = await companiesCollection.get();
//   return snapshot.docs.map((doc) => Company.fromJson(doc.data())).toList();
// }

////
// List<Company> companies = [];
//   List<CarModel> carModels = [];
//   List<String> features = [];
//   String selectedCompany = '';
//   String selectedCarModel = '';
//   String selectedFeature = '';

///to get the compnies you can get it when app start or any thing like you want
// @override
// void initState() {
//   super.initState();
//   fetchCompanies();
// }
///here Companies the first part of the vehcile call it in onchange
// Future<void> fetchCompanies() async {
//   final List<Company> fetchedCompanies = await getCompaniesFromFirestore();
//   setState(() {
//     companies = fetchedCompanies;
//     companies.forEach((element) {
//       companies.add(element.name);
//       print(element.name);
//     });
//   });
// }
///here CarModels the second part of the vehcile call it in onchange
// Future<void> fetchCarModels() async {
//   final selectedCompanyObj = companies.firstWhere((company) => company.name == selectedCompany);
//   setState(() {
//     carModels = selectedCompanyObj.carModels;
//     selectedCarModel = '';
//     selectedFeature = '';
//   });
// }
///here fetch the therd part of the vehcile call it in onchange
// Future<void> fetchFeatures() async {
//   final selectedCompanyObj = companies.firstWhere((company) => company.name == selectedCompany);
//   final selectedCarModelObj =
//   selectedCompanyObj.carModels.firstWhere((carModel) => carModel.name == selectedCarModel);
//   setState(() {
//     features = selectedCarModelObj.features;
//     selectedFeature = '';
//   });
// }
///this methoud to upload data update it  in the documentRef just change the uid that you will get it from the user model when you call it
// void uploadData() {
//   print('Selected Company: $selectedCompany');
//   print('Selected Car Model: $selectedCarModel');
//   print('Selected Feature: $selectedFeature');
//DocumentReference documentRef = FirebaseFirestore.instance.collection('Users').doc('JNlu4vWmoKS363gfqkBWd6opLPk2');
//
// // Add an item to a list field
//           documentRef.update({
//             'vehicle': FieldValue.arrayUnion([
//               {  'companyName': "$selectedCompany",
//           'carModel': "$selectedCarModel",
//           'uid': "uidwww",
//           'loogo': "loogso",
//           'latterPlate': "$selectedFeature",
//           'numPlate': 22,}
//             ]),
//           })
//               .then((value) {
//             print('Item added to list field successfully!');
//           })
//               .catchError((error) {
//             print('Failed to add item to list field: $error');
//           });
//
//         },

// }
///how to chose the value in drop down look to the  onchanged and gett the data like you want  and put it into the items
//  DropdownButtonFormField<String>(
//               value: selectedCompany,
//               onChanged: ( newValue) {
//                 setState(() {
//                   selectedCompany = newValue??'';
//                   // Perform additional operations as needed
//                 });
//               },
//               items: companies.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               hint: Text('Select Company'),
//             ),
//             SizedBox(height: 16),
//             // DropdownButtonFormField<String>(
//             //   value: selectedCarModel,
//             //   onChanged: (value) {
//             //     setState(() {
//             //       selectedCarModel = value ?? '';
//             //       selectedFeature = '';
//             //       fetchFeatures();
//             //     });
//             //   },
//             //   items: carModels.map((model) {
//             //     return DropdownMenuItem<String>(
//             //       value: model.name,
//             //       child: Text(model.name),
//             //     );
//             //   }).toList(),
//             //   hint: Text('Select Car Model'),
//             // ),
//             // SizedBox(height: 16),
//             // DropdownButtonFormField<String>(
//             //   value: selectedFeature,
//             //   onChanged: (value) {
//             //     setState(() {
//             //       selectedFeature = value ?? '';
//             //     });
//             //   },
//             //   items: features.map((feature) {
//             //     return DropdownMenuItem<String>(
//             //       value: feature,
//             //       child: Text(feature),
//             //     );
//             //   }).toList(),
//             //   hint: Text('Select Feature'),
//             // ),
/// to add car model
//  final company = Company(
//             name: 'Company C',
//             carModels: [
//               CarModel(
//                 name: 'Model W',
//                 features: ['Feature 9', 'Feature 10', 'Feature 11'],
//               ),
//             ],
//           );
//           addCompanyToFirestore(company);
//           fetchCompanies();
///to add vehicle to the list
// onPressed: () {
// // Assuming you have a reference to the document you want to update
//           DocumentReference documentRef = FirebaseFirestore.instance.collection('Users').doc('JNlu4vWmoKS363gfqkBWd6opLPk2');
//
// // Add an item to a list field
//           documentRef.update({
//             'vehicle': FieldValue.arrayUnion([
//               {  'companyName': "companyNdame",
//           'carModel': "carModelss",
//           'uid': "uidwww",
//           'loogo': "loogso",
//           'latterPlate': "latterPlate",
//           'numPlate': 22,}
//             ]),
//           })
//               .then((value) {
//             print('Item added to list field successfully!');
//           })
//               .catchError((error) {
//             print('Failed to add item to list field: $error');
//           });
//
//         },