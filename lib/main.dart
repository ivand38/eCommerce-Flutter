import 'package:e_commerce/pages/cartpage.dart';
import 'package:e_commerce/pages/checkoutpage.dart';
import 'package:e_commerce/pages/checkoutsuccesspage.dart';
import 'package:e_commerce/pages/mainpage.dart';
import 'package:e_commerce/pages/loginpage.dart';
import 'package:e_commerce/pages/signup.dart';
import 'package:e_commerce/pages/splashscreen.dart';
import 'package:e_commerce/pages/homepage.dart';
import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/checkout_provider.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/pages/detailchatpage.dart';
import 'package:e_commerce/pages/editprofile.dart';
import 'package:provider/provider.dart';
import 'pages/detailproductpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AuthProvider()),
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
        ChangeNotifierProvider(create: (context)=>WishlistProvider()),
        ChangeNotifierProvider(create: (context)=>CartProvider()),
        ChangeNotifierProvider(create: (context)=>CheckoutProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => SplashScreen(),
          '/login':(context) => LoginPage(),
          '/signup':(context) => SignupPage(),
          '/home':(context) => MainPage(),
          '/detailchat':(context) => DetailChatPage(),
          '/editprofile':(context) => EditProfilePage(),
          '/cartpage':(context) => CartPage(),
          '/checkoutpage':(context)=>CheckoutPage(),
          '/checkoutsuccesspage':(context)=>CheckoutSuccessPage()
        },
      ),
    );
  }
}
