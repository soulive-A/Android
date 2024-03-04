import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/SoulliveIcon.dart';
import 'package:soulive/screens/model_result/ModelTab1Screen.dart';
import 'package:soulive/screens/model_result/ModelTab2Screen.dart';
import 'package:soulive/viewModel/TabViewModel.dart';

import 'ModelTab3Screen.dart';
import 'ModelTab4Screen.dart';

class ModelResultScreen extends StatefulWidget{
  const ModelResultScreen({super.key});

  @override
  State<ModelResultScreen> createState() => _ModelResultScreen();
}

class _ModelResultScreen extends State<ModelResultScreen>{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TabViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bg,
          leading: IconButton(
            icon: SoulliveIcon.arrowLeft(),
            onPressed: () {
              //뒤로가기 로직 추가
              Navigator.pop(context);
            },
          ),
          title: Text('모델 분석',
              style: FontStyles.appbarFont),
          centerTitle: true,
        ),
        body: Container(
          color: AppColors.bg,
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                SizedBox(height: 36),
                //모델 선택 토글
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Consumer<TabViewModel>(
                    builder: (context, viewModel, child) {
                      return Row(
                        children: [
                          for(var i =0; i<3; i++)
                            Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: TextButton(
                                  onPressed: (){
                                    viewModel.selectTab(i);
                                    //api 호출하여 데이터 업데이트하는 로직 추가
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(viewModel.selectedTab == i ? AppColors.m1 : AppColors.s3),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.47),
                                          side: viewModel.selectedTab == i ? BorderSide.none
                                              :BorderSide(color:AppColors.border, width: 1),
                                        )
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                                    child: Text(
                                        '안녕',
                                        style: FontStyles.Headline1.copyWith(color: viewModel.selectedTab == i ? Colors.white : AppColors.g4)
                                      //FontStyles.Headline1
                                    ),
                                  ),
                                ),
                            )
                        ],
                      );
                    },
                  )
                ),
                SizedBox(height: 18.98,),
               Padding(
                   padding: EdgeInsets.symmetric(horizontal: 20),
                 child:  MainCard(),
               ),
                SizedBox(height: 41,),
                _tabBar(),
                Expanded(child: _tabBarView())
              ],
            ),
          ),
        ),
      ),
    );
  }

}
//활성화 g1 g3는 언샐랙트
Widget _tabBar(){
  return const TabBar(
    labelColor: AppColors.g1,
    unselectedLabelColor: AppColors.g3,
    labelStyle: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      fontFamily: 'pretendard',
      color: AppColors.g1
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: 'pretendard',
      fontWeight: FontWeight.w500,
      fontSize: 13,
        color: AppColors.g3
    ),
    indicatorColor: AppColors.g1,
    tabs: [
      Tab(text: '모델 소개'),
    Tab(text:'화제성'),
    Tab(text:'부정이슈'),
    Tab(text:'모델 적합도'),
  ],
  );
}

Widget _tabBarView(){
  return TabBarView(
      children: [
        ModelTab1Screen(),
        ModelTab2Screen(),
        ModelTab3Screen(),
        ModelTab4Screen(),
      ]
  );
}

Widget MainCard(){
  return Card(
    color: AppColors.s3,
    elevation: 10.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13),
    ),
    child: Row(
      children: [
        //예시 이미지 추후 변경 필요
        SizedBox(width: 20),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // 둥근 모서리의 반지름 설정
            child: Image.asset(
              'assets/images/background.png',
              width: 84,
              height: 118,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('아이린',
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.77,
                      color: AppColors.g1
                  ),
                ),
                SizedBox(width: 7,),
                Text('가수/아이돌',
                  style: TextStyle(
                    fontSize: 10.15,
                    fontFamily: 'pretendard',
                    fontWeight: FontWeight.w600,
                      color: AppColors.g4
                  ),
                )
              ],
            ),
            SizedBox(height: 7),
            Text(
              '1991.03.19 (32세)',
              style: TextStyle(
                color: AppColors.g4,
                fontWeight: FontWeight.w500,
                fontSize: 10.15,
                fontFamily: 'pretendard'
              ),
            ),
            SizedBox(height: 6,),
            Text(
              '걸그룹 레드벨벳 멤버',
              style: TextStyle(
                  color: AppColors.g1,
                  fontWeight: FontWeight.w500,
                fontFamily: 'pretendard',
                fontSize: 9.23,
              ),
            ),
            SizedBox(height: 7),
            Text(
              '소속사:SM 엔터테인먼트',
              style: TextStyle(
                color: AppColors.g1,
                fontWeight: FontWeight.w500,
                fontFamily: 'pretendard',
                fontSize: 9.23,
              ),
            ),
            Row(
              //ai추천 추가하기 백에서 오는 데이터 형식 보고
            )
          ],
        )
      ],
    ),
  );
}