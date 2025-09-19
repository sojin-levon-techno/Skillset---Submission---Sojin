import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:skilltest/core/constants/constants.dart';

class AuthRemoteRepository {
  static Future<Map<String, dynamic>> verifyUser({
    required String phoneNumber,
  }) async {
    final url = Uri.parse("$baseUrl/verify/");
    final headers = {"Content-Type": "application/json"};

    try {
      final body = jsonEncode({"phone_number": phoneNumber});

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw response.body;
      }
    } catch (e) {
      throw "$e";
    }
  }

  static Future<Map<String, dynamic>> loginOrRegister({
    required String phoneNumber,
    required String firstName,
  }) async {
    final url = Uri.parse("$baseUrl/login-register/");
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({
      "phone_number": phoneNumber,
      "first_name": firstName,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw response.body;
      }
    } catch (e) {
      log("login/register", error: e, name: "loginOrRegisterRepository");
      throw "$e";
    }
  }
}
