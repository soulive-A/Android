import 'package:flutter/material.dart';
import 'package:soulive/screens/model_result/InputModelScreen.dart';
import 'package:soulive/screens/screen_index.dart';
import 'package:soulive/screens/model_result/ModelResult.dart';

import '../../design/ColorStyles.dart';
import '../../design/FontStyles.dart';
import '../../design/SoulliveIcon.dart';
import '../../design/component/CustomTextButton.dart';
import '../commercial/Productadd.dart';
import 'ModelDescibeScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset(
            'assets/images/ic_logo.png',
            width: 24,
            height: 26,
          ),
        ),
        title: Text('SOUL MODEL',
            style: FontStyles.AppTitle2.copyWith(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Hero(
          //hero로는 네비바 애니메이션 효과 적용이 힘들것같아서 animations package를 깔아야할듯
          tag: 'tab',
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Text(
                //유저 정보 받아서 닉네임 출력하는 형식으로 수정할 것
                'oo님,',
                style: FontStyles.Subcopy1.copyWith(color: AppColors.s3),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                '광고상품에 딱 맞는 모델을 찾아보세요!',
                style: FontStyles.Subcopy1.copyWith(color: AppColors.s3),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              //광고 상품 없을 때
              _buildNoProduct(context),

              //광고 상품 있을 때
              //_buildProduct(context),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
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
                        padding: EdgeInsets.all(15),
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
                        padding: EdgeInsets.all(15),
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
      ]),
    );
  }
}

//등록한 광고 상품이 없을 때
Widget _buildNoProduct(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(10),
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.45,
    decoration: BoxDecoration(
      color: AppColors.s3,
      borderRadius: BorderRadius.circular(10),
      //그림자 임의로 조절한거라 수정 필요할수도
      boxShadow: [
        BoxShadow(color: AppColors.g4, blurRadius: 2, offset: Offset(1, 2)),
      ],
    ),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '아직 등록한 광고 상품이 없어요',
            style: FontStyles.Subcopy8.copyWith(color: AppColors.g2),
          ),
          SoulliveIcon.addTriangleIcon(),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
      ),
      IconButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductAddScreen()));
        },
        icon: SoulliveIcon.plusIcon(color: AppColors.m1),
      ),
      Text(
        '광고 상품 등록하기',
        style: FontStyles.Subcopy4.copyWith(color: AppColors.g2),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
      ),
    ]),
  );
}

//등록한 광고 상품이 있을 때
Widget _buildProduct(BuildContext context) {
  List<String> brandImages = [
    '#프로페셔녈',
    '#프리미엄',
    '#혁신적인',
  ];

  List<String> productImages = [
    '#세련됨',
    '#편리함',
    '#혁신적인 기술',
  ];

  return Container(
    padding: EdgeInsets.all(10),
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.45,
    decoration: BoxDecoration(
      color: AppColors.s3,
      borderRadius: BorderRadius.circular(10),
      //그림자 임의로 조절한거라 수정 필요할수도
      boxShadow: [
        BoxShadow(color: AppColors.g4, blurRadius: 2, offset: Offset(1, 2)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '광고할 상품을 선택해주세요',
              style: FontStyles.Subcopy8.copyWith(color: AppColors.g2),
            ),
            SoulliveIcon.addTriangleIcon(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'LG전자',
                      style: FontStyles.Headline2.copyWith(color: AppColors.g2),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('LG 시그니처',
                        style: FontStyles.Headline1.copyWith(color: AppColors.g1))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),

                Text(
                  '목표 기업 이미지',
                  style: FontStyles.Headline2.copyWith(color: AppColors.g2),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 9.0,
                  runSpacing: 8.0,
                  children: brandImages
                      .map((brandImage) => CustomTextButton(
                      text: brandImage,
                      backgroundColor: AppColors.s1,
                      textColor: AppColors.g2))
                      .toList(),
                ),
                SizedBox(
                  height: 25,
                ),

                Text(
                  '목표 상품 이미지',
                  style: FontStyles.Headline2.copyWith(color: AppColors.g2),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 6.0,
                  runSpacing: 8.0,
                  children: productImages
                      .map((productImage) => CustomTextButton(
                      text: productImage,
                      backgroundColor: AppColors.s1,
                      textColor: AppColors.g2))
                      .toList(),
                ),
                SizedBox(
                  height: 25,
                ),

                Row(
                  children: [
                    SoulliveIcon.arrowVer2(color: AppColors.g2),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '올인원 세탁 방식',
                      style: FontStyles.Subcopy5.copyWith(color: AppColors.g2),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    SoulliveIcon.ic_gender(color: AppColors.g2),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      '남녀노소',
                      style: FontStyles.Subcopy5.copyWith(color: AppColors.g2),
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    SoulliveIcon.ic_book(color: AppColors.g2),
                    Text(
                      '30대, 40대',
                      style: FontStyles.Subcopy5.copyWith(color: AppColors.g2),
                    ),
                  ],
                ),
              ],
            ),

        ),
      ],
    ),
  );
}
