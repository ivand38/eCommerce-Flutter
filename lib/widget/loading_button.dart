import 'package:flutter/material.dart';
import 'package:e_commerce/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: TextButton(
          onPressed: () {
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(
                  primaryTextColor
                ),),
              ),
              SizedBox(width: 4,),
              Text(
                'Loading',
                style: primaryTextStyle,
              ),
            ],
          ),
        ),
      );
  }
}