import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:shamo/models/product_model.dart';

class productService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';
  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse('$baseUrl/products');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.formJson(item));
      }
      return products;
    } else {
      throw Exception('gagal get products!');
    }
  }
}
