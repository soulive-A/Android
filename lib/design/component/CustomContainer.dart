import 'package:flutter/material.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';

import '../SoulliveIcon.dart';

//광고 추가 페이지 컨테이너 박스용
class CustomContainer extends StatelessWidget {
  final String questionOne;
  final String hintOne;
  final String questionTwo;
  final String hintTwo;
  final String selectKeywords;
  final String hintKeywords;

  const CustomContainer(
      {Key? key,
      required this.questionOne,
      required this.hintOne,
      required this.questionTwo,
      required this.hintTwo,
      required this.selectKeywords,
      required this.hintKeywords})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              questionOne,
              style: FontStyles.questionFont,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: hintOne,
                hintStyle: FontStyles.hintFont,
              ),
            ),
            SizedBox(height: 35),
            Text(
              questionTwo,
              style: FontStyles.questionFont,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: hintTwo,
                hintStyle: FontStyles.hintFont,
              ),
            ),
            SizedBox(height: 35),
            Row(
              children: [
                Text(
                  selectKeywords,
                  style: FontStyles.questionFont,
                ),
                Text(
                  " (최대 3개)",
                  style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.g6,
                foregroundColor: AppColors.g3,
                minimumSize: Size(78, 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                '기본 키워드 보기',
                style: FontStyles.Subcopy2.copyWith(color: AppColors.g3),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: hintKeywords,
                      hintStyle: FontStyles.hintFont,
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: SoulliveIcon.plusIcon(),
                    onPressed: () {
                      //태그 추가 로직 작성
                    },
                    iconSize: 40,
                    color: AppColors.g2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      height: 450,
      decoration: BoxDecoration(
        color: AppColors.s3,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.s3, width: 3),
      ),
    );
  }
}
