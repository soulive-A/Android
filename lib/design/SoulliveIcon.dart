import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SoulliveIcon{
  static Widget fromAsset(String iconName,
      {double width = 17, double height =17}){
    final assetPath = 'assets/icons/$iconName.svg';
    return SvgPicture.asset(
      assetPath,
      width: width,
      height: height
    );
  }

  static Widget homeFill({double width = 17, double height = 17, Color? color}){
    return fromAsset('ic_home_fill', width: width, height: height);
  }

  static Widget homeunFill({double width = 17, double height = 17, Color? color}){
    return fromAsset('ic_home_unfill', width: width, height: height);
  }

  static Widget secondFill({double width = 17, double height = 17, Color? color}){
    return fromAsset('ic_second_fill', width: width, height: height);
  }

  static Widget secondunFill({double width = 17, double height = 17, Color? color}){
    return fromAsset('ic_second_unfill', width: width, height: height);
  }

  static Widget mypageFill({double width = 17, double height = 17, Color? color}){
    return fromAsset('ic_mypage_fill', width: width, height: height);
  }

  static Widget mypageunFill({double width = 17, double height = 17, Color? color}){
    return fromAsset('ic_mypage_unfill', width: width, height: height);
  }

  static Widget arrowLeft({double width = 18, double height = 18, Color? color}){
    return fromAsset('ic_arrow', width: width, height: height);
  }

  static Widget logoWhite({double width = 49, double height = 55, Color? color}){
    return fromAsset('ic_logo_white', width: width, height: height);
  }

  static Widget logoPurple({double width = 49, double height = 55, Color? color}){
    return fromAsset('ic_logo_puple', width: width, height: height);
  }
  static Widget plusIcon({double width = 29, double height = 29, Color? color}){
    return fromAsset('ic_plus', width: width, height: height);
  }
  static Widget deleteIcon({double width = 8, double height = 8, Color? color}){
    return fromAsset('ic_delete', width: width, height: height);
  }
  static Widget companyIcon({double width = 12, double height = 14, Color? color}){
    return fromAsset('ic_company', width: width, height: height);
  }
  static Widget analysisIcon({double width = 34, double height = 37, Color? color}){
    return fromAsset('ic_analysis', width: width, height: height);
  }
  static Widget recIcon({double width = 29, double height = 36, Color? color}){
    return fromAsset('ic_recommend', width: width, height: height);
  }
  static Widget addTriangleIcon({double width = 12, double height = 7, Color? color}){
    return fromAsset('ic_addTriangle', width: width, height: height);
  }
  static Widget starFill({double width = 11, double height = 11, Color? color}){
    return fromAsset('ic_star_fill', width: width, height: height);
  }
  static Widget starunFill({double width = 11, double height = 11, Color? color}){
    return fromAsset('ic_star_unfill', width: width, height: height);
  }
}