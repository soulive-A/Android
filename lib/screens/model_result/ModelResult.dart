import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/SoulliveIcon.dart';
import 'package:soulive/screens/model_result/ModelTab1Screen.dart';
import 'package:soulive/viewModel/TabViewModel.dart';

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
            },
          ),
          title: Text('모델 분석',
              style: FontStyles.appbarFont),
          centerTitle: true,
        ),
        body: Container(
          color: AppColors.bg,
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
                          TextButton(
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
                                style: TextStyle(
                                  fontSize: 13.86,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'pretendard',
                                  color: viewModel.selectedTab == i ? Colors.white : AppColors.g5
                                ),
                              ),
                            ),
                          ),
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
              TabBar(
                labelStyle: TextStyle(
                  fontSize: 13,
                  fontFamily: 'pretendard',
                  fontWeight: FontWeight.w600
                ),
                indicatorColor: AppColors.g1,
                indicatorWeight: 2,
                tabs: [
                  Tab(
                    text: '모델 소개',
                    height: 31,
                  ),
                  Tab(
                    text: '화제성',
                    height: 31,
                  ),
                  Tab(
                    text: '부정이슈',
                    height: 31,
                  ),
                  Tab(
                    text: '모델 적합도',
                    height: 31,
                  ),
                ],

              ),
              Expanded(
                  child: TabBarView(
                    children: [
                      ModelTab1Screen(),

                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

}


Widget MainCard(){
  return Card(
    elevation: 10.0,
    color: Colors.white,
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
          children: [
            Row(
              children: [
                Text('아이린',
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.77,
                      color: Colors.black
                  ),
                ),
                SizedBox(width: 7,),
                Text('가수/아이돌',
                  style: TextStyle(
                    fontSize: 10.15,
                    fontFamily: 'pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
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
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                fontFamily: 'pretendard',
                fontSize: 9.23,
              ),
            ),
            SizedBox(height: 7),
            Text(
              '소속사: SM 엔터테인먼트',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'pretendard',
                fontSize: 9.23,
              ),
            )
          ],
        )
      ],
    ),
  );
}