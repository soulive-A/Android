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
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
        onPressed: (){
            //뒤로가기 동작
             }
        ),
        foregroundColor: Colors.black,
        backgroundColor: Color.fromRGBO(239, 239, 239, 100),
        title: const Text(
            "광고 상품 추가",
            style: TextStyle(
                fontFamily: 'kristall',
                fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('광고분석입니다'),
      ),
    );
  }

}