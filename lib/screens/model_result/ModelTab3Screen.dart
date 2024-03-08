import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/SoulliveIcon.dart';
import 'package:soulive/model/GetModelNegative.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../design/ColorStyles.dart';
import '../../viewModel/TabViewModel.dart';

class ModelTab3Screen extends StatefulWidget{
  final GetModelNegative modelNegative;

  const ModelTab3Screen({
    super.key,
    required this.modelNegative
});

  @override
  State<ModelTab3Screen> createState() => _ModelTab3Screen();
}

class _ModelTab3Screen extends State<ModelTab3Screen>{
  @override
  Widget build(BuildContext context) {
    GetModelNegative tab3Data = widget.modelNegative;
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
                      NegativeIssue(tab3Data.data!.scoreUrl!),
                      SizedBox(height: 30,),
                      NegativeSummary(tab3Data.data!.crime!, tab3Data.data!.modelNewsResponseList!),
                      SizedBox(height: 51,),
                    ],
                  ),
                )
            ),
          )
      ),
    );
  }
}

Widget NegativeIssue(String imageUrl){
  return Container(
    width: double.infinity,
    child: Column(
      children: [
        Image.network(
          imageUrl,
          width: double.infinity,
          height: 175,
          fit: BoxFit.fill
        )
      ],
    ),
  );
}

Widget NegativeSummary(int crime, List<ModelNewsResponseList> news){
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
            Text('${crime}건', style: FontStyles.Headline3.copyWith(color: AppColors.m1, fontSize: 20),)
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
        Column(
          children: news.map((newsItem) => News(
              newsItem.title!, newsItem.newsDate!, newsItem.company!, newsItem.newsUrl!
          )).toList(),
        )
      ],
    ),
  );
}
//제목,날짜,내용
Widget News(String title, String newsDate, String company,String url){
  return Padding(
      padding: EdgeInsets.only(bottom: 15),
    child: GestureDetector(
      onTap: (){
        launchUrl(Uri.parse(url));
      },
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.s3,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(width: 1, color:AppColors.g6)
          ),
          child: Padding(
              padding: EdgeInsets.fromLTRB(14, 15, 9, 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(company, style: FontStyles.Headline2.copyWith(fontSize: 11, color: AppColors.g2),),
                          SizedBox(width: 6,),
                          Text(newsDate, style: FontStyles.Headline3.copyWith(fontSize: 8, color: AppColors.g2),)
                        ],
                      ),
                      SizedBox(height: 14,),
                      Text(title, style: FontStyles.Headline3.copyWith(fontSize: 12, color: AppColors.g2),)
                    ],
                  ),
                  //아이콘
                  Spacer(),
                  Padding(padding: EdgeInsets.only(top: 20), child: SoulliveIcon.arrowRight(color: AppColors.g1),)
                ],
              )
          )
      ),
    ),
  );
}
