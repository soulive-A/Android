import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:soulive/screens/commercial/Productadd.dart';
import 'package:soulive/screens/screen_index.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/SoulliveIcon.dart';
import 'package:soulive/design/component/CustomContainer.dart';
import 'package:soulive/design/component/CustomTitle.dart';

class CommercialScreen extends StatefulWidget {
  const CommercialScreen({super.key});

  @override
  State<CommercialScreen> createState() => _CommercialScreen();
}

class _CommercialScreen extends State<CommercialScreen> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2;

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
                //광고 상품 정보 컨테이너
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: AppColors.s3,
                    borderRadius: BorderRadius.circular(10),
                    //그림자 임의로 조절한거라 수정 필요할수도
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.g4,
                          blurRadius: 2,
                          offset: Offset(1, 2)),
                    ],
                  ),
                ),
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
