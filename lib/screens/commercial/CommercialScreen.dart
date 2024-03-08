import 'package:flutter/material.dart';
import 'package:soulive/screens/commercial/Productadd.dart';
import 'package:soulive/screens/screen_index.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/SoulliveIcon.dart';
import 'package:soulive/design/component/CustomContainer.dart';
import 'package:soulive/design/component/CustomTitle.dart';
import 'package:soulive/model/productModel.dart';

class CommercialScreen extends StatefulWidget {
  const CommercialScreen({super.key});

  @override
  State<CommercialScreen> createState() => _CommercialScreen();
}

class _CommercialScreen extends State<CommercialScreen> {
  //목표 기업 이미지
  List<String> selectedCompany = [
    '세련됨',
    '프리미엄',
  ];

  //목표 상품 이미지
  List<String> selectedProduct = [
    '세련됨',
    '프리미엄',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('모델',
            style: FontStyles.AppTitle1.copyWith(color: AppColors.s3)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Stack(
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

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  '최근 본 모델',
                  style: FontStyles.Headline1.copyWith(color: AppColors.g2),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


//광고 상품 정보 컨테이너
Widget productDisplay(
  String company,
  String product,
  List<String> companyKeyword,
  List<String> productKeyword,
  String productFeat,
  List<String> genders,
  List<String> ages,
) {
  return Container(
    padding: EdgeInsets.all(20),
    width: double.infinity,
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
        children: [
          Text(
            company,
            style: FontStyles.Headline1.copyWith(color: AppColors.g2),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            product,
            style: FontStyles.Headline1.copyWith(color: AppColors.g1),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Text(
            '목표 기업 이미지',
            style: FontStyles.Subcopy2.copyWith(color: AppColors.g1),
          ),
          SizedBox(
            width: 15,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            children: companyKeyword.map((tag) {
              return Chip(
                labelPadding: EdgeInsets.zero,
                label: Text(
                  tag,
                  style: FontStyles.Subcopy7.copyWith(color: AppColors.g2),
                ),
                backgroundColor: AppColors.s1,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: AppColors.s1,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              );
            }).toList(),
          ),
        ],
      ),
      //SizedBox(height: 10,),
      //목표 상품 이미지
      Row(
        children: [
          Text(
            '목표 상품 이미지',
            style: FontStyles.Subcopy2.copyWith(color: AppColors.g1),
          ),
          SizedBox(
            width: 15,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            children: productKeyword.map((tag) {
              return Chip(
                labelPadding: EdgeInsets.zero,
                label: Text(
                  tag,
                  style: FontStyles.Subcopy7.copyWith(color: AppColors.g2),
                ),
                backgroundColor: AppColors.s1,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: AppColors.s1,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              );
            }).toList(),
          ),
        ],
      ),
      //브랜드이미지
      Row(
        children: [
          Icon(Icons.bookmark),
          SizedBox(
            width: 10,
          ),
          Text(
            productFeat,
            style: FontStyles.Subcopy7.copyWith(color: AppColors.g2),
          ),
        ],
      ),
      Row(
        children: [
          //성별
          Icon(Icons.person),
          SizedBox(
            width: 10,
          ),
          Text(
            '남녀노소',
            style: FontStyles.Subcopy7.copyWith(color: AppColors.g2),
          ),

          SizedBox(
            width: 30,
          ),

          //연령
          Icon(Icons.collections_bookmark_outlined),
          SizedBox(
            width: 10,
          ),
          Text(
            '10대, 20대',
            style: FontStyles.Subcopy7.copyWith(color: AppColors.g2),
          ),
        ],
      ),
    ]),
  );
}
