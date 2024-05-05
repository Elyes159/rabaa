import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rabaa/constant/constant.dart';
import 'package:rabaa/viewModel/api_service.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String? email ; 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.color2, 
        elevation: 0, 
        foregroundColor: Colors.white,
      ),
      backgroundColor: AppConstant.color2, 
      body: Padding(
        padding:  EdgeInsets.only(left: 20 , right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Reset your password" , 
              style: TextStyle(
                fontFamily: "Poppins" , 
                color: Colors.white , 
                fontSize: 22  , 
                fontWeight: FontWeight.bold
              ),
              ) , 
              SizedBox(height: 30,) , 
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70 , 
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      email = value ; 
                    },
                    style: TextStyle(
                      fontFamily: "Poppins"
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none , 
                      hintText: "Email"
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstant.color1),
                  onPressed: () {
                    ApiService.resetEmail(emaill: email.toString())
                        .then((success) {
                      if (success) {
                        EasyLoading.showSuccess(
                            "Password reset email sent successfully");
                            Navigator.pop(context);
                      } else if (!success) {
                        EasyLoading.showError("try again later");
                      }
                    });
                  },
                  child: Text(
                    "Reset password",
                    style: TextStyle(
                        color: Colors.white , 
                fontFamily: "Poppins" , 
                fontWeight: FontWeight.bold
              ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}