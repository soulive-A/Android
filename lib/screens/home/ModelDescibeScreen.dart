
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../design/ColorStyles.dart';
import '../../design/FontStyles.dart';
import '../../viewModel/RecommendViewModel.dart';

class ModelDescribeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<RecommendViewModel>(
        create: (_) => RecommendViewModel(),
      child: ModelDescribe(),
    );
  }
}

class ModelDescribe extends StatelessWidget{
  const ModelDescribe({Key? key}) : super(key:key);
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