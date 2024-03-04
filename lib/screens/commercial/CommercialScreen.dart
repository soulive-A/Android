import 'package:flutter/material.dart';
import 'package:soulive/screens/screen_index.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/SoulliveIcon.dart';
import 'package:soulive/design/component/CustomContainer.dart';
import 'package:soulive/design/component/CustomTitle.dart';

class CommercialScreen extends StatefulWidget {
  const CommercialScreen({super.key});

  @override
  State<CommercialScreen> createState() => _CommercialScreen();
}

class _CommercialScreen extends State<CommercialScreen> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        leading: IconButton(
            icon: SoulliveIcon.arrowLeft(),
            onPressed: () {
              //뒤로가기 동작
            }),
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.g6,
        title: const Text("광고 상품 추가", style: FontStyles.appbarFont),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 22),
              //텍스트
              CustomTitle(iconData: Icons.construction, title: '기업명'),

              const SizedBox(height: 22),

              Container(
                height: 450,
                decoration: BoxDecoration(
                  color: AppColors.s3,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.s3, width: 3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '기업명',
                        style: FontStyles.questionFont,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'ex) OO회사, 애플',
                          hintStyle: FontStyles.hintFont,
                        ),
                      ),
                      SizedBox(height: 35),
                      Row(
                        children: [
                          Text(
                            '브랜드명',
                            style: FontStyles.questionFont,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                '없음',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'pretendard',
                                  color: AppColors.g2,
                                ),
                              ),
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'ex) 아이폰, 아이패드',
                          hintStyle: FontStyles.hintFont,
                        ),
                      ),
                      SizedBox(height: 35),
                      Row(
                        children: [
                          Text(
                            '목표 브랜드 이미지 키워드',
                            style: FontStyles.questionFont,
                          ),
                          Text(
                            " (최대 3개)",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'pretendard',
                              color: AppColors.g2,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.g6,
                          foregroundColor: AppColors.g3,
                          minimumSize: Size(78, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          '기본 키워드 보기',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'pretendard',
                            color: AppColors.g3,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'ex) 고급스러움, 키치함',
                                hintStyle: FontStyles.hintFont,
                              ),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.add_circle),
                              onPressed: () {
                                //태그 추가 로직 작성
                              },
                              iconSize: 40,
                              color: AppColors.g2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 35,
              ),

              CustomTitle(iconData: Icons.construction, title: '상품 정보'),

              SizedBox(height: 22),

              CustomContainer(
                  questionOne: '상품명',
                  hintOne: 'ex) 아이패드 에어, 아이폰 프로',
                  questionTwo: '강조할 제품 특징',
                  hintTwo: 'ex) 초광각 카메라 탑재',
                  selectKeywords: '상품 이미지 키워드',
                  hintKeywords: 'ex) 고급스러움, 키치함'),

              SizedBox(
                height: 35,
              ),


              CustomTitle(iconData: Icons.person, title: '타겟'),

              SizedBox(height: 22),

              Container(
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "성별",
                            style: TextStyle(
                              fontFamily: 'pretendard',
                              fontSize: 16,
                              color: AppColors.g2,
                            ),
                          ),
                          Text(
                            " (중복 선택 가능)",
                            style: TextStyle(
                              fontFamily: 'pretendard',
                              fontSize: 12,
                              color: AppColors.g2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.g6,
                                foregroundColor: AppColors.g2,
                              ),
                              child: Text('남자'),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.g6,
                                foregroundColor: AppColors.g2,
                              ),
                              child: Text('여자'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 35),
                      Row(
                        children: [
                          Text(
                            "연령대",
                            style: TextStyle(
                              fontFamily: 'pretendard',
                              fontSize: 16,
                              color: AppColors.g2,
                            ),
                          ),
                          Text(
                            " (중복 선택 가능)",
                            style: TextStyle(
                              fontFamily: 'pretendard',
                              fontSize: 12,
                              color: AppColors.g2,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.g6,
                                  foregroundColor: AppColors.g2,
                                ),
                                child: Text('10대'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.g6,
                                  foregroundColor: AppColors.g2,
                                ),
                                child: Text('20대'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.g6,
                                  foregroundColor: AppColors.g2,
                                ),
                                child: Text('30대'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.g6,
                                  foregroundColor: AppColors.g2,
                                ),
                                child: Text('40대'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.g6,
                                  foregroundColor: AppColors.g2,
                                ),
                                child: Text('50대'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.g6,
                                  foregroundColor: AppColors.g2,
                                ),
                                child: Text('60대 이상'),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 35),
                      Text(
                        "구체적 범주",
                        style: TextStyle(
                          fontFamily: 'pretendard',
                          fontSize: 16,
                          color: AppColors.g2,
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'ex) 고급스러움, 키치함',
                                hintStyle: TextStyle(
                                  fontFamily: 'pretendard',
                                  fontSize: 16,
                                  color: AppColors.g5,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.add_circle),
                              onPressed: () {},
                              iconSize: 40,
                              color: AppColors.g2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.m1,
                  foregroundColor: Colors.white,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: Text(
                  '등록하기',
                  style: TextStyle(
                    fontFamily: 'pretendard',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
