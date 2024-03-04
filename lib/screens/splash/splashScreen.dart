import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/screens/screen_index.dart';

import '../../design/SoulliveIcon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final int Splash_time = 2000;
  Timer? _splashTimer;
  //String _next = '/home';

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

  // void checkNext(String next){
  //   removeTimer();
  //   context.go(next);
  // }

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
        removeTimer();
        Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (context) => const ScreenIndex(index: 0)));
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
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/ic_logo.png', width: 49, height: 55,),
                    //SizedBox(height: screenHeight*0.0375,),
                    Text(
                        'SOUL MODEL',
                        style: FontStyles.AppTitle1.copyWith(color:Colors.white)
                    )
                  ],
                ),
              )

          ],
        ),

    );
  }

}