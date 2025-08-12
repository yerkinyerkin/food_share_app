import 'package:flutter/material.dart';
import 'package:food_share_app/core/common/custom_button.dart';
import 'package:food_share_app/core/styles/color_styles.dart';
import 'package:food_share_app/features/login/screens/login_screen.dart';
import 'package:food_share_app/features/register/screens/register_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
          flex: 6,
          child: 
            Container(
              color: ColorStyles.startOrangeColor,
              child: Column(
                children: [
                  Image.asset('assets/images/png/send_food.png'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('FoodShareApp',style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: ColorStyles.primaryColor,letterSpacing: -1.5)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
          flex: 4,
          child: 
            Container(
              padding: const EdgeInsets.only(top: 45,right: 39,left: 39,bottom: 24),
              color: ColorStyles.whiteColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text('Спасаем продукты, помогаем друг другу!',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: ColorStyles.orangeColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  CustomButton(text: 'Вход', onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },color: ColorStyles.primaryColor,colorText: ColorStyles.whiteColor),
                  CustomButton(text: 'Регистрация', onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },color: ColorStyles.primaryColor,colorText: ColorStyles.whiteColor),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Политика Конфиденциальности',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: ColorStyles.blackColor,decoration: TextDecoration.underline)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
