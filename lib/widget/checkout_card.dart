import 'package:flutter/material.dart';
import 'package:e_commerce/theme.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../providers/cart_provider.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;
  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider=Provider.of<CartProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      height: 100,
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(cart.product!.galleries![0].url.toString(),width: 60,height: 60),
          ),
          SizedBox(height: 10),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cart.product!.name!,style: primaryTextStyle.copyWith(fontSize: 14,fontWeight: semiBold),),
                SizedBox(height: 2),
                Text("\$${cartProvider.totalPrice()}",style: priceTextStyle.copyWith(fontSize: 14))
              ],
            ),
          ),
          Text('${cartProvider.totalItems()} Items',style: secondaryTextStyle.copyWith(fontSize: 12))
        ],
      ),
    );
  }
}