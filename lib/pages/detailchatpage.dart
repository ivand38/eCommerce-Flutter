import 'package:flutter/material.dart';
import 'package:e_commerce/theme.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: bgColor1,
          centerTitle: true,
          title: Row(
            children: [
              Image.asset(
                'assets/logo_online.png',
                width: 54,
                height: 54,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shoe Store',
                      style: primaryTextStyle.copyWith(fontSize: 14)),
                  Text(
                    'Online',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 14, fontWeight: light),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget productPreview() {
      return Container(
        width: 225,
        height: 74,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: bgPreview,
            border: Border.all(color: strokePreview)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                child: Image.asset(
                  'assets/sepatu4.png',
                  width: 54,
                  height: 54,
                ),
                borderRadius: BorderRadius.circular(12)),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Court Vision 2',
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$54.12',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/close.png',
              width: 22,
              height: 22,
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.all(30),
        children: [
          ChatBubble(
            clipper: ChatBubbleClipper3(type: BubbleType.sendBubble),
            elevation: 0.0,
            backGroundColor: bgColor5,
            margin: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/sepatu12.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Court Vision 2.0 Shoes',
                          style: primaryTextStyle.copyWith(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4,),
                        Text('\$57.11',style: priceTextStyle.copyWith(fontSize: 14))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 109,
                      height: 41,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: primaryColor
                        ),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: TextButton(
                        onPressed: (){}, 
                        child: Text('Add to Cart',style: purpleTextStyle,),
                        ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 109,
                      height: 41,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: primaryColor
                      ),
                      child: TextButton(
                        onPressed: (){}, 
                        child: Text('Buy Now',style: blackTextStyle,),
                        ),
                    )
                  ],
                )
              ],
            ),
          ),
          BubbleSpecialThree(
            text: 'Hi, this item still available?',
            textStyle: primaryTextStyle.copyWith(fontSize: 14),
            color: bgColor5,
            isSender: true,
          ),
          SizedBox(
            height: 12,
          ),
          BubbleSpecialThree(
            text: 'Good Night, This item only available in size 43 and 44',
            textStyle: primaryTextStyle.copyWith(fontSize: 14),
            color: bgColor4,
            isSender: false,
          )
        ],
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 270,
                height: 45,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: bgColor4, borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: TextFormField(
                  style: primaryTextStyle.copyWith(fontSize: 14),
                  decoration: InputDecoration.collapsed(
                      hintText: "Type Message...",
                      hintStyle: subtitleTextStyle),
                )),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Image.asset('assets/send.png', width: 20, height: 16),
                ),
              )
            ]),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
