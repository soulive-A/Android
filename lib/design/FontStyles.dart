import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:soulive/design/ColorStyles.dart';

class FontStyles{
  static const AppTitle1 = TextStyle(
    fontSize: 28, fontWeight: FontWeight.w600, fontFamily: 'kristall'
  );
  //추후 변경 가능성 있음
  static const AppTitle2 = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w600, fontFamily: 'kristall'
  );
  static const Headline1 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'pretendard'
  );
  static const Headline2 = TextStyle(
      fontSize: 13, fontWeight: FontWeight.w600, fontFamily: 'pretendard'
  );
  static const Headline3 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'pretendard'
  );
  static const Subcopy1 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'pretendard'
  );
  static const Subcopy2 = TextStyle(
      fontSize: 10, fontWeight: FontWeight.w600, fontFamily: 'pretendard'
  );
  static const Subcopy3 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'pretendard'
  );
  static const Subcopy4 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'pretendard'
  );
  static const Subcopy5 = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'pretendard'
  );
  static const Subcopy6 = TextStyle(
      fontSize:10, fontWeight: FontWeight.w500, fontFamily: 'pretendard'
  );
  static const Subcopy7 = TextStyle(
      fontSize: 9, fontWeight: FontWeight.w400, fontFamily: 'pretendard'
  );
  static const Subcopy8 = TextStyle(
      fontSize: 13, fontWeight: FontWeight.w400, fontFamily: 'pretendard'
  );
  static const Subcopy9 = TextStyle(
      fontSize: 8, fontWeight: FontWeight.w400, fontFamily: 'pretendard'
  );


  //변경하기
  static const appbarFont = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'pretendard'
  );

  static const questionFont = TextStyle(
    fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'pretendard', color: AppColors.g2,
  );

  static const hintFont = TextStyle(
    fontSize: 13, fontWeight: FontWeight.normal, fontFamily: 'pretendard', color: AppColors.g5,
  );

}