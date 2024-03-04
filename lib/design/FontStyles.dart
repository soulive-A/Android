import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:soulive/design/ColorStyles.dart';

class FontStyles{
  static const logoFont = TextStyle(
    fontSize: 28, fontWeight: FontWeight.w600, fontFamily: 'kristall'
  );
  static const appbarFont = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'pretendard'
  );

  static const questionFont = TextStyle(
    fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'pretendard', color: AppColors.g2,
  );

  static const hintFont = TextStyle(
    fontSize: 13, fontWeight: FontWeight.normal, fontFamily: 'pretendard', color: AppColors.g5,
  );

  //확정나면 바꿔야함
  // static const head1 = TextStyle(
  //     fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'pretendard',
  // );
  //
  // static const head2 = TextStyle(
  //     fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'pretendard',
  // );
  //
  // static const head3 = TextStyle(
  //     fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'pretendard', height: 1.25,
  // );
  //
  // static const sub1 = TextStyle(
  //   fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'pretendard',
  // );
  //
  // static const sub2 = TextStyle(
  //   fontSize: 10, fontWeight: FontWeight.bold, fontFamily: 'pretendard',
  // );
  //
  // static const sub3 = TextStyle(
  //   fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'pretendard',
  // );
  //
  // static const sub4 = TextStyle(
  //   fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'pretendard',
  // );
  //
  // static const sub5 = TextStyle(
  //   fontSize: 10, fontWeight: FontWeight.normal, fontFamily: 'pretendard',
  // );
  //
  // static const sub6 = TextStyle(
  //   fontSize: 13, fontWeight: FontWeight.normal, fontFamily: 'pretendard',
  // );
}