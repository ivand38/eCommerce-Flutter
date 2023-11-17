import 'package:e_commerce/providers/checkout_provider.dart';
import 'package:e_commerce/widget/checkout_card.dart';
import 'package:e_commerce/widget/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/theme.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/auth_provider.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider=Provider.of<CartProvider>(context);
    CheckoutProvider checkoutProvider=Provider.of<CheckoutProvider>(context);
    AuthProvider authProvider=Provider.of<AuthProvider>(context);

    handleCheckout() async{
      setState(() {
        isLoading = true;
      });

      if(await checkoutProvider.checkout(
        authProvider.user.token.toString(), 
        cartProvider.carts, 
        cartProvider.totalPrice(),
      )){
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(context, '/checkoutsuccesspage', (route) => false);
      }
      setState(() {
        isLoading = false;
      });
    }
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
          title: Text('Checkout Details',
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium)),
        ),
      );
    }

    Widget content() {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List Items',
                style: primaryTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(height: 12),
              Column(
                children: cartProvider.carts
                .map(
                  (cart)=>CheckoutCard(cart),
                  )
                  .toList(),
              ),
              SizedBox(height: 30),
              //Address Detail
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: bgColor4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address Detail',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium)),
                    SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image.asset('assets/icon_resto.png',
                                width: 50, height: 50),
                            Image.asset(
                              'assets/garis.png',
                              height: 30,
                            ),
                            Image.asset('assets/icon_loc.png',
                                width: 50, height: 50),
                          ],
                        ),
                        SizedBox(width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Store Location',
                              style: secondaryTextStyle.copyWith(
                                  fontSize: 12, fontWeight: light),
                            ),
                            Text(
                              'Address Location',
                              style: primaryTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                            SizedBox(height: 38,),
                            Text('Your Address',style: secondaryTextStyle.copyWith(fontSize: 12,fontWeight: light),),
                            Text('Jakarta',style: primaryTextStyle.copyWith(fontSize: 14,fontWeight: medium),)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: bgColor4,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payment Summary',style: primaryTextStyle.copyWith(fontSize: 16,fontWeight: medium),),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Product Quantity',style: secondaryTextStyle.copyWith(fontSize: 12),),
                        Text('${cartProvider.totalItems()} Items',style: primaryTextStyle.copyWith(fontSize: 14,fontWeight: medium),)
                      ],
                    ),
                    SizedBox(height: 12,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Product Price',style: secondaryTextStyle.copyWith(fontSize: 12),),
                        Text('\$${cartProvider.totalPrice()}',style: primaryTextStyle.copyWith(fontSize: 14,fontWeight: medium),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping',style: secondaryTextStyle.copyWith(fontSize: 12),),
                        Text('Free',style: primaryTextStyle.copyWith(fontSize: 14,fontWeight: medium),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',style: priceTextStyle.copyWith(fontSize: 14,fontWeight: semiBold),),
                        Text('\$${cartProvider.totalPrice()}',style: priceTextStyle.copyWith(fontSize: 14,fontWeight: semiBold),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Divider(),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: handleCheckout,
                child: isLoading 
                ? Container(
                  margin: EdgeInsets.only(
                    bottom: 30
                  ),
                  child: LoadingButton()) 
                : Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor
                  ),
                  child: Center(child: Text('Checkout Now',style: primaryTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),)),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
