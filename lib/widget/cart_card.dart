import 'package:flutter/material.dart';
import 'package:e_commerce/theme.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../providers/cart_provider.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider=Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      width: 315,
      height: 110,
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(cart.product!.galleries![0].url.toString(),width: 60,height: 60),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  cartProvider.removeCart(cart.id!.toInt());
                },
                child: Row(
                  children: [
                    Image.asset('assets/trash.png',width: 10,height: 12),
                    SizedBox(width: 4,),
                    Text('Remove',style: alertTextStyle.copyWith(fontSize: 12,fontWeight: light))
                  ],
                ),
              )
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cart.product!.name!.toString(),style: primaryTextStyle.copyWith(fontSize: 14,fontWeight: semiBold),),
                SizedBox(height: 2),
                Text(cart.product!.price!.toString(),style: priceTextStyle.copyWith(fontSize: 14))
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector
              (
                onTap: () {
                  cartProvider.addQuantity(cart.id!);
                },
                child: Image.asset('assets/plus.png',width: 24,height: 24,)),
              SizedBox(height: 2,),
              Text(cart.quantity.toString(),style: primaryTextStyle.copyWith(fontSize: 14,fontWeight: medium)),
              SizedBox(height: 2,),
              GestureDetector(
                onTap: () {
                  cartProvider.reduceQuantity(cart.id!);
                },
                child: Image.asset('assets/min.png',width: 24,height: 24,))
            ],
          )
        ],
      ),
    );
  }
}