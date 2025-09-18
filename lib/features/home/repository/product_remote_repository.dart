import 'dart:convert';
import 'dart:developer';

import 'package:skilltest/core/constants/constants.dart';
import 'package:skilltest/features/home/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteRepository {
  static   Future<List<ProductModel>> fetchProductResult() async {
    final url = Uri.parse("$baseUrl/products");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as List;
        return result.map((x) => ProductModel.fromJson(x)).toList();
      } else {
        throw response.body;
      }
    } catch (e) {
      log("Product API Call", name: "ProductRemoteRepository", error: e);
      rethrow;
    }
  }
}
