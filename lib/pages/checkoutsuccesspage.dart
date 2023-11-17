import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSize header(){
      return PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: AppBar(
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Checkout Success',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium
        )),
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
              Text('You Made a Transaction',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium)),
              SizedBox(height: 12),
              Text('Stay at home while we\nprepare your dream shoes',
                  style: subtitleTextStyle.copyWith(fontSize: 14),
                  textAlign: TextAlign.center),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 196,
                  height: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryColor),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      },
                      child: Text(
                        'Order Other Shoes',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      )))
            ],
          ),
        ),
      );
    }
    
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: Column(
        children: [
          content()
        ],
      ),
    );
  }
}