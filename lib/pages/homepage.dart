import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widget/product_cart.dart';
import 'package:e_commerce/widget/product_tile.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/providers/auth_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, '+ user.name.toString(),
                    style: primaryTextStyle.copyWith(fontSize: 24)),
                Text('@'+user.username.toString(),
                    style: subtitleTextStyle.copyWith(fontSize: 16)),
              ],
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(user.profilePhotoUrl.toString()))
              ),
            )
          ],
        ),
      );
    }

    Widget categorychips() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: Row(
            children: [
              SizedBox(width: 30),
              Container(
                width: 83,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor),
                child: Center(
                  child: Text(
                    'All shoes',
                    style: primaryTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                width: 77,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleTextColor),
                    color: transparentColor),
                child: Center(
                  child: Text(
                    'Running',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                width: 76,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleTextColor),
                    color: transparentColor),
                child: Center(
                  child: Text(
                    'Training',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                width: 98,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleTextColor),
                    color: transparentColor),
                child: Center(
                  child: Text(
                    'Basketball',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Container(
                width: 63,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleTextColor),
                    color: transparentColor),
                child: Center(
                  child: Text(
                    'Hiking',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
              ),
              SizedBox(width: 30)
            ],
          ),
        ),
      );
    }

    Widget popular() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text('Popular Product',
                    style: primaryTextStyle.copyWith(
                        fontSize: 22, fontWeight: semiBold)),
              ],
            ),
            SizedBox(
              height: 14,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 30),
                  Row(
                    children: productProvider.products
                    .map(
                      (product) => ProductCard(product))
                    .toList()
                    ,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget arrival() {
      return Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Text(
              'New Arrival',
              style:
                  primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
            ),
            SizedBox(height: 14),
            Column(
              children: productProvider.products
                    .map(
                      (product) => ProductTile(product))
                    .toList(),
            )
            
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      body: SafeArea(
          child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              SizedBox(height: 40),
              categorychips(),
              SizedBox(height: 30),
              popular(),
              SizedBox(height: 30),
              arrival()
            ],
          ),
        ),
      )),
    );
  }
}
