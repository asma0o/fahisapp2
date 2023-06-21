// ignore: depend_on_referenced_packages
import 'package:fahisapp/firebase_services/getProfileData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fahisapp/get_DataNotification.dart';



class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(

        //BottonBar start ......

        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: const Color.fromARGB(255, 236, 142, 54),
        //   //Floating action button on Scaffold
        //   onPressed: () {
        //     //code to execute on button press
        //   },
        //   child: const Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Icon(
        //         Icons.add,
        //         color: Colors.white,
        //       ),
        //     ],
        //   ), //icon inside button
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // //floating action button position to center
        // bottomNavigationBar: BottomAppBar(
        //   //bottom navigation bar on scaffold
        //   height: 55,
        //   color: Colors.white,
        //   shape: const CircularNotchedRectangle(), //shape of notch
        //   notchMargin:
        //       9, //notche margin between floating button and bottom appbar
        //   child: Row(
        //     //children inside bottom appbar
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       IconButton(
        //         icon: const Icon(
        //           Icons.home,
        //           color: Colors.grey,
        //           size: 30,
        //         ),
        //         onPressed: () {},
        //       ),
        //       IconButton(
        //         icon: const Icon(Icons.menu, color: Colors.grey, size: 30),
        //         onPressed: () {
        //           Navigator.pushNamed(context, 'MyServicqesScreen');
        //         },
        //       ),
        //       IconButton(
        //         icon: const Icon(Icons.notifications, color: Colors.grey, size: 30),
        //         onPressed: () {},
        //       ),
        //       IconButton(
        //         icon: const Icon(Icons.person, color: Colors.grey, size: 30),
        //         onPressed: () {
        //           Navigator.pushNamed(context, 'ProfileScreen');
        //         },
        //       ),
        //     ],
        //   ),
        // ),

        //BottonBae End .......

        backgroundColor: const Color.fromARGB(255, 233, 195, 166),
        body: SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 236, 142, 54),
                  Color.fromARGB(255, 233, 195, 166),
                  Color.fromARGB(255, 240, 229, 221)
                ])),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //app bar

                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 251, 251),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0), // مسافه قبل بداية الكلام
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: TextDirection.rtl,
                          children: [
                            Column(
                              // خلينهم في سطرين

                              //الاسم ....

                              children: [
                                Text('الملف الشخصي ',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                              ],
                            ),

                            SizedBox(height: 60), // مسافه بداية الصفحه
                            //صورة البروفايل
                            Icon(
                              Icons.arrow_back,
                              // color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Column(
                      children: [
                        Positioned(
                          top: -10,
                          left: 0,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Image(
                                height: 70,
                                width: 70,
                                image: AssetImage("images/fahislogo.jpg")),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                        height: 480,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Center(
                                      child: Column(
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          //__________________________________________________
                                          Read_Data(documentId: credential!.uid)
                                        ],
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
                  ],
                ))));
  }
}
