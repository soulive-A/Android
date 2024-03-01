import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soulive/design/FontStyles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final int Splash_time = 3000;
  Timer? _splashTimer;
  String _next = '/home';

  @override
  void initState(){
    super.initState();
    setTimer();
  }

  @override
  void dispose(){
    removeTimer();
    super.dispose();
  }

  void checkNext(String next){
    removeTimer();
    context.go(next);
  }

  void removeTimer(){
    if(_splashTimer != null && _splashTimer!.isActive){
      _splashTimer?.cancel();
      _splashTimer = null;
    }
  }

  void setTimer(){
    if(_splashTimer?.isActive ?? false){
      return;
    }
    _splashTimer = Timer(Duration(milliseconds: Splash_time), (){
      if(mounted){
        checkNext(_next);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/ic_logo.png', width: 154, height: 317),
                  //SizedBox(height: screenHeight*0.0375,),
                  Text(
                      'SOUL MODEL',
                      style: FontStyles.logoFont.copyWith(color:Colors.white)
                  )
                ],
              ),
            )
          ],
        ),

    );
  }

}