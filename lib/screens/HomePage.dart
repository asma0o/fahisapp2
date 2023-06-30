

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fahisapp/widgets/CarCard.dart';
// import 'package:fahisapp/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
// import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


List allCarCard = [
  CarCard(
    companyName: 'test2',
    carModel: 'test',
    latterPlate: 'ABC',

    numPlate: 123,
    loogo:
      "images/audi-logo.png",

  ),
  CarCard(
    companyName: 'test2',
    carModel: 'test',
    latterPlate: 'ABC',

    numPlate: 123,
    loogo:
      "images/audi-logo.png",

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
          .doc('JNlu4vWmoKS363gfqkBWd6opLPk2')//FirebaseAuth.instance.currentUser!.uid
          .get();

      userData = snapshot.data()!;
      print(userData['vehicle']);
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
                body: Column(
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
                    Image(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/fahisapp-55cb0.appspot.com/o/car-logos%2FAudi.png?alt=media&token=7581e7cc-4139-494d-b730-fcdd7e153cea')),
                    Expanded( // Wrap the ListView with Expanded
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                         // print(userData['vehicle'][0].companyName);
                          return CarCardTest(
                            comName: userData['vehicle'][index]['companyName'],
                            carModel: userData['vehicle'][index]['carModel'],
                            logo: userData['vehicle'][index]['loogo'],
                            latterPlate: userData['vehicle'][index]['latterPlate'],
                            numPlate: userData['vehicle'][index]['numPlate'],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        itemCount: userData['vehicle'].length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
