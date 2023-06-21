

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fahisapp/widgets/CarCard.dart';
// import 'package:fahisapp/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class CarCard {
  String companyName;
  String carModel;
  Image loogo;
  String latterPlate;
  int numPlate;

  CarCard({
    required this.companyName,
    required this.carModel,
    required this.loogo,
    required this.latterPlate,
    required this.numPlate,
  });
}

List allCarCard = [
  CarCard(
    companyName: 'test2',
    carModel: 'test',
    latterPlate: 'ABC',
    numPlate: 123,
    loogo: Image.asset(
      "images/audi-logo.png",
      height: 160,
      width: 200,
    ),
  ),
  CarCard(
    companyName: 'test2',
    carModel: 'test',
    latterPlate: 'ABC',
    numPlate: 123,
    loogo: Image.asset(
      "images/audi-logo.png",
      height: 160,
      width: 200,
    ),
  ),
];

class _HomePageState extends State<HomePage> {
  Map userData = {};
  bool isLoading = true;

  getData() async {
    // Get data from DB

    setState(() {
      isLoading = true;
    });
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData = snapshot.data()!;
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // final allDataFromDB = Provider.of<UserProvider>(context).getUser;

    return isLoading
        ? Scaffold(
            body: Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            )),
          )
        : SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  actions: [
                    Image.asset(
                      "images/fahis_logo.png",
                    )
                  ],
                  backgroundColor: Colors.transparent,
                  // elevation: 1,
                  toolbarHeight: 80,
                  title: Text(
                    "مرحبًا",
                    //  ${allDataFromDB!.Name}

                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.white),
                  ),
                ),
                // floatingActionButton: BtmNavBar(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        alignment: AlignmentDirectional.topStart,
                        child: const Text(
                          "مركباتي",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...allCarCard.map(
                              (item) => CarCardTest(
                                comName: item.companyName,
                                carModel: item.carModel,
                                logo: item.loogo,
                                latterPlate: item.latterPlate,
                                numPlate: item.numPlate,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
