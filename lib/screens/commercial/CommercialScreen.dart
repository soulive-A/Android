import 'package:flutter/material.dart';

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
      backgroundColor: Color.fromRGBO(239, 239, 239, 100),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              //뒤로가기 동작
            }),
        foregroundColor: Colors.black,
        backgroundColor: Color.fromRGBO(239, 239, 239, 100),
        title: const Text(
          "광고 상품 추가",
          style: TextStyle(fontFamily: 'kristall', fontSize: 16),
        ),
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
                    color: Color.fromRGBO(83, 83, 83, 100),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "기업 정보",
                    style: TextStyle(
                      fontFamily: 'krisall',
                      fontSize: 16,
                      color: Color.fromRGBO(83, 83, 83, 100),
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
                          fontFamily: 'krisall',
                          fontSize: 16,
                          color: Color.fromRGBO(107, 107, 107, 100),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'ex) OO회사, 애플',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      Row(
                        children: [
                          Text(
                            "브랜드명",
                            style: TextStyle(
                              fontFamily: 'krisall',
                              fontSize: 16,
                              color: Color.fromRGBO(107, 107, 107, 100),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              //title: Text("없음"),
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'ex) 아이폰, 아이패드',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      Text(
                        "현재 브랜드 이미지 키워드",
                        style: TextStyle(
                          fontFamily: 'krisall',
                          fontSize: 16,
                          color: Color.fromRGBO(107, 107, 107, 100),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'ex) 고급스러움, 키치함',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
