import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products=[];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProduct() async {
    try {
      List<ProductModel> products = await ProductService().getProduct();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}