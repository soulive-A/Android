import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/FontStyles.dart';

import '../../design/ColorStyles.dart';
import '../../design/component/CustomTextButton.dart';
import '../../viewModel/TabViewModel.dart';

class ModelTab2Screen extends StatefulWidget{
  const ModelTab2Screen({super.key});

  @override
  State<ModelTab2Screen> createState() => _ModelTab2Screen();
}

class _ModelTab2Screen extends State<ModelTab2Screen>{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TabViewModel(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.bg,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 18,),
                  //화제성점수 이미지
                  SizedBox(height: 30,),
                  ModelPrefer(),
                  SizedBox(height: 30,),
                  ModelFollwer(),
                  SizedBox(height: 30,),
                  ModelReference(),
                  SizedBox(height: 30,),
                  SixMonthResult(),
                  SizedBox(height: 30,),
                  FutureActive()
                ],
              ),
            )
          ),
        )
      ),
    );
  }
}

Widget ModelPrefer(){
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('모델 선호 대상',
        style: FontStyles.Headline1.copyWith(color: AppColors.g1),),
        SizedBox(height: 30,),
        Row(
          children: [
            Text(
                '성별',
              style: FontStyles.Headline2.copyWith(color: AppColors.g2),
            ),
            SizedBox(width: 5,),
            CustomTextButton(text: '남성', backgroundColor: AppColors.m3, textColor: AppColors.m4,),
            SizedBox(width: 4),
            CustomTextButton(text: '여성', backgroundColor: AppColors.m3, textColor: AppColors.m4,),
          ],
        ),
        SizedBox(height: 17),
        Row(
          children: [
            Text(
              '나이',
              style: FontStyles.Headline2.copyWith(color: AppColors.g2),
            ),
            SizedBox(width: 5,),
            CustomTextButton(text: '10대', backgroundColor: AppColors.m3, textColor: AppColors.m4,),
            SizedBox(width: 4),
            CustomTextButton(text: '20대', backgroundColor: AppColors.m3, textColor: AppColors.m4,),
            SizedBox(width: 4),
            CustomTextButton(text: '30대', backgroundColor: AppColors.g6, textColor: AppColors.g2,),
            SizedBox(width: 4),
            CustomTextButton(text: '40대', backgroundColor: AppColors.g6, textColor: AppColors.g2,),
            SizedBox(width: 4),
            CustomTextButton(text: '50대', backgroundColor: AppColors.g6, textColor: AppColors.g2,),
          ],
        ),
      ],
    ),
  );
}

Widget ModelFollwer(){
  return Container(
    width: double.infinity,
    color: AppColors.bg,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SNS 팔러워 수 추이',
          style: FontStyles.Headline1.copyWith(color: AppColors.g1),
        ),
        //이미지 그래프 들어갈자리
      ],
    ),
  );
}

//온라인 언급량
Widget ModelReference(){
  return Container(
    width: double.infinity,
    color: AppColors.bg,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('온라인 언급 및 검색량',
          style: FontStyles.Headline1.copyWith(color: AppColors.g1),
        ),
        //이미지 그래프 들어갈자리
      ],
    ),
  );
}

Widget SixMonthResult(){
  return Container(
    width: double.infinity,
    color: AppColors.bg,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( '최근 6개월 간 브랜드 평판 지수 및 순위',
          style: FontStyles.Headline1.copyWith(color: AppColors.g1),
        ),
        //이미지 그래프 들어갈자리
      ],
    ),
  );
}

//예정된 주요활동
Widget FutureActive(){
  return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '예정된 주요 활동',
            style: FontStyles.Headline1.copyWith(color: AppColors.g1),
          )
        ],
      )
  );
}