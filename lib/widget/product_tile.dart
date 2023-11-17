import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/pages/detailproductpage.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product);

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
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryTextColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Image.network(
                product.galleries![0].url.toString(),
                fit: BoxFit.cover,
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category!.name.toString(),
                  style: subtitleTextStyle.copyWith(fontSize: 12),
                ),
                Text(
                  product.name.toString(),
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold,overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                ),
                Text(
                  product.price.toString(),
                  style:
                      priceTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
