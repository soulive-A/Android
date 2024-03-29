import 'dart:convert';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/SoulliveIcon.dart';
import 'package:soulive/model/GetModelFitness.dart';
import 'package:soulive/model/GetModelNegative.dart';
import 'package:soulive/model/GetModelPopular.dart';
import 'package:soulive/screens/model_result/ModelTab1Screen.dart';
import 'package:soulive/screens/model_result/ModelTab2Screen.dart';
import 'package:soulive/viewModel/TabViewModel.dart';
import 'package:http/http.dart' as http;
import 'package:soulive/model/GetCheckModel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../model/GetModelIntroduce.dart';
import 'ModelTab3Screen.dart';
import 'ModelTab4Screen.dart';

class ModelResult extends StatelessWidget{
  final bool isModelDescribe;
  ModelResult({Key? key, required this.isModelDescribe}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<TabViewModel>(
        create: (_) => TabViewModel(),
      child: ModelResultScreen(isModelDescribe: isModelDescribe),
    );
  }
}


class ModelResultScreen extends StatelessWidget{
  final bool isModelDescribe;
  const ModelResultScreen({Key? key, required this.isModelDescribe}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final modelName = ["김희애", "김고은", "한지민"];
    final tabViewModel = Provider.of<TabViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(tabViewModel.currentModel == null){
        tabViewModel.fetchCheckModel("김희애", 1);
      }
      if(tabViewModel.modelIntroduce == null){
        tabViewModel.fetchModelIntroduce("김희애");
      }
      if(tabViewModel.modelPopular == null){
        tabViewModel.fetchModelPopular("김희애");
      }
      if(tabViewModel.modelNegative == null){
        tabViewModel.fetchModelNegative("김희애");
      }
      if(tabViewModel.modelFitness == null){
        tabViewModel.fetchModelFitness("김희애", 1);
      }
    });
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
          title: Text('모델 분석',
              style: FontStyles.Headline1.copyWith(color: AppColors.g1)),
          centerTitle: true,
        ),
        body: Consumer<TabViewModel>(
          builder: (context,viewModel,child) {
            final modelData = viewModel.currentModel?.data;
            if(modelData == null){
              return Center(child: CircularProgressIndicator(),);
            }
            final modelntroduce = viewModel.modelIntroduce;
            if(modelntroduce == null){
              return Center(child: CircularProgressIndicator(),);
            }
            final modelPopular = viewModel.modelPopular;
            if(modelPopular == null){
              return Center(child: CircularProgressIndicator(),);
            }
            final modelNegative = viewModel.modelNegative;
            if(modelNegative == null){
              return Center(child: CircularProgressIndicator(),);
            }
            final modelFitness = viewModel.modelFitness;
            if(modelFitness == null){
              return Center(child: CircularProgressIndicator(),);
            }
            if(modelData != null){
              return Container(
                color: AppColors.bg,
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      !isModelDescribe ? SizedBox(height: 36) : Container(),
                      //모델 선택 토글
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                                children: [
                                  for(var i =0; i<3; i++)
                                    !isModelDescribe ? Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: TextButton(
                                        onPressed: (){
                                          viewModel.selectTab(i);
                                          viewModel.fetchCheckModel(modelName[i], 1);
                                          viewModel.fetchModelIntroduce(modelName[i]);
                                          viewModel.fetchModelPopular(modelName[i]);
                                          viewModel.fetchModelNegative(modelName[i]);
                                          viewModel.fetchModelFitness(modelName[i], 1);
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
                                              '${modelName[i]}',
                                              style: FontStyles.Headline2.copyWith(color: viewModel.selectedTab == i ? Colors.white : AppColors.g4)
                                            //FontStyles.Headline1
                                          ),
                                        )
                                      ),
                                    ) : Container(),
                                ],
                              )
                      ),
                      SizedBox(height: 16.98,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child:  MainCard(modelData.imageUrl!,modelData.modelName!,modelData.job!,modelData.birth!, modelData.age!,modelData.info!, modelData.agency!, modelData.aiRate?.toInt() ?? 0 ),
                      ),
                      SizedBox(height: 33,),
                      _tabBar(),
                      Expanded(child: _tabBarView(modelntroduce!, modelPopular!, modelNegative!, modelFitness!))
                    ],
                  ),
                ),
              );
            }else{
              return Center(
                  child: CircularProgressIndicator()
              );
            }
          },
        )
    );
  }
}
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

Widget _tabBarView(
    GetModelIntroduce tab1data,
    GetModelPopular tab2data,
    GetModelNegative tab3data,
    GetModelFitness tab4data
    ){
  return TabBarView(
      children: [
        ModelTab1Screen(modelIntroduceData: tab1data),
        ModelTab2Screen(modelPopular: tab2data,),
        ModelTab3Screen(modelNegative: tab3data,),
        ModelTab4Screen(modelFitness: tab4data),
      ]
  );
}

//메인 카드
Widget MainCard(
    String imageUrl,
    String modelName,
    String job,
    String birth,
    String age,
    String info,
    String agency,
    int aiRate
    ){
  return Card(
    color: AppColors.s3,
    elevation: 10.0,
    surfaceTintColor: Colors.transparent,
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
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
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
            SizedBox(height: 27,),
            Row(
              children: [
                Text(modelName,
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 14.77,
                      color: AppColors.g1
                  ),
                ),
                SizedBox(width: 7,),
                Text(job,
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
              '${birth} ($age)',
              style: TextStyle(
                  color: AppColors.g4,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.15,
                  fontFamily: 'pretendard'
              ),
            ),
            SizedBox(height: 6,),
            Text(
              info,
              style: TextStyle(
                color: AppColors.g1,
                fontWeight: FontWeight.w500,
                fontFamily: 'pretendard',
                fontSize: 9.23,
              ),
            ),
            SizedBox(height: 7),
            Text(
              '소속사: $agency',
              style: TextStyle(
                color: AppColors.g1,
                fontWeight: FontWeight.w500,
                fontFamily: 'pretendard',
                fontSize: 9.23,
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text('AI 추천', style: FontStyles.Subcopy2,),
                SizedBox(width: 9,),
                for(int i=0; i<aiRate; i++)
                  Padding(
                    padding: EdgeInsets.only(right: 3),
                    child: SoulliveIcon.starFill(),
                  ),
                for(int i=0; i<5-aiRate; i++)
                  Padding(
                    padding: EdgeInsets.only(right: 3),
                    child: SoulliveIcon.starunFill(),
                  ),
              ],
            ),
            SizedBox(height: 27,)
          ],
        )
      ],
    ),
  );
}