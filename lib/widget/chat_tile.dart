import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/detailchat');
      },
      child: Container(
        margin: EdgeInsets.only(left: 30,right: 30,top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/logo.png',width: 54),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shoe Store',style: primaryTextStyle.copyWith(fontSize: 15)),
                      Text('Good Night',style: subtitleTextStyle.copyWith(fontSize: 14,fontWeight: light),overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
                Text('Now',style: subtitleTextStyle.copyWith(fontSize: 10),),
              ],
            ),
         
            Divider(thickness: 1,color: Color(0xff2B2939))
          ],
        ),
        
      ),
    );
  }
}