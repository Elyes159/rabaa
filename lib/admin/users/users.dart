import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rabaa/viewModel/api_service.dart';

class UsersGet extends StatefulWidget {
  final userToken;
  const UsersGet({Key? key, required this.userToken}) : super(key: key);
  @override
  _UsersGetState createState() => _UsersGetState();
}

class _UsersGetState extends State<UsersGet> {
  late Future<Map<String, dynamic>> _usersDataFuture;
  List<dynamic> _usersData =
      []; // Déclaration de la liste pour stocker les utilisateurs

  @override
  void initState() {
    super.initState();
    _usersDataFuture = ApiService.getListDataUsers(token: widget.userToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Utilisateurs'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _usersDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            Map<String, dynamic> responseData = snapshot.data!;
            List<dynamic> usersData = responseData['data'];
            _usersData =
                usersData; // Stockage des données dans la liste _usersData
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, top: 8, right: 20, left: 230),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFF3CB371),
                    ),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0.80),
                          child: Text(
                            "Create User",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                          label: Text(
                        'Prénom',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontWeight: FontWeight.w700)),
                      )),
                      DataColumn(
                          label: Text(
                        'Email',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontWeight: FontWeight.w700)),
                      )),
                      DataColumn(
                          label: Text(
                        'Rôle',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontWeight: FontWeight.w700)),
                      )),
                    ],
                    rows: _usersData.map((userData) {
                      return DataRow(cells: [
                        DataCell(Text(
                          userData['first_name'] ?? '',
                          style: GoogleFonts.poppins(),
                        )),
                        DataCell(Text(
                          userData['email'] ?? '',
                          style: GoogleFonts.poppins(),
                        )),
                        DataCell(Text(
                          userData['role']['label'] ?? '',
                          style: GoogleFonts.poppins(),
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Shader _gradientColor(int startColor, Color endColor) {
    return LinearGradient(
      colors: [
        Color(startColor),
        endColor,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromLTRB(0, 0, 0, 100));
  }
}
