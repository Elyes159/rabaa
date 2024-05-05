// ignore_for_file: unused_import

import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:rabaa/viewModel/api_service.dart';
import 'package:rabaa/auth/login.dart';
import 'package:rabaa/constant/constant.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.color2,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Lottie.asset('assets/lotties/animation2.json'),
                SizedBox(
                  height: 10,
                ),
                FadeIn(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            style: TextStyle(fontFamily: "Poppins"),
                            onChanged: (value) {
                              firstname = value;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "First name",
                                suffixIcon: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white70,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.person,
                                      color: AppConstant.color2,
                                    ))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            style: TextStyle(fontFamily: "Poppins"),
                            onChanged: (value) {
                              lastname = value;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Last name",
                                suffixIcon: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white70,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.person,
                                      color: AppConstant.color2,
                                    ))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            style: TextStyle(fontFamily: "Poppins"),
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                suffixIcon: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white70,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.person,
                                      color: AppConstant.color2,
                                    ))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            obscureText: isObsecure,
                            style: TextStyle(fontFamily: "Poppins"),
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                suffixIcon: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white70,
                                        shape: BoxShape.circle),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isObsecure = !isObsecure;
                                          });
                                        },
                                        icon: Icon(
                                          isObsecure == true
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: AppConstant.color2,
                                        )))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?  ",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      LoginScreen()));
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 300,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            if (firstname == null || firstname!.isEmpty) {
                              EasyLoading.showError(
                                  "Please enter your first name");
                            }
                            if (lastname == null || lastname!.isEmpty) {
                              EasyLoading.showError(
                                  "PLease enter your lastname");
                            }
                            if (email == null || email!.isEmpty) {
                              EasyLoading.showError("Please enter your email");
                            }
                            if (password == null || password!.isEmpty) {
                              EasyLoading.showError(
                                  "Please enter your password");
                            }
                            ApiService.signup(
                                last_name: lastname,
                                first_name: firstname,
                                emaill: email,
                                passwordd: password);
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: AppConstant.color1,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
