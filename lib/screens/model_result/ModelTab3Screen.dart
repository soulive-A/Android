import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/FontStyles.dart';

import '../../design/ColorStyles.dart';
import '../../viewModel/TabViewModel.dart';

class ModelTab3Screen extends StatefulWidget{
  const ModelTab3Screen({super.key});

  @override
  State<ModelTab3Screen> createState() => _ModelTab3Screen();
}

class _ModelTab3Screen extends State<ModelTab3Screen>{
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
                      SizedBox(height: 30,),
                      NegativeIssue(),
                      SizedBox(height: 30,),
                      NegativeSummary(),
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

Widget NegativeIssue(){
  return Container(
    width: double.infinity,
    child: Column(
      children: [
        //백에서 넘겨주는 이미지
      ],
    ),
  );
}

Widget NegativeSummary(){
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.g6,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 7),
                child: Text('범죄 이력', style: FontStyles.Headline2.copyWith(color: AppColors.g1)),
              ),
            ),
            SizedBox(width: 11,),
            Text('0건', style: FontStyles.Headline3.copyWith(color: AppColors.m1, fontSize: 20),)
          ],
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.g6,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 7),
                child: Text('언론 기사', style: FontStyles.Headline2.copyWith(color: AppColors.g1)),
              ),
            ),
            SizedBox(width: 11,),
            Text('최근 3년의 부정적 언론기사', style: FontStyles.Headline3.copyWith(color: AppColors.g2, fontSize: 12),)
          ],
        ),
        SizedBox(height: 15,),
        GestureDetector(
          onTap: (){
            //url연결
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13)
            ),
            child: Text('백에서 오는 데이터 형식으로~'),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          decoration: BoxDecoration(
              color: AppColors.g6,
              borderRadius: BorderRadius.circular(13)
          ),
          child: Text('백에서 오는 데이터 형식으로~'),
        ),
        SizedBox(height: 15,),
        Container(
          decoration: BoxDecoration(
              color: AppColors.g6,
              borderRadius: BorderRadius.circular(13)
          ),
          child: Text('백에서 오는 데이터 형식으로~'),
        ),
      ],
    ),
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