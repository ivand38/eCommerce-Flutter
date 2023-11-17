import 'package:flutter/material.dart';
import 'package:e_commerce/theme.dart';
import 'package:e_commerce/widget/fav_card.dart';
import 'package:e_commerce/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';


class FavPage extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

     PreferredSize header(){
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Favorite Product',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium
        )),
      ),
    );
  }
  
  Widget emptyContent(){
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/love.png',width: 80,height: 80),
            SizedBox(height: 20),
            Text('You dont\'have dream shoes?',style: primaryTextStyle.copyWith(fontSize: 16,fontWeight: medium)),
            SizedBox(height:12),
            Text('Let\'s find your dream shoes',style: subtitleTextStyle.copyWith(fontSize: 14)),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 152,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor
              ),
              child: TextButton(onPressed:(){
              } 
              , child: Text('Explore Store',style: primaryTextStyle.copyWith(fontSize: 16,fontWeight: medium),))
            )
          ],
        ),
      ),
    );
  }

  Widget wishlist(){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(30),
        child: ListView(
          children:wishlistProvider.wishlist
          .map(
            (product) => FavCard(product)
        )
        .toList(),
      ),
    ));
  }

    return Scaffold(
      appBar: header(),
      body: SafeArea(
        child: Column(
          children: [
           wishlistProvider.wishlist.length == 0 ? emptyContent():wishlist(),
          ],
        )),
      backgroundColor: bgColor3,
    );
  }
}