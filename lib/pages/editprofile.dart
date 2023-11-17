import 'package:flutter/material.dart';
import 'package:e_commerce/theme.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/models/user_model.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    PreferredSize header(){
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close,color: primaryTextColor)),
            Text('Edit Profile',
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium
            )),
            Icon(Icons.check,color: primaryColor,)
          ],
        ),
      ),
    );
  }

  Widget nameInput(){
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name',style: secondaryTextStyle.copyWith(fontSize: 13)),
          TextFormField(
            decoration: InputDecoration(
              hintText: user.name.toString(),
              hintStyle: primaryTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryTextColor
                )
              )
            ),
            style: primaryTextStyle,
          )
        ],
      ),
    );
  }

  Widget usernameInput(){
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username',style: secondaryTextStyle.copyWith(fontSize: 13)),
          TextFormField(
            decoration: InputDecoration(
              hintText: user.username,
              hintStyle: primaryTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryTextColor
                )
              )
            ),
            style: primaryTextStyle,
          )
        ],
      ),
    );
  }

  Widget emailInput(){
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email',style: secondaryTextStyle.copyWith(fontSize: 13)),
          TextFormField(
            decoration: InputDecoration(
              hintText: user.email,
              hintStyle: primaryTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryTextColor
                )
              )
            ),
            style: primaryTextStyle,
          )
        ],
      ),
    );
  }

  Widget content(){
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(user.profilePhotoUrl.toString()),fit: BoxFit.fill)
              ),
            ),
          ),
          SizedBox(height: 30),
          nameInput(),
          SizedBox(height: 24),
          usernameInput(),
          SizedBox(height: 24),
          emailInput()

        ],
      ),
    );
  }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}