import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rabaa/constant/constant.dart';
import 'package:rabaa/model/userModel.dart';
import 'package:rabaa/view/Dashboard/quiz.dart';
import 'package:rabaa/view/Dashboard/ui_ux.dart';
import 'package:rabaa/viewModel/api_service.dart';

class DashboardScreen extends StatefulWidget {
  final userToken;
  const DashboardScreen({Key? key, required this.userToken}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    ApiService.fetchUserData(token: widget.userToken).then((fetchedUser) {
      setState(() {
        user = fetchedUser;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset("assets/images/student.png")],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Hii, ",
                        style: TextStyle(
                          color: AppConstant.color2,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Text(
                        "${user?.firstName ?? ""} 👋",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(7),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          style: TextStyle(fontFamily: "Poppins"),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Find your Course...",
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Choose Your Course",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizPage(),
                            ),
                          );
                        },
                        child: Text(
                          "More",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppConstant.color2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0XFFef7f84),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                            bottomLeft: Radius.circular(60),
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/dev_web.png"),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Web development",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ui_uxScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 200,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Color(0XFF5587ea),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset("assets/images/ui_ux_designer.png"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "UI UX design",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0XFF2edd92),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(60),
                            topLeft: Radius.circular(60),
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/app_development.png",
                              scale: 3.5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Mobile development",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Color(0XFFe9d259),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Image.asset(
                              "assets/images/marketing.png",
                              scale: 3.5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Marketing",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.interests),
            label: 'Trainings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: 'Exams',
          ),
        ],
        selectedItemColor: AppConstant.color2,
        selectedLabelStyle: GoogleFonts.poppins(),
        unselectedLabelStyle: GoogleFonts.poppins(),
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
              break;
            case 1:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => UiUxScreen()),
              // );
              break;
            case 2:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ProfileScreen()),
              // );
              break;
          }
        },
      ),
    );
  }
}
