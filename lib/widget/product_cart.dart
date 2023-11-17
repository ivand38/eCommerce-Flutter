import 'package:e_commerce/pages/detailproductpage.dart';
import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=> DetailProductPage(product)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 30),
        width: 215,
        height: 278,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryTextColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30
            ),
            Image.network(product.galleries![0].url.toString(),
            width: 215,
            height: 120,
            fit: BoxFit.cover,),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.category!.name.toString(),
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12
                  )),
                  Text(product.name.toString(),
                  style: blackTextStyle.copyWith(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18,
                    fontWeight: semiBold
                  ),
                  maxLines: 1,),
                  Text(product.price.toString(),
                  style: priceTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium
                  ))
                ],
              ),
            )
    
          ],
        ),
      ),
    );
  }
}