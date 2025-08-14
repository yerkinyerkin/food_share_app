import 'package:flutter/material.dart';
import 'package:food_share_app/core/common/custom_button.dart';
import 'package:food_share_app/core/common/custom_textfield.dart';
import 'package:food_share_app/core/styles/color_styles.dart';
import 'package:food_share_app/features/main_screen/screens/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController =  TextEditingController();
  final TextEditingController _passwordController =  TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isHide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35).copyWith(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('FoodShareApp',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: ColorStyles.primaryColor,),),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Спасаем продукты помогая друг другу!',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: ColorStyles.orangeColor,),),
                    ],
                  ),
                  const SizedBox(height: 65),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('E-mail',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ColorStyles.blackColor,),),
                    ],
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    hintText: 'sitcenter@gmail.com',
                    controller: _loginController,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Пароль',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ColorStyles.blackColor,),),
                    ],
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    hintText: '******************',
                    suffix: GestureDetector(
                      onTap: (){
                        setState(() {
                          isHide = !isHide;
                        });
                      },child: isHide == false ? Icon(Icons.visibility_off_outlined,size: 16,) : Icon(Icons.visibility_outlined,size: 16,)),
                    controller: _passwordController,
                    obscureText:  isHide ? false :true,
                  ),
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
              Column(
                children: [
                  CustomButton(text: 'Вход', onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar(index: 0)));
                  },color: ColorStyles.primaryColor,colorText: ColorStyles.whiteColor,),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Нет аккаунта? ',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: ColorStyles.blackColor,)),
                      GestureDetector(onTap: (){},child: Text('Зарегестрироваться',
                        style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: ColorStyles.blackColor,decoration: TextDecoration.underline),),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}