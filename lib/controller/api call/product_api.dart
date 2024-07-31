import 'dart:convert';

import 'package:practice_api_r/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService{
static Future<ProductModel> apiService() async {
    try {
      var response = await http.get(Uri.parse(
          "https://cit-ecommerce-codecanyon.bandhantrade.com/api/app/v1/products"));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return ProductModel.fromJson(data);
      } else {
        return ProductModel.fromJson(data);
      }
    } catch (e) {
      print('Error fetching products: $e');
      throw e;
    }
  }
}
