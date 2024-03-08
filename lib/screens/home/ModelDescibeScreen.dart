
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../design/ColorStyles.dart';
import '../../design/FontStyles.dart';

class ModelDescribeScreen extends StatefulWidget{
  const ModelDescribeScreen({super.key});

  @override
  State<ModelDescribeScreen> createState() => _ModelDescribeScreen();
}

class _ModelDescribeScreen extends State<ModelDescribeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          '모델 추천',
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
        ],
      ),
      );
  }

}