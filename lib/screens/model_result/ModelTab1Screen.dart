
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/component/CustomTextButton.dart';
import 'package:soulive/viewModel/TabViewModel.dart';

class ModelTab1Screen extends StatefulWidget{
  const ModelTab1Screen({super.key});

  @override
  State<ModelTab1Screen> createState() => _ModelTab1Screen();
}

class _ModelTab1Screen extends State<ModelTab1Screen>{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TabViewModel(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.bg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //모델이미지 키워드
                SizedBox(height: 17,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: modelKeyword(),
                ),
                SizedBox(height: 25),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: modelRecentDrama(),
                ),
                SizedBox(height: 25,),

                modelRecentCommercial()
              ],
            ),
          ),
        )
      ),
    );
  }
}

Widget modelKeyword(){
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '모델 이미지 키워드',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: 'pretendard'
          ),
        ),
        SizedBox(height: 14,),
        CustomTextButton(text: '세련됨', backgroundColor: AppColors.s1, textColor: AppColors.g2,)
      ],
    ),
  );
}

Widget modelRecentDrama(){
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '최근 작품',
          style: TextStyle(
            fontFamily: 'pretendard',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.black
          ),
        ),
        SizedBox(height: 12,),
        //최근 작품 리스트
      ],
    )
  );
}

Widget modelRecentCommercial(){
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '최근 광고 활동',
          style: TextStyle(
            fontFamily: 'pretendard',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.black
          ),
        )
      ],
    )
  );
}