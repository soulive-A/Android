import 'package:flutter/material.dart';
import 'package:soulive/screens/model_result/InputModelScreen.dart';

import '../../design/ColorStyles.dart';
import '../../design/FontStyles.dart';
import '../model_result/ModelResult.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: Image.asset(
            'assets/images/ic_logo.png',
            width: 24,
            height: 26,
          ),
          title: Text('SOUL MODEL',
              style: FontStyles.AppTitle1.copyWith(color: Colors.white)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  AppColors.m1,
                  Color(0xFFDAC7E1),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => InputModelScreen()));
        },
        child: Text('모델분석결과화면 임시 인풋 버튼'),
      )),
    );
  }

}