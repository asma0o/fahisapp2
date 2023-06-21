import 'package:fahisapp/horizontal_list.dart';
import 'package:fahisapp/services_list.dart';
import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  void openMyServicqesScreen() {
    Navigator.pushNamed(context, 'AddServices');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 195, 166),
        body: SafeArea(
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
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(80),
                      ),
                    ),
                  ),

                  //app bar

                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 251, 251),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0), // مسافه قبل بداية الكلام
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.rtl,
                        children: [
                          Column(
                            // خلينهم في سطرين

                            //الاسم ....

                            children: [
                              Text('الخدمات ',
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )),
                            ],
                          ),

                          SizedBox(height: 60), // مسافه بداية الصفحه
                          // صورة البروفايل
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pushNamed(context, '/MobileScerren');
                            },
                            // color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30), // مسافه بين السطرين

// horizontal listview
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        horizontal_list(name: 'كل اسبوعين '),
                        horizontal_list(name: 'كل 3 اشهر '),
                        horizontal_list(name: 'كل 6 اشهر '),
                        horizontal_list(name: 'كل سنتين '),
                        horizontal_list(name: 'كل 3 سنوات '),
                      ],
                    ),
                  ),

                  //servic list
                  SizedBox(
                    height: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'الكل ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.grey[500],
                              fontFamily: 'Cairo'),
                        ),
                        Text(
                          'قائمة الخدمات',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Cairo'),
                        )
                      ],
                    ),
                  ),

                  Container(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/AddServices');
                            },
                            child: Column(
                              children: [
                                services_list(
                                    SrtviceName: "  تغيير زيت المحرك  ",
                                    icon: Icon(Icons.gas_meter_rounded)),
                                services_list(
                                    SrtviceName: "  اعادة نفخ الاطارات ",
                                    icon: Icon(Icons.gas_meter_rounded)),
                                services_list(
                                    SrtviceName: " غسيل السيارة من الخارج ",
                                    icon: Icon(Icons.gas_meter_rounded)),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              )),
        ));
  }
}
