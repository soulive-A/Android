import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/FontStyles.dart';

import '../../design/ColorStyles.dart';
import '../../design/component/CustomTextButton.dart';
import '../../viewModel/TabViewModel.dart';

class ModelTab4Screen extends StatefulWidget{
  const ModelTab4Screen({super.key});

  @override
  State<ModelTab4Screen> createState() => _ModelTab4Screen();
}

class _ModelTab4Screen extends State<ModelTab4Screen>{
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      ModelPerfection(),
                      SizedBox(height: 30,),
                      ModelKeyword(),
                      SizedBox(height: 30,),
                      CompanyGoal(),
                      SizedBox(height: 30,),
                      AIComment()
                    ],
                  ),
                )
            ),
          )
      ),
    );
  }
}

Widget ModelPerfection(){
  return Container(
    child: Text('이미지들어갈곳'),
  );
}

Widget ModelKeyword(){
  return Container(
    color: AppColors.bg,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            '모델 이미지 키워드',
          style: FontStyles.Headline2.copyWith(color: AppColors.g1, fontSize: 15),
        ),
        SizedBox(height: 14,),
        CustomTextButton(text: '#세련됨', backgroundColor: AppColors.g6, textColor: AppColors.g3,),
        CustomTextButton(text: '#패셔너블한', backgroundColor: AppColors.g6, textColor: AppColors.g1,),
      ],
    ),
  );
}

Widget CompanyGoal(){
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          color: AppColors.s3,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: AppColors.g6)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
          child: Column(
//추후 api오면 더 정
          ),
        ),
      )
    ],
  );
}

Widget AIComment(){
  return Container(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: AppColors.m1, width: 1)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AI 한줄 평가',
                style: FontStyles.Subcopy4.copyWith(color: AppColors.m1),),
              SizedBox(height: 7,),
              Text('아이린은 어쩌구 저쩌구 블라블라',
                style: FontStyles.Subcopy4.copyWith(color: AppColors.g1, fontSize: 12),),
            ],
          ),
        ),
      )
  );
}