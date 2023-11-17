import 'package:e_commerce/pages/homepage.dart';
import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';
import 'cartpage.dart';
import 'chatpage.dart';
import 'favpage.dart';
import 'profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cartpage');
        },
        backgroundColor: secondaryColor,
        child: Image.asset('assets/Cart.png', width: 20, height: 22),
      );
    }

    Widget buttonNavbar() {
      return ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: bgColor4,
              currentIndex: _currentindex,
              onTap: (value) {
                setState(() {
                  _currentindex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset('assets/Home.png',
                          height: 20, 
                          width: 18,
                          color: _currentindex == 0 ? primaryColor : Color(0xff808191),)),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: Image.asset(
                          'assets/Chat.png',
                          height: 20,
                          width: 18,
                          color: _currentindex == 1 ? primaryColor : Color(0xff808191)
                        )),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: Image.asset('assets/Fav.png',
                            height: 20, 
                            width: 18,
                            color: _currentindex == 2 ? primaryColor : Color(0xff808191))),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset('assets/Profile.png',
                          height: 20, 
                          width: 18,
                          color: _currentindex == 3 ? primaryColor : Color(0xff808191)),
                    ),
                    label: '')
              ]),
        ),
      );
    }

    Widget bodyPage() {
      switch (_currentindex) {
        case 0:
          return HomePage();
        case 1:
          return ChatPage();
        case 2:
          return FavPage();
        case 3:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: _currentindex==0 ? bgColor1 : bgColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buttonNavbar(),
      body: bodyPage(),
    );
  }
}
