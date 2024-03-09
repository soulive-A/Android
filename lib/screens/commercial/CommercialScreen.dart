import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/SoulliveIcon.dart';

import '../../design/ColorStyles.dart';
import '../../design/FontStyles.dart';
import '../../design/component/CustomTextButton.dart';
import '../../model/GetModelList.dart';
import '../../viewModel/RecommendViewModel.dart';

class CommercialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecommendViewModel>(
      create: (_) => RecommendViewModel(),
      child: Commercial(),
    );
  }
}

class Commercial extends StatelessWidget {
  const Commercial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RecommendViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //최근 조회 상품
      if (viewModel.modelone == null) {
        viewModel.fetchRecommendModel(1);
      }
      //최근 조회 모델
      if (viewModel.modelrecent == null) {
        viewModel.fetchRecentModel(1);
      }
    });

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('모델',
              style: FontStyles.AppTitle1.copyWith(color: AppColors.s3)),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Consumer<RecommendViewModel>(
          builder: (context, viewModel, child) {
            final mainData = viewModel.modelone?.data;
            final recentModel = viewModel.modelrecent?.data;

            if (mainData != null && recentModel != null) {
              return Stack(
                children: [
                  Hero(
                    tag: 'tab',
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
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
                          height: MediaQuery.of(context).size.height * 0.12,
                        ),

                        //광고 상품 컨테이너 위젯 배치
                        productDisplay(
                            mainData.company!,
                            mainData.product!,
                            mainData.brandImages!,
                            mainData.productImages!,
                            mainData.characteristic!,
                            mainData.genders!,
                            mainData.ages!),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text(
                          '최근 본 모델',
                          style: FontStyles.Headline1.copyWith(
                              color: AppColors.g2),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        //최근 본 모델 리스트뷰
                        recentDisplay(
                            recentModel.modelId!,
                            recentModel.imageUrl!,
                            recentModel.modelName!,
                            recentModel.aiRate!,
                            recentModel.job!),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

//광고 상품 정보 컨테이너
Widget productDisplay(
    String company,
    String product,
    List<String> brandImages,
    List<String> productImages,
    String characteristic,
    List<String> genders,
    List<String> ages) {
  return Card(
      color: AppColors.s3,
      elevation: 10.0,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(26, 27, 36, 24),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  company,
                  style: FontStyles.Headline2.copyWith(color: AppColors.g2),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(product,
                    style: FontStyles.Headline1.copyWith(color: AppColors.g1))
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Text(
                  '목표 기업 이미지',
                  style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),
                ),
                SizedBox(
                  width: 4,
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
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '목표 상품 이미지',
                  style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),
                ),
                SizedBox(
                  width: 4,
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
                )
              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              children: [
                SoulliveIcon.arrowVer2(color: AppColors.g2),
                SizedBox(
                  width: 10,
                ),
                Text(
                  characteristic,
                  style: FontStyles.Subcopy7.copyWith(color: AppColors.g2),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                SoulliveIcon.ic_gender(color: AppColors.g2),
                SizedBox(
                  width: 12,
                ),
                Text(
                  '남녀노소',
                  style: FontStyles.Subcopy7.copyWith(color: AppColors.g2),
                ),
                SizedBox(
                  width: 35,
                ),
                SoulliveIcon.ic_book(color: AppColors.g2),
                Text(
                  '30대, 40대',
                  style: FontStyles.Subcopy7.copyWith(color: AppColors.g2),
                ),
              ],
            )
          ],
        ),
      ));
}

//최근 조회 모델 컨테이너
Widget recentDisplay(
  int modelId,
  String imageUrl,
  String modelName,
  int aiRate,
  String job,
) {
  return Container(
    width: double.infinity,
    height: 263.2,
    decoration: BoxDecoration(
      color: AppColors.s3,
      borderRadius: BorderRadius.circular(13),
      boxShadow: [
        BoxShadow(color: AppColors.g4, blurRadius: 2, offset: Offset(1, 2)),
      ],
    ),
    child: ListView.separated(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      itemCount: modelId,
      itemBuilder: (BuildContext context, modelId) {
        return Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.network(
                  imageUrl,
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    modelName,
                    style: FontStyles.Subcopy1.copyWith(color: AppColors.g2),
                  ),
                  Text(
                    job,
                    style: FontStyles.Subcopy5.copyWith(color: AppColors.g2),
                  ),
                ],
              ),
              SizedBox(
                width: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'AI 추천',
                    style: FontStyles.Subcopy6.copyWith(
                      color: AppColors.g2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  //별점 시스템
                  RatingBar(
                    itemSize: 13,
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    ratingWidget: RatingWidget(
                      full: SoulliveIcon.starFill(),
                      half: Icon(
                        Icons.star_half,
                      ),
                      empty: SoulliveIcon.starunFill(),
                    ),
                    onRatingUpdate: (rating) {
                      rating = aiRate.toDouble();
                    },
                  ),
                ],
              ),
              SizedBox(
                width: 23,
              ),
              SoulliveIcon.arrowRight(),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext, modelId) => const Divider(),
    ),
  );
}
