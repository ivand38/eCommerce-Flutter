import 'package:e_commerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/theme.dart';
import 'package:e_commerce/widget/cart_card.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider=Provider.of<CartProvider>(context);
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: bgColor1,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
            Icons.arrow_back_ios,
            color: primaryTextColor,
            size: 15,
          )),
          title: Text('Your Cart',
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium)),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/cart_icon.png', width: 79, height: 69),
              SizedBox(height: 20),
              Text('Opss, Your Cart is Empty',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium)),
              SizedBox(height: 12),
              Text('Let\'s find your shoes',
                  style: subtitleTextStyle.copyWith(fontSize: 14)),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 152,
                  height: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryColor),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      },
                      child: Text(
                        'Explore Store',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      )))
            ],
          ),
        ),
      );
    }

    Widget cartlist(){
      return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: cartProvider.carts
                    .map(
                      (carts) => CartCard(carts))
                    .toList(),
      );
    }

    Widget customBottomNav(){
      return Container(
        margin: EdgeInsets.all(30),
        height: 165,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal',style: primaryTextStyle.copyWith(fontSize: 14),),
                Text('\$${cartProvider.totalPrice()}',style: priceTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),)
              ],
            ),
            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 30),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/checkoutpage');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor
                ),
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Continue to Checkout',style: primaryTextStyle.copyWith(fontSize: 16,fontWeight: semiBold)),
                    Icon(Icons.arrow_forward,color: primaryTextColor,size: 14,)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      body: Column(
        children: [
          header(),
          cartProvider.carts.length == 0 ?content(): cartlist()
        ],
      ),
      bottomNavigationBar:  cartProvider.carts.length == 0 ? SizedBox():customBottomNav(),
    );
  }
}
