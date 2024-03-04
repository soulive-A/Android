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
    return fromAsset('ic_logo_purple', width: width, height: height);
  }

}