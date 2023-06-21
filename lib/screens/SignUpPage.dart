// import 'package:fahisapp/Home_Screen.dart';
// import 'package:fahisapp/LoginPage.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _AdressController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _PhoneNoController = TextEditingController();

  Future signUp() async {
    // ignore: non_constant_identifier_names
    final Credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passController.text.trim());

    CollectionReference Users = FirebaseFirestore.instance.collection('Users');

    // Call the user's CollectionReference to add a new user
    Users.doc(Credential.user!.uid)
        .set({
          'Name': _nameController.text,
          'Email': _emailController.text,
          'Adress': _AdressController.text,
          'PhoneNo': _PhoneNoController.text,
          'Password': _passController.text
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

    Navigator.pushNamed(context, '/FirstAdd');
  }

  void openLoginScreen() {
    Navigator.of(context).pushReplacementNamed('MobileScerren');
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
    _AdressController.dispose();
    _PhoneNoController.dispose();
  }

  // final _formKey = GlobalKey<FormState>();

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
            children: [
              SizedBox(
                height: 80,
              ),
//Image.asset('images/login.png' )

              SizedBox(
                height: 40,
              ),
              Text(
                "انشاء حساب ",
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
                        style: TextStyle(
                          fontFamily: 'Cairo',
                        ),
                        controller: _nameController,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText: 'الاسم',
                            suffixIcon: Icon(
                              Icons.person,
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
                        style: TextStyle(
                          fontFamily: 'Cairo',
                        ),
                        controller: _emailController,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText: 'الايميل',
                            suffixIcon: Icon(
                              Icons.mail,
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
                        style: TextStyle(
                          fontFamily: 'Cairo',
                        ),
                        controller: _AdressController,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText: 'العنوان',
                            suffixIcon: Icon(
                              Icons.mail,
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
                        style: TextStyle(
                          fontFamily: 'Cairo',
                        ),
                        controller: _PhoneNoController,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText: 'رقم الجوال',
                            suffixIcon: Icon(
                              Icons.mail,
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
                            style: TextStyle(
                              fontFamily: 'Cairo',
                            ),
                            controller: _passController,
                            obscureText: true,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                                hintTextDirection: TextDirection.rtl,
                                hintText: 'الرقم السري',
                                suffixIcon: Icon(
                                  Icons.lock,
                                  size: 16,
                                )))),
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
                            child: Text('التسجيل  ',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              'تسجيل الدخول ',
                              style: TextStyle(
                                  fontFamily: 'Cairo', color: Colors.black),
                            ),
                          ),
                          Text(
                            ' تملك حساب ؟',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: Colors.orangeAccent),
                          ),
                        ],
                      ),
                    )
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
