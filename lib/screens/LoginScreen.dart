import 'package:flutter/material.dart';
import 'package:soulive/design/ColorStyles.dart';
import 'package:soulive/design/FontStyles.dart';
import 'package:soulive/design/component/CustomElevatedButton.dart';
import 'package:soulive/screens/screen_index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //휴대폰 번호
  TextEditingController phoneNumberController = TextEditingController();

  //패스워드
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.s3,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Image.asset(
                  'assets/images/logo_puple.png',
                  width: 49,
                  height: 55,
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Text(
                  '객관적 모델 검증 서비스를',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'pretendard',
                      color: AppColors.g2),
                ),
                Text(
                  '지금 바로 만나보세요!',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'pretendard',
                      color: AppColors.g2),
                ),
                SizedBox(
                  height: screenHeight * 0.07,
                ),

                //휴대폰 번호
                TextFormField(
                  //enabled: _isEnabled,
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.g4,
                        ),
                      ),
                      labelText: '휴대폰 번호를 입력하세요',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'pretendard',
                        color: AppColors.g4,
                      )),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                //패스워드
                TextFormField(
                  //enabled: _isEnabled,
                  controller: passwordController,
                  obscureText: true, //비번 점 모양으로 가려줌
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.g4,
                        ),
                      ),
                      labelText: '비밀번호를 입력하세요',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'pretendard',
                        color: AppColors.g4,
                      )),
                ),

                SizedBox(
                  height: screenHeight * 0.01,
                ),
                CustomElevatedButton(
                    backgroundColor: AppColors.m1,
                    borderColor: AppColors.m1,
                    textColor: AppColors.s3,
                    title: '로그인하기',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScreenIndex(index: 0)));
                    }),
                SizedBox(
                  height: screenHeight * 0.2,
                ),
                Text(
                  '또는',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'pretendard',
                    color: AppColors.g2,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                CustomElevatedButton(
                    backgroundColor: AppColors.s3,
                    borderColor: AppColors.m1,
                    textColor: AppColors.g2,
                    title: '가입하기',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScreenIndex(index: 0)));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
