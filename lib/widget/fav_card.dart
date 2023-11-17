import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

class FavCard extends StatelessWidget {
  final ProductModel product;
  FavCard(this.product);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12)
      ),
      width: 315,
      height: 84,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(left: 12,top: 10,bottom: 12,right: 24),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(product.galleries![0].url.toString(),width: 60,height: 60),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(product.name.toString(),style: primaryTextStyle.copyWith(fontSize: 14)),
                SizedBox(height: 2,),
                Text(product.price.toString(),style: priceTextStyle.copyWith(fontSize: 14),)
              ],
            ),
          ),
          GestureDetector
          ( onTap: (){
            wishlistProvider.setProduct(product);
          },
            child: Image.asset('assets/lovebutton.png',width: 34,height: 34,))
        ],
      ),
    );
  }
}