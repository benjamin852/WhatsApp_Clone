import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';

import 'package:flash_chat/widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome-screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//this class can also serve as a ticker
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this, //class provides the ticker
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(animationController);

    animationController.addStatusListener((status) {
      print(status);
    });

    //starts the animation
    animationController.forward();

    animationController.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  speed: Duration(milliseconds: 500),
                  textStyle: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Login',
              onPressed: () =>
                  Navigator.pushNamed(context, LoginScreen.routeName),
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              title: 'Register',
              onPressed: () =>
                  Navigator.pushNamed(context, RegistrationScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
