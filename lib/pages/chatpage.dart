import 'package:flutter/material.dart';
import 'package:e_commerce/theme.dart';
import 'package:e_commerce/widget/chat_tile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override

  Widget build(BuildContext context) {
    Widget header(){
    return AppBar(
      backgroundColor: bgColor1,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text('Message Support',
      style: primaryTextStyle.copyWith(
        fontSize: 18,
        fontWeight: medium
      )),
    );
  }

  Widget content(){
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset('assets/headset.png',width: 80,height: 80),
            SizedBox(height: 20),
            Text('Opss no message yet?',style: primaryTextStyle.copyWith(fontSize: 16,fontWeight: medium)),
            SizedBox(height:12),
            Text('You have never done a transaction',style: subtitleTextStyle.copyWith(fontSize: 14)),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 152,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor
              ),
              child: TextButton(onPressed:(){} 
              , child: Text('Explore Store',style: primaryTextStyle.copyWith(fontSize: 16,fontWeight: medium),))
            )
          ],
        ),
      ),
    );
  }
    return Scaffold(
      backgroundColor: bgColor3,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            ChatTile()
          ],
        )),
    );
  }
}