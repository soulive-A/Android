import 'package:flutter/material.dart';
import 'package:soulive/screens/screen_index.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/SoulliveIcon.dart';
//import 'package:soulive/design/component/CustomContainer.dart';
import 'package:soulive/design/component/CustomTitle.dart';
import 'package:soulive/design/component/CustomElevatedButton.dart';
import 'package:soulive/model/productModel.dart';
import 'package:soulive/viewModel/viewProduct.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreen();
}

class _ProductAddScreen extends State<ProductAddScreen> {

  var isChecked = false;

  //버튼 비활성/활성
  List<bool> isPressed = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  bool isSelected = false;
  String currentTag = '';

  List<String> allBrandTags = [
    '세련된',
    '패셔너블한',
    '대중에게 친숙한',
    '새로운',
    '혁신적인',
    '독특한',
    '화려한',
  ];

  List<String> allPdtTags = [
    '세련된',
    '패셔너블한',
    '대중에게 친숙한',
    '새로운',
    '혁신적인',
    '독특한',
    '화려한',
  ];

  //브랜드 이미지
  List<String> selectedTags = [];
  //상품 이미지
  List<String> selectedProduct = [];
  //성별
  List<String> selectedGender = [];
  //나이
  List<String> selectedAge = [];
  //구체적 범주
  List<String> selectedTarget = [];


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


  late productApi productapi;


  @override
  void initState() {
    super.initState();
    productapi = productApi();
  }

  @override
  void dispose() {
    companyController.dispose();
    brandNameController.dispose();
    brandKeywordController.dispose();
    productNameController.dispose();
    productFeatController.dispose();
    productKeywordController.dispose();
    targetController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            icon: SoulliveIcon.arrowLeft(),
            onPressed: () {
              //뒤로가기 동작
              Navigator.pop(context);
            }),
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.bg,
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
              CustomTitle(iconData: Icons.business, title: '기업 정보'),

              const SizedBox(height: 22),

              //첫번째 컨테이너
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
                            style: FontStyles.Subcopy2.copyWith(
                                color: AppColors.g2),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //기본 키워드 다이얼로그 표시
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: AppColors.s3,
                                surfaceTintColor: Colors.transparent,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '관련 이미지 키워드를 선택해주세요.',
                                      style: FontStyles.questionFont,
                                    ),
                                    Text(
                                      '최대 3가지 선택 가능합니다.',
                                      style: FontStyles.Subcopy2.copyWith(
                                          color: AppColors.g2),
                                    ),
                                  ],
                                ),
                                content: Wrap(
                                  spacing: 8,
                                  runSpacing: 4,
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  children: allBrandTags.map((tag) {
                                    return InputChip(
                                      selected: selectedTags.contains(tag),
                                      label: Text(
                                        tag,
                                        style: FontStyles.Subcopy6.copyWith(
                                            color: AppColors.g2),
                                      ),
                                      backgroundColor: AppColors.g6,
                                      selectedColor: AppColors.s1,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      onSelected: (isSelected) {
                                        //태그 색깔 변하게 수정
                                        setState(() {
                                          currentTag = tag;
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                                actions: [
                                  CustomElevatedButton(
                                      backgroundColor: AppColors.m1,
                                      borderColor: AppColors.m1,
                                      textColor: AppColors.s3,
                                      title: '추가하기',
                                      onPressed: () {
                                        //태그 추가 기능 (다중선택도 가능하도록 수정하기)
                                        setState(() {
                                          if (selectedTags.length < 3) {
                                            selectedTags.add(currentTag);
                                          } else
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: AppColors.s3,
                                                content: Text(
                                                  '더 이상 추가할 수 없습니다.',
                                                  style: FontStyles.Subcopy2
                                                      .copyWith(
                                                      color: AppColors.g1),
                                                ),
                                                //임의로 설정한 스낵바, 추후 변경
                                              ),
                                            );
                                        });
                                      }),
                                ],
                              );
                            },
                          );
                        },
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
                          style:
                          FontStyles.Subcopy2.copyWith(color: AppColors.g3),
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
                              icon: SoulliveIcon.plusIcon(),
                              onPressed: () {
                                //태그 추가 로직 작성
                                setState(() {
                                  String newTag = brandKeywordController.text;
                                  if (newTag.isNotEmpty) {
                                    allBrandTags.add(newTag);
                                    brandKeywordController.clear();
                                    //태그 추가 알림창(임시적)
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: AppColors.s3,
                                        content: Text(
                                          '키워드가 추가되었습니다.',
                                          style: FontStyles.Subcopy2.copyWith(
                                              color: AppColors.g1),
                                        ),
                                        //임의로 설정한 스낵바, 추후 변경
                                      ),
                                    );
                                  } else
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: AppColors.s3,
                                        content: Text(
                                          '키워드를 입력해주세요.',
                                          style: FontStyles.Subcopy2.copyWith(
                                              color: AppColors.g1),
                                        ),
                                        //임의로 설정한 스낵바, 추후 변경
                                      ),
                                    );
                                });
                              },
                              iconSize: 40,
                              color: AppColors.g2,
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: selectedTags.map((tag) {
                          return InputChip(
                            label: Text(
                              tag,
                              style: FontStyles.Subcopy6.copyWith(
                                  color: AppColors.g2),
                            ),
                            backgroundColor: AppColors.s1,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: AppColors.s1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            //삭제 버튼
                            onDeleted: () {
                              setState(() {
                                selectedTags.remove(tag);
                              });
                            },
                          );
                        }).toList(),
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

              //두번째 컨테이너
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '상품명',
                        style: FontStyles.questionFont,
                      ),
                      TextField(
                        controller: productNameController,
                        decoration: InputDecoration(
                          hintText: 'ex) 아이패드 에어, 아이폰 프로',
                          hintStyle: FontStyles.hintFont,
                        ),
                      ),
                      SizedBox(height: 35),
                      Text(
                        '강조할 제품 특징',
                        style: FontStyles.questionFont,
                      ),
                      TextField(
                        controller: productFeatController,
                        decoration: InputDecoration(
                          hintText: 'ex) 초광각 카메라 탑재',
                          hintStyle: FontStyles.hintFont,
                        ),
                      ),
                      SizedBox(height: 35),
                      Row(
                        children: [
                          Text(
                            '상품 이미지 키워드',
                            style: FontStyles.questionFont,
                          ),
                          Text(
                            " (최대 3개)",
                            style: FontStyles.Subcopy2.copyWith(color: AppColors.g2),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //기본 키워드 다이얼로그 표시
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: AppColors.s3,
                                surfaceTintColor: Colors.transparent,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '관련 이미지 키워드를 선택해주세요.',
                                      style: FontStyles.questionFont,
                                    ),
                                    Text(
                                      '최대 3가지 선택 가능합니다.',
                                      style: FontStyles.Subcopy2.copyWith(
                                          color: AppColors.g2),
                                    ),
                                  ],
                                ),
                                content: Wrap(
                                  spacing: 8,
                                  runSpacing: 4,
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.start,
                                  children: allPdtTags.map((tag) {
                                    return InputChip(
                                      selected: selectedProduct.contains(tag),
                                      label: Text(
                                        tag,
                                        style: FontStyles.Subcopy6.copyWith(
                                            color: AppColors.g2),
                                      ),
                                      backgroundColor: AppColors.g6,
                                      selectedColor: AppColors.s1,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      onSelected: (isSelected) {
                                        //태그 색깔 변하게 수정
                                        setState(() {
                                          currentTag = tag;
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                                actions: [
                                  CustomElevatedButton(
                                      backgroundColor: AppColors.m1,
                                      borderColor: AppColors.m1,
                                      textColor: AppColors.s3,
                                      title: '추가하기',
                                      onPressed: () {
                                        //태그 추가 기능 (다중선택도 가능하도록 수정하기)
                                        setState(() {
                                          if (selectedProduct.length < 3) {
                                            selectedProduct.add(currentTag);
                                          } else
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: AppColors.s3,
                                                content: Text(
                                                  '더 이상 추가할 수 없습니다.',
                                                  style: FontStyles.Subcopy2
                                                      .copyWith(
                                                      color: AppColors.g1),
                                                ),
                                                //임의로 설정한 스낵바, 추후 변경
                                              ),
                                            );
                                        });
                                      }),
                                ],
                              );
                            },
                          );

                        },
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
                          style: FontStyles.Subcopy2.copyWith(color: AppColors.g3),
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextField(
                              controller: productKeywordController,
                              decoration: InputDecoration(
                                hintText: 'ex) 고급스러움, 키치함',
                                hintStyle: FontStyles.hintFont,
                              ),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: SoulliveIcon.plusIcon(),
                              onPressed: () {
                                //태그 추가 로직 작성
                                setState(() {
                                  String newPdtKeyword = productKeywordController.text;
                                  if (newPdtKeyword.isNotEmpty) {
                                    allPdtTags.add(newPdtKeyword);
                                    productKeywordController.clear();
                                    //태그 추가 알림창(임시적)
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: AppColors.s3,
                                        content: Text(
                                          '키워드가 추가되었습니다.',
                                          style: FontStyles.Subcopy2.copyWith(
                                              color: AppColors.g1),
                                        ),
                                        //임의로 설정한 스낵바, 추후 변경
                                      ),
                                    );
                                  } else
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: AppColors.s3,
                                        content: Text(
                                          '키워드를 입력해주세요.',
                                          style: FontStyles.Subcopy2.copyWith(
                                              color: AppColors.g1),
                                        ),
                                        //임의로 설정한 스낵바, 추후 변경
                                      ),
                                    );
                                });
                              },
                              iconSize: 40,
                              color: AppColors.g2,
                            ),
                          ),
                        ],
                      ),
                      //태그 보여주는 곳
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: selectedProduct.map((newProduct) {
                          return InputChip(
                            label: Text(
                              newProduct,
                              style: FontStyles.Subcopy6.copyWith(
                                  color: AppColors.g2),
                            ),
                            backgroundColor: AppColors.s1,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: AppColors.s1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            //삭제 버튼
                            onDeleted: () {
                              setState(() {
                                selectedProduct.remove(newProduct);
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                height: 450,
                decoration: BoxDecoration(
                  color: AppColors.s3,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.s3, width: 3),
                ),
              ),


              SizedBox(
                height: 35,
              ),

              CustomTitle(iconData: Icons.person, title: '타겟'),

              SizedBox(height: 22),

              //세번째 컨테이너
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
                            style: FontStyles.Subcopy2.copyWith(
                                color: AppColors.g2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isPressed[0] = !isPressed[0];
                                  selectedGender.add('MALE');
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                isPressed[0] ? AppColors.m3 : AppColors.g6,
                                foregroundColor: AppColors.g2,
                              ),
                              child: Text(
                                '남자',
                                style: FontStyles.Subcopy4.copyWith(
                                    color: AppColors.g2),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isPressed[1] = !isPressed[1];
                                  selectedGender.add('FEMALE');
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                isPressed[1] ? AppColors.m3 : AppColors.g6,
                                foregroundColor: AppColors.g2,
                              ),
                              child: Text(
                                '여자',
                                style: FontStyles.Subcopy4.copyWith(
                                    color: AppColors.g2),
                              ),
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
                            style: FontStyles.Subcopy2.copyWith(
                                color: AppColors.g2),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 3,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isPressed[2] = !isPressed[2];
                                      selectedAge.add('TEN');

                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isPressed[2]
                                        ? AppColors.m3
                                        : AppColors.g6,
                                    foregroundColor: AppColors.g2,
                                  ),
                                  child: Text(
                                    '10대',
                                    style: FontStyles.Subcopy4.copyWith(
                                        color: AppColors.g2),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 3,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isPressed[3] = !isPressed[3];
                                      selectedAge.add('TWENTY');

                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isPressed[3]
                                        ? AppColors.m3
                                        : AppColors.g6,
                                    foregroundColor: AppColors.g2,
                                  ),
                                  child: Text(
                                    '20대',
                                    style: FontStyles.Subcopy4.copyWith(
                                        color: AppColors.g2),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 3,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isPressed[4] = !isPressed[4];
                                      selectedAge.add('THIRTY');

                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isPressed[4]
                                        ? AppColors.m3
                                        : AppColors.g6,
                                    foregroundColor: AppColors.g2,
                                  ),
                                  child: Text(
                                    '30대',
                                    style: FontStyles.Subcopy4.copyWith(
                                        color: AppColors.g2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 3,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isPressed[5] = !isPressed[5];
                                      selectedAge.add('FORTY');
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isPressed[5]
                                        ? AppColors.m3
                                        : AppColors.g6,
                                    foregroundColor: AppColors.g2,
                                  ),
                                  child: Text(
                                    '40대',
                                    style: FontStyles.Subcopy4.copyWith(
                                        color: AppColors.g2),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 3,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isPressed[6] = !isPressed[6];
                                      selectedAge.add('FIFTY');
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isPressed[6]
                                        ? AppColors.m3
                                        : AppColors.g6,
                                    foregroundColor: AppColors.g2,
                                  ),
                                  child: Text(
                                    '50대',
                                    style: FontStyles.Subcopy4.copyWith(
                                        color: AppColors.g2),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 3,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isPressed[7] = !isPressed[7];
                                      selectedAge.add('SIXTY');
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isPressed[7]
                                        ? AppColors.m3
                                        : AppColors.g6,
                                    foregroundColor: AppColors.g2,
                                    padding: EdgeInsets.zero, //글자 짤림 방지
                                  ),
                                  child: Text(
                                    '60대 이상',
                                    style: FontStyles.Subcopy4.copyWith(
                                        color: AppColors.g2),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                              icon: SoulliveIcon.plusIcon(),
                              onPressed: () {
                                //태그 추가 로직 작성
                                setState(() {
                                  String newTarget = targetController.text;
                                  if (newTarget.isNotEmpty) {
                                    selectedTarget.add(newTarget);
                                    print(selectedTarget);
                                    targetController.clear();
                                  }

                                });




                              },
                              iconSize: 40,
                              color: AppColors.g2,
                            ),

                          ),

                        ],
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: selectedTarget.map((newTarget) {
                          return InputChip(
                            label: Text(
                              newTarget,
                              style: FontStyles.Subcopy6.copyWith(
                                  color: AppColors.g2),
                            ),
                            backgroundColor: AppColors.s1,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: AppColors.s1,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            //삭제 버튼
                            onDeleted: () {
                              setState(() {
                                selectedTarget.remove(newTarget);
                              });
                            },
                          );
                        }).toList(),
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

                    final productModel = Data(
                      company: companyController.text,
                      brand: brandNameController.text,
                      brandImages: selectedTags,
                      product: productNameController.text,
                      characteristic: productFeatController.text,
                      productImages: selectedProduct,
                      genders: selectedGender,
                      ages: selectedAge,
                      ranges: selectedTarget,
                    );

                      // ProductModel().data productModel = ProductModel().data(
                      //   company: companyController.text,
                      //   brand: brandNameController.text,
                      //   brandImage: selectedTags,
                      //   product: productNameController.text,
                      //   characteristic: productFeatController.text,
                      //   productImage: selectedProduct,
                      //   gender: selectedGender,
                      //   age: selectedAge,
                      //   range: selectedTarget,
                      // );


                      var postResponse = productapi.postProduct(productModel);
                      print(postResponse);
                      productapi.getProduct();

                    companyController.clear();
                    brandNameController.clear();
                    productNameController.clear();
                    productFeatController.clear();
                    productKeywordController.clear();
                    targetController.clear();

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      //false로 지정해주면 확인 버튼이 아닌 다른 영역을 아무리 클릭을 해도 창이 닫히지 않는다.
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: AppColors.s3,
                          surfaceTintColor: Colors.transparent,
                          actionsAlignment: MainAxisAlignment.center,
                          content: Text(
                            '광고 상품 등록이 완료되었습니다.',
                            textAlign: TextAlign.center,
                            style: FontStyles.Subcopy8.copyWith(
                                color: AppColors.g1),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                '확인',
                                style: FontStyles.Subcopy1.copyWith(
                                    color: AppColors.g1),
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
