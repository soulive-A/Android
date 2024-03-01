import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//이 버튼은 보여주기만 하는 용도
class CustomTextButton extends StatelessWidget{
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final Color backgroundColor;
  final Color textColor;

  const CustomTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isEnabled = false,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      color: backgroundColor,
      //textstyle추가 필요
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      )
    );
  }
  
}