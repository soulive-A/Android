import 'package:flutter/material.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/screens/home/HomeScreen.dart';
import 'package:soulive/screens/commercial/CommercialScreen.dart';
import 'package:soulive/screens/mypage/MypageScreen.dart';
import 'package:soulive/design/SoulliveIcon.dart';
//테스트
import 'package:soulive/screens/LoginScreen.dart';

class ScreenIndex extends StatefulWidget {
  final int index;

  const ScreenIndex({Key? key, required this.index}) : super(key: key);

  @override
  State<ScreenIndex> createState() => _ScreenIndexState();
}

class _ScreenIndexState extends State<ScreenIndex> {
  int currentIndex=0;

  final List<Widget> tabs = [
    const HomeScreen(),
    const CommercialScreen(),
    const MypageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //디자인 나오면 추후 수정필요
        selectedItemColor: AppColors.m1,
        //디자인나오면 추후 수정
        selectedFontSize: 12,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: currentIndex != 0 ? SoulliveIcon.homeunFill() : SoulliveIcon.homeFill(),
              label: '홈'
          ),
          BottomNavigationBarItem(
              icon: currentIndex != 1 ? SoulliveIcon.secondunFill() : SoulliveIcon.secondFill(),
              label: '광고 상품'
          ),
          BottomNavigationBarItem(
              icon: currentIndex != 2 ? SoulliveIcon.mypageunFill() : SoulliveIcon.mypageFill(),
              label: '마이페이지'
          )
        ],
      ),
    );
  }
}
