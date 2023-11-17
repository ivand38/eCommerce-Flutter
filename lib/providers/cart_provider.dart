import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts=[];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product){
    if(productExist(product)){
      int index = _carts.indexWhere((element) => element.product!.id == product.id);
      _carts[index].quantity=_carts[index].quantity! + 1;
    } else{
      _carts.add(CartModel(
        id: _carts.length,
        product: product,
        quantity: 1
      ));
    }
    notifyListeners();
  }

  removeCart(int id){
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id){
    _carts[id].quantity=_carts[id].quantity! + 1;
    notifyListeners();
  }

  reduceQuantity(int id){
    _carts[id].quantity=_carts[id].quantity! - 1;
    if(_carts[id].quantity==0){
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems(){
    int totalItem=0;
    for (var item in _carts) {
      totalItem+=item.quantity!.toInt();
    }
    return totalItem;
  }

  totalPrice(){
    double totalPrice = 0;
    for (var item in _carts) {
      totalPrice+=(item.quantity!*item.product!.price!);
    }
    return totalPrice;
  }

  productExist(ProductModel product){
    if(_carts.indexWhere((element)=>element.product!.id == product.id) == -1){
      return false;
    } else{
      return true;
    }
  }
}