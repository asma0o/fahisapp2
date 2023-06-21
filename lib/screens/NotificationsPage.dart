// ignore_for_file: prefer_const_constructors

// import 'dart:html';

// import 'dart:ffi';

// ignore: depend_on_referenced_packages
import 'package:fahisapp/firebase_services/GetDataNotification.dart';
import 'package:fahisapp/widgets/NotifiService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fahisapp/app-bar.dart';
// import 'package:fahisapp/bottom-bar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
//import 'package:customizable_counter/customizable_counter.dart';

DateTime scheduleTime = DateTime.now();

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

 
  

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final Credential = FirebaseAuth.instance.currentUser;

  // getData() async {
  //   await Firebase.initializeApp();
  //   FirebaseFirestore.instance.collection("users").get().then((value) {
  //     value.docs.forEach((element) {
  //       print(element.data());
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      // return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(

          appBar: AppBar(
            title: Text(
              "الاشعارات",
               style:TextStyle(color: Colors.black),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "السابقة",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "الحالية",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // bottomNavigationBar: FABBottomAppBarItem(iconData: Icons.access_alarm, text: "h",),
          body: Container(
            color: Color(0xffFFF8F1),
            child: Column(
              children: [
                // Container(
                //   height: 70,
                //   decoration: BoxDecoration(color: Color(0xffFFD9B4)),
                //   child: Padding(
                //     padding: const EdgeInsets.all(10.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     ),
                //   ),
                // ),

                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 20,
                        top: 13,
                        child: GetNoti_Firebase(documentId: Credential!.uid),
                        // child: Text(
                          
                        //   "تغيير زيت وفلتر المحرك",
                        //   style: TextStyle(
                        //       fontSize: 18, fontWeight: FontWeight.bold),
                        // ),
                        // child: Column(
                        //   children: [
                        //     GetDataNotification(),
                        //   ],
                        // )
                      ),
                      Positioned(
                        right: 25,
                        bottom: 20,
                        child: Text(
                          "متبقي على الموعد يومان",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 16,
                        child: Text(
                          " 12/5/2023",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Center(
                      //     child: ElevatedButton(
                      //   child: const Text('Show notifications'),
                      //   onPressed: () {
                      //     NotificationService().showNotification(
                      //         title: 'فاحص للتذكير', body: 'تذكير جديد');
                      //   },
                      // )
                      //

                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      //Spacer(),
                      DatePickerTxt(),
                      ScheduleBtn(),
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ));
}

class DatePickerTxt extends StatefulWidget {
  const DatePickerTxt({
    Key? key,
  }) : super(key: key);

  @override
  State<DatePickerTxt> createState() => _DatePickerTxtState();
}

class _DatePickerTxtState extends State<DatePickerTxt> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          onChanged: (date) => scheduleTime = date,
          onConfirm: (date) {},
        );
      },
      child: const Text(
        'Select Date Time',
        style: TextStyle(color: Color.fromARGB(255, 236, 142, 54)),
      ),
    );
  }
}

class ScheduleBtn extends StatelessWidget {
  const ScheduleBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Schedule notifications'),
      onPressed: () {
        debugPrint('Notification Scheduled for $scheduleTime');
        NotificationService().scheduleNotification(
            title: 'تذكير فاحص',
            //body: '$scheduleTime',
            body: 'تذكير بموعد تغيير الزيت',
            scheduledNotificationDateTime: scheduleTime);
      },
    );
  }
}
