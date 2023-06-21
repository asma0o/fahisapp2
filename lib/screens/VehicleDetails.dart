import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fahisapp/shared/AppBar.dart';
import 'package:flutter/material.dart';
//import 'package:untitled3/firebase_services/firestore.dart';
//import 'package:untitled3/shared/constant/app-bar.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';

class VehicleDetails extends StatefulWidget {
  const VehicleDetails({super.key});

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  CollectionReference VehicleDetails =
      FirebaseFirestore.instance.collection('VehicleDetails');

  final _PlateNController = TextEditingController();
  final _PlateLController = TextEditingController();
  final _VinController = TextEditingController();
  final _MakerController = TextEditingController();
  final _ModelController = TextEditingController();
  final _MyearController = TextEditingController();
  @override
  void initState() {
    super.initState();

    @override
    void dispose() {
      super.dispose();
      _PlateNController.dispose();
      _PlateLController.dispose();
      _VinController.dispose();
      _MakerController.dispose();
      _ModelController.dispose();
      _MyearController.dispose();
    }

    // Start listening to changes.
  }

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: "معلومات المركبة",
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
                  
                  Center(child: Image.asset("images/audi-logo.png", height: 100,width: 200,alignment: Alignment.bottomCenter)),
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
