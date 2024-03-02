import 'package:flutter/material.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/SoulliveIcon.dart';

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
              Row(
                children: [
                  Icon(
                    Icons.account_balance, //임시 아이콘(디자인 확정나면 바꿀 예정)
                    size: 16,
                    color: AppColors.g2,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "기업 정보",
                    style: TextStyle(
                      fontFamily: 'pretendard',
                      fontSize: 16,
                      color: AppColors.g2,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "기업명",
                        style: TextStyle(
                          fontFamily: 'pretendard',
                          fontSize: 16,
                          color: AppColors.g2,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'ex) OO회사, 애플',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors.g5,
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      Row(
                        children: [
                          Text(
                            "브랜드명",
                            style: TextStyle(
                              fontFamily: 'pretendard',
                              fontSize: 16,
                              color: AppColors.g2,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                '없음',
                                style: TextStyle(
                                  fontFamily: 'pretendard',
                                  fontSize: 16,
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
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors.g5,
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      Row(
                        children: [
                          Text(
                            "현재 브랜드 이미지 키워드",
                            style: TextStyle(
                              fontFamily: 'pretendard',
                              fontSize: 16,
                              color: AppColors.g2,
                            ),
                          ),
                          Text(
                            " (최대 3개)",
                            style: TextStyle(
                              fontFamily: 'pretendard',
                              fontSize: 12,
                              color: AppColors.g2,
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.m1,
                          foregroundColor: Colors.white,
                          minimumSize: Size(78, 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('기본 키워드 보기'),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'ex) 고급스러움, 키치함',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.g5,
                                ),
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
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
              SizedBox(
                height: 35,
              ),

              Row(
                children: [
                  Icon(
                    Icons.person, //임시 아이콘(디자인 확정나면 바꿀 예정)
                    size: 16,
                    color: AppColors.g2,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "타겟",
                    style: TextStyle(
                      fontFamily: 'pretendard',
                      fontSize: 16,
                      color: AppColors.g2,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

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
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.g6,
                              foregroundColor: AppColors.g2,
                            ),
                            child: Text('남자'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.g6,
                              foregroundColor: AppColors.g2,
                            ),
                            child: Text('여자'),
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
