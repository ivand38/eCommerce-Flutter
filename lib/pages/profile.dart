import 'package:flutter/material.dart';
import 'package:e_commerce/theme.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    PreferredSize header() {
      return PreferredSize(
          preferredSize: Size.fromHeight(124),
          child: Container(
            padding: EdgeInsets.all(30),
            color: bgColor1,
            child: Row(
              children: [
                Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(user.profilePhotoUrl.toString()))
              ),
            ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hello, '+user.name.toString(),
                          style: primaryTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold)),
                      SizedBox(height: 4),
                      Text('@'+user.username.toString(),
                          style: subtitleTextStyle.copyWith(fontSize: 16))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
                    child:
                        Image.asset('assets/exit.png', width: 20, height: 20))
              ],
            ),
          ));
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            Icon(Icons.chevron_right, color: secondaryTextColor)
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Account',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold)),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/editprofile'),
              child: menuItem('Edit Profile')),
            menuItem('Your Orders'),
            menuItem('Help'),
            SizedBox(height: 30),
            Text('General',
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold)),
            menuItem('Privacy \& Policy'),
            menuItem('Term of Service'),
            menuItem('Rate App'),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
