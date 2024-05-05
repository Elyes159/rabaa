import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:rabaa/admin/admin_main.dart';
import 'package:rabaa/auth/getData.dart';
import 'package:rabaa/auth/resetPassword.dart';
import 'package:rabaa/viewModel/api_service.dart';
import 'package:rabaa/auth/register.dart';
import 'package:rabaa/constant/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  height: 40,
                ),
                Lottie.asset('assets/lotties/animation1.json'),
                SizedBox(
                  height: 20,
                ),
                FadeIn(
                  child: Column(
                    children: [
                      Text(
                        "Login to your account",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                      SizedBox(
                        height: 40,
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
                            "Forget your password? ",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                  transitionDuration: Duration.zero,
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      ResetPassword()));
                            },
                            child: Text(
                              "Reset it ",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 300,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            if (email == null || email!.isEmpty) {
                              EasyLoading.showError("Please enter your email");
                            }
                            if (password == null || password!.isEmpty) {
                              EasyLoading.showError(
                                  "Please enter your password");
                            }
                            ApiService.login(emaill: email, passwordd: password)
                                .then((success) {
                              if (success) {
                                if (email == "admin@gmail.com") {
                                  Navigator.of(context).push(PageRouteBuilder(
                                      transitionDuration: Duration.zero,
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          AdminMain()));
                                } else {
                                  Navigator.of(context).push(PageRouteBuilder(
                                      transitionDuration: Duration.zero,
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          GetDataScreen()));
                                }
                              }
                            });
                          },
                          child: Text(
                            "Login",
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?  ",
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
                                      RegisterScreen()));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
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
