import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:soulive/screens/commercial/Productadd.dart';
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
  @override
  Widget build(BuildContext context) {
    timeDilation =2;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Image.asset(
            'assets/images/ic_logo.png',
            width: 24,
            height: 26,
          ),
        ),
        title: Text('SOUL MODEL',
            style: FontStyles.AppTitle1.copyWith(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Hero(
            tag: 'tab',
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    AppColors.m1,
                    Color(0xFFDAC7E1),
                  ],
                ),
              ),
            ),
          ),
          Center(
              child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProductAddScreen()));
            },
            child: Text('광고상품패이지'),
          )),
        ],
      ),
    );
  }
}
