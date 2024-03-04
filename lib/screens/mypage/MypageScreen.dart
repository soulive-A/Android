import 'package:flutter/material.dart';
import 'package:soulive/screens/screen_index.dart';


class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  @override
  State<MypageScreen> createState() => _MypageScreen();
}

class _MypageScreen extends State<MypageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('마이페이지입니다'),
      ),
    );
  }

}