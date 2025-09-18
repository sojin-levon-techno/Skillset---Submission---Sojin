import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:skilltest/core/constants/constants.dart';
import 'package:skilltest/features/home/models/banner_model.dart';

class BannerRemoteRepository {
 static Future<List<BannerModel>> fetchBanner() async {
    final url = Uri.parse("$baseUrl/banners");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as List;
        return result.map((x) => BannerModel.fromJson(x)).toList();
      } else {
        throw response.body;
      }
    } catch (e) {
      log("Banner API Call", name: "BannerRemoteRepository", error: e);
      rethrow;
    }
  }
}
