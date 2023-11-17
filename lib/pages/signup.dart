import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/widget/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/theme.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _passwordvisible=false;
  void toogle(){
    setState(() {
      _passwordvisible = !_passwordvisible;
    });
  }

  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignup() async{
      setState(() {
        isLoading = true;
      });

      if(await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text
      )){
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Register',
              textAlign: TextAlign.center,
            ))
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sign Up',
              style: primaryTextStyle.copyWith(
                  fontSize: 24, fontWeight: semiBold)),
          SizedBox(height: 2),
          Text('Register and Happy Shopping',
              style: subtitleTextStyle.copyWith(fontSize: 14)),
        ],
      );
    }

    Widget fullnameInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Full Name',
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: medium)),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/Username_Icon.png',
                    width: 17,
                    height: 12,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                    style: primaryTextStyle,
                    controller: nameController,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Your Full Name',
                        hintStyle: subtitleTextStyle.copyWith(fontSize: 14)),
                  ))
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget usernameInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username',
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: medium)),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/Username_Icon.png',
                    width: 17,
                    height: 12,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                    style: primaryTextStyle,
                    controller: usernameController,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Your Username',
                        hintStyle: subtitleTextStyle.copyWith(fontSize: 14)),
                  ))
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget emailInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email Address',
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: medium)),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/Email_Icon.png',
                    width: 17,
                    height: 12,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                    style: primaryTextStyle,
                    controller: emailController,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Your Email Address',
                        hintStyle: subtitleTextStyle.copyWith(fontSize: 14)),
                  ))
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget passwordInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Password',
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: medium)),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/Password_Icon.png',
                    width: 17,
                    height: 12,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                    style: primaryTextStyle,
                    controller: passwordController,
                    obscureText: !_passwordvisible,
                    decoration: InputDecoration(
                        hintText: 'Your Password',
                        hintStyle: subtitleTextStyle.copyWith(fontSize: 14),
                        suffixIcon: IconButton(
                              onPressed: (){
                                toogle();
                              }, 
                              icon: Icon(
                                _passwordvisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                                size: 17,
                                color: primaryColor,
                              ))),
                  ))
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget signupButton() {
      return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: TextButton(
          onPressed: () {
            handleSignup();
          },
          child: Text(
            'Sign Up',
            style: primaryTextStyle,
          ),
        ),
      );
    }

    Widget footer() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already Have an Account?',
            style: subtitleTextStyle.copyWith(fontSize: 12),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Sign In',
                style: purpleTextStyle.copyWith(fontSize: 12),
              ))
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(height: 70),
              fullnameInput(),
              SizedBox(height: 20),
              usernameInput(),
              SizedBox(height: 20),
              emailInput(),
              SizedBox(height: 20),
              passwordInput(),
              SizedBox(height: 30),
              isLoading ? LoadingButton() : signupButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
