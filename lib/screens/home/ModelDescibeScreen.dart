import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/SoulliveIcon.dart';
import 'package:soulive/screens/model_result/ModelResult.dart';

import '../../design/ColorStyles.dart';
import '../../design/FontStyles.dart';
import '../../design/component/CustomTextButton.dart';
import '../../model/GetModelList.dart';
import '../../viewModel/RecommendViewModel.dart';

class ModelDescribeScreen extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<RecommendViewModel>(
        create: (_) => RecommendViewModel(),
      child: ModelDescribe(),
    );
  }
}

class ModelDescribe extends StatelessWidget{
  const ModelDescribe({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RecommendViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(viewModel.modelone == null){
        viewModel.fetchRecommendModel(1);
      }
      if(viewModel.allModel == null){
        viewModel.fetchAllModel();
      }
    });
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text('모델 추천',
              style: FontStyles.Headline1.copyWith(color: AppColors.s3)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Consumer<RecommendViewModel>(
          builder: (context, viewModel, child) {
            final mainData = viewModel.modelone?.data;
            final allModelData = viewModel.allModel?.data;

            if (mainData != null) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Hero(
                      tag: 'heroBackground',
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,// 예시 높이, 적절히 조정 필요
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [AppColors.m1, Color(0xFFDAC7E1)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 96), // Hero 위젯 아래로 내용을 시작하기 위한 공간
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainProduct(mainData.company!, mainData.product!, mainData.brandImages!, mainData.productImages!, mainData.characteristic!, mainData.genders!, mainData.ages!),
                              SizedBox(height: 23,),
                              Text('가수(아이돌)', style: FontStyles.Headline1.copyWith(color: AppColors.g2),),
                              SizedBox(height: 10,),
                              People(context, allModelData!.singers!),
                              SizedBox(height: 35,),
                              Text('배우', style: FontStyles.Headline1.copyWith(color: AppColors.g2),),
                              SizedBox(height: 10,),
                              People(context,allModelData!.actors!),
                              SizedBox(height: 35,),
                              Text('유투버', style: FontStyles.Headline1.copyWith(color: AppColors.g2),),
                              SizedBox(height: 10,),
                              People(context,allModelData!.youtuber!),
                              SizedBox(height: 40,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
      );
  }

}

Widget MainProduct(
    String company,
    String product,
    List<String> brandImages,
    List<String> productImages,
    String characteristic,
    List<String> genders,
    List<String> ages
){
  return Card(
    color: AppColors.s3,
    elevation: 10.0,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13)
    ),
    child: Padding(
      padding: EdgeInsets.fromLTRB(26, 27, 36, 24),
      child: Column(
        children: [
          Row(
            children: [
              Text(company, style: FontStyles.Headline2.copyWith(color: AppColors.g2),),
              SizedBox(width: 8,),
              Text(product, style: FontStyles.Headline1.copyWith(color: AppColors.g1))
            ],
          ),
          SizedBox(height: 22,),
          Row(
            children: [
              Text('목표 기업 이미지', style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),),
              SizedBox(width: 4,),
              Wrap(
                spacing: 9.0,
                runSpacing: 8.0,
                children: brandImages.map((brandImage) => CustomTextButton(
                    text: '#${brandImage}', backgroundColor: AppColors.s1, textColor: AppColors.g2
                )).toList(),
              )
            ],
          ),
          SizedBox(height: 14,),
          Row(
            children: [
              Text('목표 상품 이미지', style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),),
              SizedBox(width: 4,),
              Wrap(
                spacing: 6.0,
                runSpacing: 8.0,
                children: productImages.map((productImage) => CustomTextButton(
                    text: '#${productImage}', backgroundColor: AppColors.s1, textColor: AppColors.g2
                )).toList(),
              )
            ],
          ),
          SizedBox(height: 14,),
          Row(
            children: [
              SoulliveIcon.arrowVer2(color: AppColors.g2),
              SizedBox(width: 10,),
              Text(characteristic, style: FontStyles.Subcopy7.copyWith(color: AppColors.g2),),
            ],
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              SoulliveIcon.ic_gender(color: AppColors.g2),
              SizedBox(width: 12,),
              Text('남녀노소', style: FontStyles.Subcopy7.copyWith(color: AppColors.g2),),
              SizedBox(width: 35,),
              SoulliveIcon.ic_book(color: AppColors.g2),
              SizedBox(width: 12,),
              Text('30대, 40대', style: FontStyles.Subcopy7.copyWith(color: AppColors.g2),),
            ],
          )
        ],
      ),
    )
  );
}

Widget People(BuildContext context, List<Format> datas ){
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: GestureDetector(
      onTap:(){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ModelResult(isModelDescribe: true,))
        );
      },
      child: Row(
        children: datas.map((data) => Cotent(data.imageUrl!,data.name!)).toList(),
      ),
    )
  );
}

Widget Cotent(String imageUrl, String name){
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Image.network(
              imageUrl,
              width: 83,
              height: 103,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 12,),
          Text(name, style: FontStyles.Subcopy4.copyWith(color: AppColors.g2))
        ],
      ),
      SizedBox(width: 9,)
    ],
  );
}