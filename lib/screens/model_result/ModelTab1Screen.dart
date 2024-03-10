
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/component/CustomTextButton.dart';
import 'package:soulive/model/GetModelIntroduce.dart';
import 'package:soulive/viewModel/TabViewModel.dart';
//모델소개
class ModelTab1Screen extends StatefulWidget{
  final GetModelIntroduce modelIntroduceData;

  //생성자
   const ModelTab1Screen({
    super.key,
    required this.modelIntroduceData,
});

  @override
  State<ModelTab1Screen> createState() => _ModelTab1Screen();
}

class _ModelTab1Screen extends State<ModelTab1Screen>{
  @override
  Widget build(BuildContext context) {
    GetModelIntroduce tab1Data = widget.modelIntroduceData;
    return ChangeNotifierProvider(
        create: (_) => TabViewModel(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.bg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //모델이미지 키워드
                SizedBox(height: 17,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: modelKeyword(tab1Data.data!.modelImageKeywords!),
                ),
                SizedBox(height: 25),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: modelRecentDrama(tab1Data.data!.modelRecentWorks!),
                ),
                SizedBox(height: 25,),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  child: modelRecentCommercial(tab1Data.data!.modelRecentAdvertisements!),
                ),
                SizedBox(height: 51,),
              ],
            ),
          ),
        )
      ),
    );
  }
}

Widget modelKeyword(List<String> keywords){
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '모델 이미지 키워드',
          style: FontStyles.Headline1.copyWith(color: AppColors.g1),
        ),
        SizedBox(height: 23,),
        Wrap(
          spacing: 9.0,
          runSpacing: 8.0,
          children: keywords.map((keyword) => CustomTextButton(
            text: keyword, backgroundColor: AppColors.s1, textColor: AppColors.g2
          )).toList(),
        )
      ],
    ),
  );
}

Widget modelRecentDrama(List<ModelRecentWorks> drama){
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '최근 작품',
          style: FontStyles.Headline1.copyWith(color: AppColors.g1),
        ),
        SizedBox(height: 12,),
        //최근 작품 리스트
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: drama.map((data) => DramaWidget(data.imageUrl!,data.year!,data.category!,data.genre!,data.title!, data.role!)).toList(),
          ),
        )
      ],
    )
  );
}

Widget DramaWidget(String imageUrl,int year, String category, String genre, String title, String role){
  return Padding(
      padding: EdgeInsets.only(right:10 ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.network(
            imageUrl,
            width: 100,
            height: 123,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 12,),
        Row(
          children: [
            Text(
              '${year}', style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),
            ),
            SizedBox(width: 2,),
            Text(
              category, style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Text(
          title, style: FontStyles.Subcopy6.copyWith(color: AppColors.g2),
        ),
        SizedBox(height: 5,),
        Text(
          role, style: FontStyles.Subcopy6.copyWith(color: AppColors.g2),
        ),
        SizedBox(height: 5,),
        Text(
          genre, style: FontStyles.Subcopy6.copyWith(color: AppColors.g2),
        ),
      ],
    ),
  );
}

Widget modelRecentCommercial(List<ModelRecentAdvertisements> advertisments){
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '최근 광고 활동',
          style: FontStyles.Headline1.copyWith(color: AppColors.g1),
        ),
        SizedBox(height: 12,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: advertisments.map((advertisment) => Commercial(advertisment.imageUrl!,advertisment.year!,advertisment.brand!)).toList(),
          ),
        )
      ],
    )
  );
}

Widget Commercial(String imageUrl, int year, String brand){
  return Padding(
    padding: EdgeInsets.only(right:10 ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.network(
            imageUrl,
            width: 100,
            height: 123,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 12,),
        Row(
          children: [
            Text(
              '${year}', style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Text(
          brand, style: FontStyles.Subcopy6.copyWith(color: AppColors.g2),
        ),
      ],
    ),
  );
}