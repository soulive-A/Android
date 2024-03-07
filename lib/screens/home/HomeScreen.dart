import 'package:flutter/material.dart';
import 'package:soulive/design/SoulliveIcon.dart';
import 'package:soulive/screens/home/InputModelScreen.dart';
import 'package:soulive/screens/home/ModelDescibeScreen.dart';

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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/background_home.png'),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            leading: Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Image.asset(
                'assets/images/ic_logo.png',
                width: 24,
                height: 26,
              ),
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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'oo님,',
                style: FontStyles.Subcopy1.copyWith(color: AppColors.s3),
              ),
              Text(
                '광고상품에 딱 맞는 모델을 찾아보세요!',
                style: FontStyles.Subcopy1.copyWith(color: AppColors.s3),
              ),

              //버튼
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => InputModelScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.s3,
                          borderRadius: BorderRadius.circular(10),
                          //그림자 임의로 조절한거라 수정 필요할수도
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.g4,
                                blurRadius: 2,
                                offset: Offset(1, 2)),
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '생각한 후보 모델이 있다면?',
                                style: FontStyles.Subcopy6.copyWith(
                                    color: AppColors.g2),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SoulliveIcon.analysisIcon(),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '모델 분석하기',
                                style: FontStyles.Headline1.copyWith(
                                    color: AppColors.g2),
                              )
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ModelDescribeScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.s3,
                          borderRadius: BorderRadius.circular(10),
                          //그림자 임의로 조절한거라 수정 필요할수도
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.g4,
                                blurRadius: 2,
                                offset: Offset(1, 2)),
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '후보 모델을 고민중이라면?',
                                style: FontStyles.Subcopy6.copyWith(
                                    color: AppColors.g2),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SoulliveIcon.recIcon(),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '모델 추천받기',
                                style: FontStyles.Headline1.copyWith(
                                    color: AppColors.g2),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
