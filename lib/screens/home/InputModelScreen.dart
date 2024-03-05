import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soulive/screens/model_result/ModelResult.dart';

import '../../design/ColorStyles.dart';
import '../../design/FontStyles.dart';
import '../../design/SoulliveIcon.dart';

class InputModelScreen extends StatefulWidget{
  const InputModelScreen({super.key});

  @override
  State<InputModelScreen> createState() => _InputModelScreen();

}

class _InputModelScreen extends State<InputModelScreen>{
  final List<String> _tags = [];
  final TextEditingController _controller = TextEditingController();

  void _addTag(String tag){
    setState(() {
      _tags.add(tag);
      _controller.clear();
    });
  }
  void _removeTag(String tag){
    setState(() {
      _tags.remove(tag);
    });
  }

  Widget _chipTag(String tag){
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical:5 ),
            decoration: BoxDecoration(
              color: AppColors.s1,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('$tag', style: FontStyles.Subcopy6.copyWith(color: AppColors.g2),),
                GestureDetector(
                  onTap: (){
                    _removeTag(tag);
                  },
                  child: SoulliveIcon.deleteIcon(),
                )
              ],
            ),
          ),
          SizedBox(width: 7,)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        leading: IconButton(
          icon: SoulliveIcon.arrowLeft(),
          onPressed: () {
            //뒤로가기 로직 추가
            Navigator.pop(context);
          },
        ),
        title: Text('후보 모델 작성',
            style: FontStyles.Headline1),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.bg,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 59,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text('후보 모델을 작성해주세요.',
                      style: FontStyles.Headline2.copyWith(color: AppColors.g2),),
                    SizedBox(width: 5,),
                    Text('(최대 3인)',
                      style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),)
                  ],
                ),
              ),
              SizedBox(height: 31,),
              Card(
                color: AppColors.s3,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: '모델 이름',
                                    hintStyle: FontStyles.Subcopy8.copyWith(color: AppColors.g5),
                                    isCollapsed: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.g5, width: 0.8),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.g2, width: 1),
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(4, 0, 0, 6)
                                ),
                              )
                          ),
                          GestureDetector(
                            onTap: () => _addTag(_controller.text),
                            child: SoulliveIcon.plusIcon(),
                          )
                        ],
                      ),
                      SizedBox(height: 14,),
                      Row(
                        children: [
                          _tags.isNotEmpty
                              ? Wrap(
                              children: _tags.map((tag) => _chipTag(tag)).toList()
                          )
                              :Container()
                        ],
                      ),
                    ],
                  )
                )
              ),
              Spacer(),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ModelResultScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _tags.isNotEmpty ? AppColors.m1 : AppColors.g5,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 13.76),
                        child: Text(
                          '완료',
                          textAlign: TextAlign.center,
                          style: FontStyles.Subcopy1.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 28.48,)
                ],
              )
            ],
          ),
        )
      ),
    );
  }


}


