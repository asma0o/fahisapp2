// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim());
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/MobileScerren');
  }

  void openSignupScreen() {
    Navigator.pushNamed(context, '/MobileScerren');
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
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
            children: [
              SizedBox(
                height: 80,
              ),
//Image.asset('images/login.png' )

              SizedBox(
                height: 40,
              ),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
                color: Colors.white,
              ),
              Text(
                "تسجيل الدخول",
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
                height: 400,
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

                    //forget pass

                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '   هل نسيت كلمة المرور ؟ ',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.orangeAccent),
                            )
                          ],
                        )),

                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: signIn,
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.orange),
                        child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text('تسجيل الدخول ',
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
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                '   التسجيل ',
                                style: TextStyle(
                                    fontFamily: 'Cairo', color: Colors.black),
                              ),
                            ),
                            Text(
                              ' لاتملك حساب ؟',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.orangeAccent),
                            ),
                          ],
                        )),
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
