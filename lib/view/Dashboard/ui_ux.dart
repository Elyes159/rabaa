import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ui_uxScreen extends StatefulWidget {
  const ui_uxScreen({super.key});

  @override
  State<ui_uxScreen> createState() => _ui_uxScreenState();
}

class _ui_uxScreenState extends State<ui_uxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF5587ea),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Color(0XFF5587ea),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/images/ui_ux_designer.png",
                height: 220,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UI/UX",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                      Text(
                        "Design",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.purple.shade300,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            child: Center(
                                child: Text(
                              "Playlist",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        child: Material(
                          color: Colors.white,
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.pink.shade400,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              title: Text("data"),
                              subtitle: Text("data"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
