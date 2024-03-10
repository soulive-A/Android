import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/screens/home/HomeScreen.dart';
import 'package:soulive/screens/commercial/CommercialScreen.dart';
import 'package:soulive/screens/model_result/ModelResult.dart';
import 'package:soulive/screens/mypage/MypageScreen.dart';
import 'package:soulive/screens/splash/splashScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:soulive/design/SoulliveIcon.dart';
import 'package:soulive/screens/screen_index.dart';
import 'package:soulive/screens/model_result/ModelResult.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soulive/viewModel/RecommendViewModel.dart';
import 'package:soulive/viewModel/TabViewModel.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
        ..maxConnectionsPerHost = 5;
  }
}
void main() async {
  await dotenv.load(fileName: "assets/config/.env");
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    ChangeNotifierProvider<TabViewModel>(
        create: (context) => TabViewModel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => RecommendViewModel())
      ],
      child: MaterialApp(
       home: SplashScreen()
      ),
    );
  }
}
