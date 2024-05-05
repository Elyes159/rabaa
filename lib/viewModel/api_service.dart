//ViewModel

import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rabaa/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:rabaa/model/userModel.dart';

class ApiService {
  static Future<bool> login({required emaill, required passwordd}) async {
    final storage = FlutterSecureStorage();
    String url = '${AppConstant.base_url}/auth/login';

    Map<String, String> body = {
      'email': emaill,
      'password': passwordd,
    };
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
      );
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      var message = jsonResponse['message'];

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        var token = jsonResponse['token'];
        print("token ===> $token");
        await storage.write(key: "token", value: token);

        return true;
      } else {
        EasyLoading.showError(message);
        print(response.body);
        print('Failed to login: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  static Future<bool> signup(
      {required first_name,
      required last_name,
      required emaill,
      required passwordd}) async {
    String url = '${AppConstant.base_url}/auth/register';

    Map<String, dynamic> body = {
      'company_id': 1,
      'first_name': first_name,
      'last_name': last_name,
      'email': emaill,
      'password': passwordd,
    };

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      var message = jsonResponse['message'];

      if (response.statusCode == 200 || response.statusCode == 201) {
        EasyLoading.showSuccess(message);
        print('Response: ${response.body}');
        return true;
      } else {
        EasyLoading.showError(message);
        print('Failed to sign up: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  static Future<bool> resetEmail({
    required emaill,
  }) async {
    String url =
        '${AppConstant.base_url}/auth/email/send_forgot_password_email?email=$emaill';
    print(emaill);
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('Password reset email sent successfully.');
        return true;
      } else {
        print(
            'Failed to send password reset email. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error sending request: $e');
      return false;
    }
  }

  static Future<User?> fetchUserData({
    required String token,
  }) async {
    String url = '${AppConstant.base_url}/auth/user';

    try {
      // Send GET request with authorization header
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      // Check the status code of the response
      if (response.statusCode == 200) {
        // Parse the response body
        Map<String, dynamic> userData = json.decode(response.body);
        // Convert the Map to a User object using the factory method
        User user = User.fromJson(userData);
        return user;
      } else {
        print('Failed to fetch user data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  static Future<Map<String, dynamic>> getListDataUsers({
    required String token,
  }) async {
    String url = '${AppConstant.base_url}/users?company_id=1';
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Si la requête est réussie, renvoyer la carte des données
        Map<String, dynamic> dataMap = json.decode(response.body);
        return dataMap;
      } else {
        print('Failed to get list data. Status code: ${response.statusCode}');
        return {};
      }
    } catch (e) {
      print('Error getting list data: $e');
      return {};
    }
  }
}
