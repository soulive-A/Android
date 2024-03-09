import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/FontStyles.dart';

import '../../design/ColorStyles.dart';
import '../../design/component/CustomTextButton.dart';
import '../../model/GetModelPopular.dart';
import '../../viewModel/TabViewModel.dart';

class ModelTab2Screen extends StatefulWidget{
  final GetModelPopular modelPopular;
  const ModelTab2Screen(
  {
    super.key,
    required this.modelPopular
});

  @override
  State<ModelTab2Screen> createState() => _ModelTab2Screen();
}

class _ModelTab2Screen extends State<ModelTab2Screen>{
  @override
  Widget build(BuildContext context) {
    GetModelPopular tab2Data = widget.modelPopular;
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
                  ScoreTotal(tab2Data.data!.scoreUrl!, tab2Data.data!.aiComment!),
                  SizedBox(height: 30,),
                  ModelPrefer(tab2Data.data!.genders!, tab2Data.data!.ages!),
                  SizedBox(height: 30,),
                  ModelFollwer(tab2Data.data!.snsUrl!),
                  SizedBox(height: 30,),
                  ModelReference(tab2Data.data!.searchUrl!),
                  SizedBox(height: 30,),
                  SixMonthResult(tab2Data.data!.brandScoreUrl!),
                  SizedBox(height: 30,),
                  FutureActive(tab2Data.data!.modelScheduledWorks!),
                  SizedBox(height: 51),
                ],
              ),
            )
          ),
        )
      ),
    );
  }
}

Widget ScoreTotal(String imageurl,String aiComment){
  return IntrinsicHeight(
      child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(width: 1, color: AppColors.g6)
                ),
                child: Image.network(
                  imageurl,
                  width: double.infinity,
                  height: 175,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
      ),
  );
}

Widget ModelPrefer(List<String> genders, List<String> ages){
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
            CustomTextButton(text: '남성', backgroundColor: genders.contains("MALE") ? AppColors.m4 : AppColors.g6, textColor: genders.contains("MALE") ? AppColors.m3 : AppColors.g2,),
            SizedBox(width: 4),
            CustomTextButton(text: '여성', backgroundColor: genders.contains("FEMALE") ? AppColors.m4 : AppColors.g6, textColor: genders.contains("FEMALE") ? AppColors.m3 : AppColors.g2,),
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
            CustomTextButton(text: '10대', backgroundColor: ages.contains("TEN") ? AppColors.m4 : AppColors.g6, textColor: genders.contains("TEN") ? AppColors.m3 : AppColors.g2,),
            SizedBox(width: 4),
            CustomTextButton(text: '20대', backgroundColor: ages.contains("TWENTY") ? AppColors.m4 : AppColors.g6, textColor: genders.contains("TEN") ? AppColors.m3 : AppColors.g2,),
            SizedBox(width: 4),
            CustomTextButton(text: '30대', backgroundColor: ages.contains("THIRTY") ? AppColors.m4 : AppColors.g6, textColor: genders.contains("TEN") ? AppColors.m3 : AppColors.g2,),
            SizedBox(width: 4),
            CustomTextButton(text: '40대', backgroundColor: ages.contains("FORTY") ? AppColors.m4 : AppColors.g6, textColor: genders.contains("TEN") ? AppColors.m3 : AppColors.g2,),
            SizedBox(width: 4),
            CustomTextButton(text: '50대', backgroundColor: ages.contains("FIFTY") ? AppColors.m4 : AppColors.g6, textColor: genders.contains("TEN") ? AppColors.m3 : AppColors.g2,),
            SizedBox(width: 4),
            CustomTextButton(text: '50대 이상', backgroundColor: ages.contains("SIXTY") ? AppColors.m4 : AppColors.g6, textColor: genders.contains("TEN") ? AppColors.m3 : AppColors.g2,),
          ],
        ),
      ],
    ),
  );
}

Widget ModelFollwer(String snsUrl){
  return Container(
    width: double.infinity,
    color: AppColors.bg,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SNS 팔로워 수 추이',
          style: FontStyles.Headline1.copyWith(color: AppColors.g1),
        ),
        SizedBox(height: 23,),
        Image.network(
            snsUrl,
          width: double.infinity,
          height: 157,
          fit: BoxFit.fill
        )
      ],
    ),
  );
}

//온라인 언급량
Widget ModelReference(String searchUrl){
  return Container(
    width: double.infinity,
    color: AppColors.bg,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('온라인 언급 및 검색량',
          style: FontStyles.Headline1.copyWith(color: AppColors.g1),
        ),
        SizedBox(height: 18,),
        Align(
          alignment: Alignment.centerRight,
          child: Text('최근 3개월 기준', style: FontStyles.Subcopy7.copyWith(color: AppColors.g2)),
        ),
        Image.network(
          searchUrl,
          width: double.infinity,
          height: 79,
          fit: BoxFit.fill
        )
      ],
    ),
  );
}

Widget SixMonthResult(String brandScoreUrl){
  return Container(
    width: double.infinity,
    color: AppColors.bg,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( '최근 6개월 간 브랜드 평판 지수 및 순위',
          style: FontStyles.Headline1.copyWith(color: AppColors.g1),
        ),
       Image.network(
           brandScoreUrl,
         width: double.infinity,
         height: 137,
         fit: BoxFit.fill,
       )
      ],
    ),
  );
}

//예정된 주요활동
Widget FutureActive(List<ModelScheduledWorks> works){
  return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '예정된 주요 활동',
            style: FontStyles.Headline1.copyWith(color: AppColors.g1),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: works.map((work) => FutureItem(work.imageUrl!,work.year!,work.category!, work.title!, work.isMainActor!, work.genre!)).toList(),
            ),
          )
        ],
      )
  );
}

Widget FutureItem(String imageUrl, int year, String category, String title, bool isMainActor, String genre){
  return Padding(
          padding: EdgeInsets.only(right: 12),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Image.network(
              imageUrl,
              width: 98,
              height: 123,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              Text('${year}', style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),),
              Text('${title}', style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),),
            ],
          ),
          SizedBox(height: 5,),
          Text(title, style: FontStyles.Subcopy6.copyWith(color: AppColors.g2),),
          SizedBox(height: 5,),
          Text(isMainActor ? '주연' : '조연', style: FontStyles.Subcopy6.copyWith(color: AppColors.g2),),
          SizedBox(height: 5,),
          Text(genre, style: FontStyles.Subcopy6.copyWith(color: AppColors.g2),),
        ],
      )
  );
}