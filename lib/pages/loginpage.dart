import 'package:e_commerce/theme.dart';
import 'package:e_commerce/widget/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordvisible=false;
  void toogle(){
    setState(() {
      _passwordvisible = !_passwordvisible;
    });
  }

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogin() async{
      setState(() {
        isLoading = true;
      });

      if(await authProvider.login(
        email: emailController.text,
        password: passwordController.text
      )){
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
            ))
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login',
                style: primaryTextStyle.copyWith(
                    fontSize: 24, fontWeight: semiBold)),
            SizedBox(height: 2),
            Text('Sign in to Continue',
                style: subtitleTextStyle.copyWith(fontSize: 14)),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        child: Column(
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
                      controller: emailController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: subtitleTextStyle.copyWith(fontSize: 14)),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput(){
       return Container(
        child: Column(
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
                        controller: passwordController,
                        style: primaryTextStyle,
                        obscureText: !_passwordvisible,
                        decoration: InputDecoration(
                            hintText: 'Your Password',
                            hintStyle:
                                subtitleTextStyle.copyWith(fontSize: 14),
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
        ),
      );
    }

    Widget loginButton(){
      return Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: TextButton(
                  onPressed: () {
                    handleLogin();
                  },
                  child: Text(
                    'Sign In',
                    style: primaryTextStyle,
                  ),
                ),
              );
    }

    Widget footer(){
      return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont Have an account?',
                      style: subtitleTextStyle.copyWith(fontSize: 12),
                    ),
                    TextButton(
                        onPressed: () =>Navigator.pushNamed(context, '/signup'),
                        child: Text(
                          'Sign Up',
                          style: purpleTextStyle.copyWith(fontSize: 12),
                        ))
                  ],
                ),
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
              emailInput(),
              SizedBox(height: 20),
              passwordInput(),
              SizedBox(height: 30),
              isLoading ? LoadingButton() : loginButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
