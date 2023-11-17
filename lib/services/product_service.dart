import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:e_commerce/models/product_model.dart';

class ProductService {
  String baseUrl = 'https://apingoding.000webhostapp.com/api';

  Future<List<ProductModel>> getProduct() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data){
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }

}