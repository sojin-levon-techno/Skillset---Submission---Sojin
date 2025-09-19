import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:skilltest/core/constants/constants.dart';
import 'package:skilltest/core/helper/secure_storage.dart';
import 'package:skilltest/features/wishlist/models/wishlist_model.dart';

class WishlistRemoteRepository {
  static Future<List<WishListModel>> fetchWishlist() async {
    final url = Uri.parse("$baseUrl/wishlist/");
    final token = await SecureStorageHelper.read(key: "jwt_token");
    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as List;
        return result.map((x) => WishListModel.fromJson(x)).toList();
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> wishListOperation(String id) async {
    final url = Uri.parse("$baseUrl/add-remove-wishlist/");
    final token = await SecureStorageHelper.read(key: "jwt_token");
    final headers = {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
    };
    final body = jsonEncode({"product_id": id});

    try {
      final response = await http.post(url, body: body, headers: headers);
      if (response.statusCode == 201 || response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return json["message"];
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      log("wishlist", error: e, name: "wishListOperation");
      rethrow;
    }
  }
}
