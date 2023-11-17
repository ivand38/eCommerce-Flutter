import 'dart:async';

import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }
  
  getInit() async{
    await Provider.of<ProductProvider>(context,listen: false).getProduct();
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/union.png'))
          ),
        ),
      ),
    );
  }
}