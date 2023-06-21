import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddServices extends StatefulWidget {
  const AddServices({super.key});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  final ServicesName = TextEditingController();
  final VehiclePlateNumber = TextEditingController();
  final LastChangeDate = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  final SpeedMeter = TextEditingController();

  Future signUp() async {
    final Credential = await FirebaseAuth.instance.currentUser!;

    CollectionReference Services =
        FirebaseFirestore.instance.collection('Services');

    // Call the user's CollectionReference to add a new user
    Services.doc(Credential.uid)
        .set({
          'ServicesName': ServicesName.text,
          'VehiclePlateNumber': VehiclePlateNumber.text,
          'LastChangeDate': dateinput.text,
          'SpeedMeter': SpeedMeter.text,
        })
        .then((value) => print("Services Added"))
        .catchError((error) => print("Failed to add Services: $error"));

    Navigator.of(context).pushNamed('/MyServices');
  }

  void openLoginScreen() {
    Navigator.of(context).pushReplacementNamed('loginScreen');
  }

  @override
  void dispose() {
    super.dispose();
    ServicesName.dispose();
    VehiclePlateNumber.dispose();
    LastChangeDate.dispose();
    SpeedMeter.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 236, 142, 54),
            Color.fromARGB(255, 233, 195, 166),
            Color.fromARGB(255, 240, 229, 221)
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //  textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                height: 80,
              ),
//Image.asset('images/login.png' )

              SizedBox(
                height: 40,
              ),
              Text(
                " إضافة الخدمة ",
                style: TextStyle(
                    fontFamily: 'Cairo',
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 550,
                width: 330,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  //  textDirection: TextDirection.rtl,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                        controller: ServicesName,
                        decoration: InputDecoration(

                            //  hintTextDirection: TextDirection.rtl,
                            hintText: 'اسم الخدمة',
                            suffixIcon: Icon(
                              Icons.car_rental,
                              size: 20,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        textAlign: TextAlign.right,

                        style: TextStyle(
                            fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                        controller: VehiclePlateNumber,
                        //   textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            //    hintTextDirection: TextDirection.rtl,
                            hintText: 'رقم اللوحة',
                            suffixIcon: Icon(
                              Icons.numbers_outlined,
                              size: 16,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        textAlign: TextAlign.right,

                        style: TextStyle(
                            fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                        controller: SpeedMeter,
                        //  textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          //   hintTextDirection: TextDirection.rtl,

                          suffixIcon: Icon(
                            Icons.speed,
                            size: 16,
                          ),
                          hintText: 'عدد الاميال',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 250,
                        child: Center(
                            child: TextField(
                          textAlign: TextAlign.right,

                          style: TextStyle(
                              fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                          controller:
                              dateinput, //editing controller of this TextField
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.calendar_today,
                                size: 16,
                              ), //icon of text field
                              hintText: "تاريخ اخر تغيير"
                              //label text of field
                              ),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(
                                    2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                dateinput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ))),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: signUp,
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.orange),
                        child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(' إضافة الخدمة  ',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
