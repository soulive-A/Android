import 'package:flutter/material.dart';

class CommercialScreen extends StatefulWidget {
  const CommercialScreen({super.key});

  @override
  State<CommercialScreen> createState() => _CommercialScreen();
}

class _CommercialScreen extends State<CommercialScreen> {
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
              Text(
                  "기업 정보",
                  style: TextStyle(
                    fontFamily: 'krisall',
                    fontSize: 16,
                    color: Color.fromRGBO(83, 83, 83, 100),
                  ),
                ),
              const SizedBox(height: 22),

              Center(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 3),
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
