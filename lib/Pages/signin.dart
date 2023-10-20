import 'package:flutter/material.dart';
import 'package:nikeshop/Models/data.dart';
import 'package:nikeshop/Pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mongodb.dart';
import 'signup.dart';


class _SigninPageUIState extends State<SigninPageUI> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool showPass = true;
  Icon showPassIcon = Icon(Icons.visibility_off, color: Colors.white54,);

  void verify() async {
    var collection = db.collection("users");
    var result1 = await collection.findOne({"username": username.text.toString(), "password": password.text.toString()});
    var result2 = await collection.findOne({"email": username.text.toString(), "password": password.text.toString()});

    if(result1 != null) {
      saveUserDetailsToLocal(username.text, password.text, result1['email']);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageShoes()));
    } else if(result2 != null) {
      saveUserDetailsToLocal(result2['username'], password.text, username.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePageShoes()));
    }
    await initializeVariables();
  }

  Future<void> saveUserDetailsToLocal(String username, String password, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
    prefs.setString('email', email);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF1A1A1A),
                Color(0xFF333333),
                Color(0xFF131313),
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Row(children: [
                RotatedBox(
                    quarterTurns: 3,
                    child: Text('Sign in',
                      style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),)),
                SizedBox(
                  width: 60,
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Image.asset(
                      'assets/shoes/nike.png',
                      width: 100,
                      height: 100,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'TrendFoot',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Walk the Trend',
                      style: TextStyle(color: Colors.white54, fontSize: 23),
                    ),
                  ],
                ),
              ]),
              SizedBox(
                height: 100,
              ),
              TextField(
                controller: username,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.white54,
                    ),
                  ),
                  hintText: 'Username or Email',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: password,
                style: TextStyle(color: Colors.white),
                obscureText: showPass,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.white54,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: showPassIcon,
                    color: Colors.white54,
                    onPressed: () {
                      if (showPass == true) {
                        showPass = false;
                        showPassIcon = Icon(Icons.visibility, color: Colors.white54,);
                      } else {
                        showPass = true;
                        showPassIcon = Icon(Icons.visibility_off, color: Colors.white54,);
                      }
                      setState(() {});
                    },
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        verify();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Row(
                        children: [
                          Text(
                            'Ok',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Icon(Icons.arrow_forward,
                              color: Colors.black),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'First Time?  ',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white70, fontSize: 17),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SigninPageUI extends StatefulWidget {
  const SigninPageUI({super.key});
  @override
  State<SigninPageUI> createState() => _SigninPageUIState();
}