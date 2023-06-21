// ignore: file_names

import 'package:fahisapp/screens/HomePage.dart';
import 'package:fahisapp/screens/MyServices.dart';
import 'package:fahisapp/screens/NotificationsPage.dart';
import 'package:fahisapp/screens/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MobileScerren extends StatefulWidget {
  const MobileScerren({Key? key}) : super(key: key);

  @override
  State<MobileScerren> createState() => _MobileScerrenState();
}

class _MobileScerrenState extends State<MobileScerren> {
  // To get data from DB using provider
  // getDataFromDB() async {
  //   UserProvider userProvider = Provider.of(context, listen: false);
  //   await userProvider.refreshUser();
  // }

  @override
  void initState() {
    super.initState();
    // getDataFromDB();
  }

  final PageController _pageController = PageController();

  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/AddVehicle');
        },
        backgroundColor: Color.fromARGB(255, 236, 142, 54),
        //Floating action button on Scaffold
        //  onPressed:   _incrementCounter ,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
            ),
          ],
        ), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: CupertinoTabBar(
          height: 55,
          backgroundColor: Colors.white,
          onTap: (index) {
            // navigate to the tabed page
            _pageController.jumpToPage(index);
            setState(() {
              currentPage = index;
            });

            // print(   "---------------    $index "  );
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: currentPage == 0
                      ? Color.fromARGB(255, 236, 142, 54)
                      : Colors.grey,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.checklist,
                  color: currentPage == 1
                      ? Color.fromARGB(255, 236, 142, 54)
                      : Colors.grey,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  color: currentPage == 2
                      ? Color.fromARGB(255, 236, 142, 54)
                      : Colors.grey,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: currentPage == 3
                      ? Color.fromARGB(255, 236, 142, 54)
                      : Colors.grey,
                ),
                label: ""),
          ]),
      body: PageView(
        onPageChanged: (index) {},
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          HomePage(),
          MyServices(),
          NotificationPage(),
          Profile(),
        ],
      ),
    );
  }
}

