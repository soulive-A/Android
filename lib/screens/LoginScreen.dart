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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.s3,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
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
                height: 30,
              ),

              //패스워드
              TextFormField(
                //enabled: _isEnabled,
                //controller: passwordEditingController,
                obscureText: true, //비번 점 모양으로 가려줌
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.g5,
                      ),
                    ),
                    labelText: '비밀번호를 입력하세요',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'pretendard',
                      color: AppColors.g4,
                    )),
                // validator: (value) {
                //   if (value == null || value.trim().isEmpty || !isEmail(value.trim())){
                //     return '패스워드를 입력해주세요.';
                //   }
                //   if (value.length < 6) {
                //     return '패스워드는 6글자 이상 입력해주세요.'; //firebase 사용시 6글자 이상 입력하도록 강제하고 있음 -> 전처리 과정
                //   }
                //   return null;
                // },
              ),

              CustomElevatedButton(
                  backgroundColor: AppColors.m1,
                  borderColor: AppColors.m1,
                  textColor: AppColors.s3,
                  title: '로그인하기',
                  onPressed: () {
                    print('테스트');
                  }),

              Text(
                '또는',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'pretendard',
                  color: AppColors.g2,
                ),
              ),
              CustomElevatedButton(
                  backgroundColor: AppColors.s3,
                  borderColor: AppColors.m1,
                  textColor: AppColors.g2,
                  title: '가입하기',
                  onPressed: () {
                    print('테스트');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
