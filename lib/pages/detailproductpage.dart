import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/providers/wishlist_provider.dart';
import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class DetailProductPage extends StatefulWidget {
  final ProductModel product;
  DetailProductPage(this.product);
  

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {

  List similarimages = [
    'assets/sepatu1.png',
    'assets/sepatu2.png',
    'assets/sepatu3.png',
    'assets/sepatu13.png',
    'assets/sepatu12.png',
    'assets/sepatu11.png',
    'assets/sepatu7.png',
    'assets/sepatu8.png',
    'assets/sepatu5.png',
    'assets/sepatu10.png'
  ];

  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider=Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async{
      return showDialog(
        context: context, 
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2*30),
          child: AlertDialog(
            backgroundColor: bgColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.close,color: primaryTextColor,size: 25),
                    ),
                  ),
                  Image.asset('assets/checkmark.png',width: 100,height: 100,),
                  SizedBox(height: 12),
                  Text('Hurray :)',style: primaryTextStyle.copyWith(fontSize: 18,fontWeight: semiBold),),
                  SizedBox(height: 12),
                  Text('Item added succesfully',style: secondaryTextStyle.copyWith(fontSize: 14)),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/cartpage');
                    },
                    child: Container(
                      width: 154,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: primaryColor
                      ),
                      child: Center(
                        child: Text('View My Cart',style: primaryTextStyle.copyWith(fontSize: 16,fontWeight: medium),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex == index ? primaryColor : Color(0xffC4C4C4)),
      );
    }

    Widget header() {
      int index = 0;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: bgColor1,
                    )),
                Icon(
                  Icons.shopping_bag,
                  color: bgColor1,
                )
              ],
            ),
          ),
          CarouselSlider(
              items: widget.product.galleries!
                  .map((image) => Image.network(
                        image.url.toString(),
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.product.galleries!.map((e) {
                return indicator(index++);
              }).toList())
        ],
      );
    }

    Widget similarShoesCard(String imageUrl){
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: AssetImage(imageUrl))
        ),
      );
    }
    
    Widget content() {
      int index =-1;

      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
            color: bgColor1,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30,right: 30,left: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.name.toString(),
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18, fontWeight: semiBold)),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            widget.product.category!.name.toString(),
                            style: secondaryTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        wishlistProvider.setProduct(widget.product);
                        if(wishlistProvider.isWishlist(widget.product)){
                           ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            duration: Duration(seconds: 2),
                            content: Text('Has been added to the Wishlist',textAlign: TextAlign.center,))
                        );
                        } else{
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            duration: Duration(seconds: 2),
                            content: Text('Has been remove from the Wishlist',textAlign: TextAlign.center,))
                        );
                        }
                      },
                      child: Image.asset(
                        wishlistProvider.isWishlist(widget.product)
                        ? 'assets/lovebutton.png'
                        : 'assets/love_inactive.png',width: 46,height: 46,),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: 350,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: bgColor2, borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price Starts from',
                        style: primaryTextStyle.copyWith(fontSize: 14)),
                    Text(
                      widget.product.price.toString(),
                      style: priceTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Description',
                  style:
                      primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                ),
              ),
              SizedBox(height: 12),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  widget.product.description.toString(),
                  style:
                      subtitleTextStyle.copyWith(fontSize: 14, fontWeight: light),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Similar Shoes',style: primaryTextStyle.copyWith(fontSize: 14,fontWeight: medium),)),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                      children: similarimages.map((image){
                        index++;
                        return Container(
                          margin: EdgeInsets.only(left: index == 0 ? 30 : 0),
                          child: similarShoesCard(image));
                      }).toList(),
                    ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detailchat');
                      },
                      child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: bgColor1,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: primaryColor)
                        ),
                        child: Center(child: Image.asset('assets/chat_purple.png',width: 23,height: 23)),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          cartProvider.addCart(widget.product);
                          showSuccessDialog();
                        },
                        child: Container(
                          width: 280,
                          height: 54,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Center(
                            child: Text('Add To Cart',style: primaryTextStyle.copyWith(fontSize: 16,fontWeight: semiBold),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor6,
      body: ListView(
        children: [header(), content()],
      ),
    );
  }
}
