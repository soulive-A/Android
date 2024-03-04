import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String title;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.title,
    required this.onPressed,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'pretendard',
          color: textColor,
        ),
      ),
    );
  }
}
