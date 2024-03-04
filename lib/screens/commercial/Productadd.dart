import 'package:flutter/material.dart';
import 'package:soulive/screens/screen_index.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/SoulliveIcon.dart';
import 'package:soulive/design/component/CustomContainer.dart';
import 'package:soulive/design/component/CustomTitle.dart';
import 'package:soulive/design/component/CustomElevatedButton.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreen();
}

class _ProductAddScreen extends State<ProductAddScreen> {
  var isChecked = false;
  int isPressed = 0;

  List<String> allTags = [];
  List<String> selectedTags = [];

  //기업 정보 텍스트
  TextEditingController companyController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController brandKeywordController = TextEditingController();

  //상품 정보 텍스트
  TextEditingController productNameController = TextEditingController();
  TextEditingController productFeatController = TextEditingController();
  TextEditingController productKeywordController = TextEditingController();

  //타겟 텍스트
  TextEditingController targetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        leading: IconButton(
            icon: SoulliveIcon.arrowLeft(),
            onPressed: () {
              //뒤로가기 동작
              Navigator.pop(context);
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
              CustomTitle(iconData: Icons.business, title: '기업명'),

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
                        controller: companyController,
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
                                activeColor: AppColors.s3,
                                checkColor: AppColors.g2,
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
                        //체크박스 표시할 시 비활성화
                        enabled: isChecked != false ? false : true,
                        controller: brandNameController,
                        decoration: InputDecoration(
                          hintText: 'ex) 아이폰, 아이패드',
                          hintStyle: FontStyles.hintFont,
                          //체크박스 표시할 시 색상 채우기
                          filled: isChecked != false ? true : false,
                          fillColor: AppColors.g6,
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
                              controller: brandKeywordController,
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
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: AppColors.s3,
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '관련 이미지 키워드를 선택해주세요.',
                                            style: FontStyles.questionFont,
                                          ),
                                          Text(
                                            '최대 3가지 선택 가능합니다.',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'pretendard',
                                              color: AppColors.g2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      content: Wrap(
                                        spacing: 8,
                                        runSpacing: 4,
                                        direction: Axis.horizontal,
                                        alignment: WrapAlignment.start,
                                        children: <Widget>[
                                          ActionChip(
                                            label: Text(
                                              '새로운',
                                              style: TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'pretendard',
                                                color: AppColors.g2,
                                              ),
                                            ),
                                            backgroundColor: AppColors.g6,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: AppColors.g6,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            onPressed: () {
                                              print('눌렸다!');
                                            },
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        CustomElevatedButton(
                                            backgroundColor: AppColors.m1,
                                            borderColor: AppColors.m1,
                                            textColor: AppColors.s3,
                                            title: '추가하기',
                                            onPressed: () {
                                              print('테스트');
                                            }),
                                      ],
                                    );
                                  },
                                );
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

              CustomTitle(iconData: Icons.shopping_bag, title: '상품 정보'),

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
                            style: FontStyles.questionFont,
                          ),
                          Text(
                            " (중복 선택 가능)",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'pretendard',
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
                            style: FontStyles.questionFont,
                          ),
                          Text(
                            " (중복 선택 가능)",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'pretendard',
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
                        style: FontStyles.questionFont,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextField(
                              controller: targetController,
                              decoration: InputDecoration(
                                hintText: 'ex) 고급스러움, 키치함',
                                hintStyle: FontStyles.hintFont,
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
              CustomElevatedButton(
                  backgroundColor: AppColors.m1,
                  borderColor: AppColors.m1,
                  textColor: AppColors.s3,
                  title: '등록하기',
                  onPressed: () {
                    //다이얼로그 표시
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      //false로 지정해주면 확인 버튼이 아닌 다른 영역을 아무리 클릭을 해도 창이 닫히지 않는다.
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: AppColors.s3,
                          actionsAlignment: MainAxisAlignment.center,
                          content: Text(
                            '광고 상품 등록이 완료되었습니다.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'pretendard',
                              color: AppColors.g1,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                '확인',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'pretendard',
                                  color: AppColors.g1,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
