import 'package:flutter/material.dart';
import 'package:soulive/design/ColorStyles.dart';

//아이콘과 텍스트가 결합된 위젯
class CustomTitle extends StatelessWidget {
  final IconData iconData;
  final String title;

  const CustomTitle({ Key? key,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData, //임시 아이콘(디자인 확정나면 바꿀 예정)
          size: 16,
          color: AppColors.g2,
        ),
        SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: 'pretendard',
            color: AppColors.g2,
          ),
        ),
      ],
    );
  }
}
