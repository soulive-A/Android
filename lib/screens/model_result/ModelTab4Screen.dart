import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/model/GetModelFitness.dart';

import '../../design/ColorStyles.dart';
import '../../design/component/CustomTextButton.dart';
import '../../viewModel/TabViewModel.dart';

class ModelTab4Screen extends StatefulWidget{

  final GetModelFitness modelFitness;
  const ModelTab4Screen({
   super.key,
   required this.modelFitness,
});

  @override
  State<ModelTab4Screen> createState() => _ModelTab4Screen();
}

class _ModelTab4Screen extends State<ModelTab4Screen>{
  @override
  Widget build(BuildContext context) {
    GetModelFitness tab4Data = widget.modelFitness;
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
                      ModelPerfection(tab4Data.data!.scoreUrl!),
                      SizedBox(height: 30,),
                      ModelKeyword(tab4Data.data!.modelImageKeywordList!),
                      SizedBox(height: 30,),
                      CompanyGoal(tab4Data.data!.brandImageKeywordList!, '목표 기업 이미지'),
                      SizedBox(height: 15,),
                      CompanyGoal(tab4Data.data!.productImageKeywordList!, '목표 블라블라'),
                      SizedBox(height: 51,)
                    ],
                  ),
                )
            ),
          )
      ),
    );
  }
}

Widget ModelPerfection(String scoreUrl){
  return Container(
    child: Image.network(
        scoreUrl,
      width: double.infinity,
      height: 176,
      fit: BoxFit.fill
    ),
  );
}

Widget ModelKeyword(List<String> keywords){
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
        Wrap(
          spacing: 5.0,
          runSpacing: 10.0,
          children: keywords.map((keyword) => CustomTextButton(
              text: "${keyword}", backgroundColor: AppColors.s1, textColor: AppColors.g2
          )).toList(),
        )
      ],
    ),
  );
}

Widget CompanyGoal(List<String> items, String title){
  return Row(
    children: [
      Expanded(child: Container(
        decoration: BoxDecoration(
            color: AppColors.s3,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(width: 1, color: AppColors.g6)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: FontStyles.Headline2.copyWith(color:AppColors.g1 ),),
              SizedBox(height: 14,),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: items.map((item) => CustomTextButton(
                    text: '#${item}', backgroundColor: AppColors.g6, textColor: AppColors.g2
                )).toList(),
              )
            ],
          ),
        ),
      ),),
      SizedBox(width: 10,),
      Container(
        decoration: BoxDecoration(
          color: AppColors.m1,
          borderRadius: BorderRadius.circular(13),
        ),
        child:Padding(
          padding: EdgeInsets.symmetric(vertical: 28, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '모델 이미지와', style:FontStyles.Subcopy6.copyWith(color: AppColors.s3),
              ),
              Text(
                '적합', style:FontStyles.Headline2.copyWith(color: AppColors.s3),
              ),
            ],
          ),
        )
      )
    ],
  );
}
