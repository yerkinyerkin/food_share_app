import 'package:flutter/material.dart';
import 'package:food_share_app/core/common/custom_button.dart';
import 'package:food_share_app/core/common/custom_textfield.dart';
import 'package:food_share_app/core/styles/color_styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController =  TextEditingController();
  final TextEditingController _emailController =  TextEditingController();
  final TextEditingController _passwordController =  TextEditingController();
  final TextEditingController _newPasswordController =  TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  bool isHide = false;
  bool isNewHide = false;
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
                      Text('Добро пожаловать!',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: ColorStyles.primaryColor,),),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Text('Зарегестрируйтесь в FoodShareApp, чтобы достигунть цели с правильным питанием ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: ColorStyles.orangeColor,),)),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Имя',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ColorStyles.blackColor,),),
                    ],
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    hintText: 'Татьяна',
                    controller: _nameController,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('E-mail',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ColorStyles.blackColor,),),
                    ],
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    hintText: 'sitcenter@gmail.com',
                    suffix: GestureDetector(
                      onTap: (){
                        setState(() {
                          isHide = !isHide;
                        });
                      },child: isHide == false ? Icon(Icons.visibility_off_outlined,size: 16,) : Icon(Icons.visibility_outlined,size: 16,)),
                    controller: _passwordController,
                    obscureText:  isHide ? false :true,
                  ),
                  const SizedBox(height: 19),
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
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: '******************',
                    suffix: GestureDetector(
                      onTap: (){
                        setState(() {
                          isNewHide = !isNewHide;
                        });
                      },child: isNewHide == false ? Icon(Icons.visibility_off_outlined,size: 16,) : Icon(Icons.visibility_outlined,size: 16,)),
                    controller: _newPasswordController,
                    obscureText:  isNewHide ? false :true,
                  ),
                  
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Войти через:',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ColorStyles.blackColor,),),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: ColorStyles.greyColor,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/png/apple_logo.png',width: 35,height: 35,),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text('Apple',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ColorStyles.blackColor),),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: ColorStyles.greyColor,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/png/google_logo.png',width: 35,height: 35,),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text('Google',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ColorStyles.blackColor),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomButton(text: 'Зарегестрироваться', onTap: (){},color: ColorStyles.primaryColor,colorText: ColorStyles.whiteColor,),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Есть аккаунт? ',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: ColorStyles.blackColor,)),
                      GestureDetector(onTap: (){},child: Text('Войти',
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