import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rabaa/admin/users/users.dart';

class AdminMain extends StatefulWidget {
  @override
  _AdminMainState createState() => _AdminMainState();
}

// Color(0xFF3CB371),
class _AdminMainState extends State<AdminMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Main'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w300)),
                  ),
                  Text(
                    'Team',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF3CB371),
                            fontSize: 40,
                            fontWeight: FontWeight.w300)),
                  ),
                ],
              )),
            ),
            ListTile(
              leading: Icon(Icons.dashboard,
                  color: Colors.grey[
                      600]), // Remplacez 'some_icon' par l'icône que vous souhaitez utiliser
              title: Text(
                'Dashboard',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey[600])),
              ),
              onTap: () {
                // Action à effectuer lors du clic sur l'élément 1
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book,
                  color: Colors.grey[
                      600]), // Remplacez 'some_icon' par l'icône que vous souhaitez utiliser
              title: Text(
                'Trainings',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey[600])),
              ),
              onTap: () {
                // Action à effectuer lors du clic sur l'élément 1
              },
            ),
            ListTile(
              leading: Icon(Icons.quiz,
                  color: Colors.grey[
                      600]), // Remplacez 'some_icon' par l'icône que vous souhaitez utiliser
              title: Text(
                'Quizzes',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey[600])),
              ),
              onTap: () {
                // Action à effectuer lors du clic sur l'élément 1
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment,
                  color: Colors.grey[
                      600]), // Remplacez 'some_icon' par l'icône que vous souhaitez utiliser
              title: Text(
                'Exams',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey[600])),
              ),
              onTap: () {
                // Action à effectuer lors du clic sur l'élément 1
              },
            ),
            ListTile(
              leading: Icon(Icons.person,
                  color: Colors.grey[
                      600]), // Remplacez 'some_icon' par l'icône que vous souhaitez utiliser
              title: Text(
                'Users',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey[600])),
              ),
              onTap: () async {
                final storage = FlutterSecureStorage();
                var token = await storage.read(key: "token");
                Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        UsersGet(
                          userToken: token,
                        )));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.category,
                color: Colors.grey[600],
              ), // Remplacez 'some_icon' par l'icône que vous souhaitez utiliser
              title: Text(
                'Categories',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey[600])),
              ),
              onTap: () {
                // Action à effectuer lors du clic sur l'élément 1
              },
            ),
            ListTile(
              leading: Icon(Icons.tag,
                  color: Colors.grey[
                      600]), // Remplacez 'some_icon' par l'icône que vous souhaitez utiliser
              title: Text(
                'Tags',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey[600])),
              ),
              onTap: () {
                // Action à effectuer lors du clic sur l'élément 1
              },
            ),
            ListTile(
              leading: Icon(Icons.settings,
                  color: Colors.grey[
                      600]), // Remplacez 'some_icon' par l'icône que vous souhaitez utiliser
              title: Text(
                'Settings',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey[600])),
              ),
              onTap: () {
                // Action à effectuer lors du clic sur l'élément 1
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Contenu de la page'),
        ),
      ),
    );
  }
}
