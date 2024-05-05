import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rabaa/constant/constant.dart';
import 'package:rabaa/view/dashboard.dart';

class GetDataScreen extends StatefulWidget {
  const GetDataScreen({super.key});

  @override
  State<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () async {
      final storage = FlutterSecureStorage();
      var token = await storage.read(key: "token");
      Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (context, animation, secondaryAnimation) =>
              DashboardScreen(
                userToken: token,
              )));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.color2,
      body: Center(
        child: CircularProgressIndicator(
          color: AppConstant.color1,
        ),
      ),
    );
  }
}
