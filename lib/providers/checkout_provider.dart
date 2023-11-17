import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/services/checkout_service.dart';
import 'package:flutter/material.dart';

class CheckoutProvider with ChangeNotifier {
   Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      if (await CheckoutService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}