import 'package:fahisapp/responsive/Mobile_Screen.dart';
import 'package:fahisapp/screens/AddFirstV.dart';
import 'package:fahisapp/screens/AddServices.dart';
import 'package:fahisapp/screens/AddVehicle.dart';
import 'package:fahisapp/screens/HomePage.dart';
import 'package:fahisapp/screens/LoginPage.dart';
import 'package:fahisapp/screens/MyServices.dart';
import 'package:fahisapp/screens/ServicesPage.dart';
import 'package:fahisapp/screens/SignUpPage.dart';
import 'package:fahisapp/screens/VehicleDetails.dart';

import 'package:fahisapp/start_view/splash/SplashView.dart';
import 'package:fahisapp/widgets/NotifiService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: const Color.fromARGB(255, 233, 195, 166),
      // ),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xffFFD9B4),
        ),
      ),

      // home:  Onbording(),

      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const SplashView(),
        '/login': (context) => const loginpage(),
        '/signup': (context) => const SignupScreen(),
        '/MobileScerren': (context) => const MobileScerren(),
        '/homepage': (context) => const HomePage(),
        '/Services': (context) => const Services(),
        '/AddServices': (context) => const AddServices(),
        '/MyServices': (context) => const MyServices(),
        '/AddVehicle': (context) => const AddVehicle(),
        '/FirstAdd': (context) => const FirstAdd(),

      },
    ),
  );
}




