import 'package:flutter/material.dart';
import 'package:food_share_app/core/common/custom_button.dart';
import 'package:food_share_app/core/common/custom_textfield.dart';
import 'package:food_share_app/core/styles/color_styles.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isHide = false;
  bool isSecondHide = false;
   bool isRepeatHide = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(onTap: (){
                         Navigator.pop(context);
                      },child: Icon(Icons.arrow_back_ios_new_outlined,size: 20,color: ColorStyles.primaryColor)),
                      Text('Сменить пароль',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: ColorStyles.primaryColor),),
                      SizedBox(),
                  ],
              ),
              const SizedBox(height: 29),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Текущий пароль:',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: ColorStyles.blackColor),),
                ],
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Новый пароль:',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: ColorStyles.blackColor),),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: '******************',
                suffix: GestureDetector(
                  onTap: (){
                    setState(() {
                       isSecondHide = !isSecondHide;
                    });
                   },child: isSecondHide == false ? Icon(Icons.visibility_off_outlined,size: 16,) : Icon(Icons.visibility_outlined,size: 16,)),
                 controller: _newPasswordController,
                 obscureText:  isSecondHide ? false :true,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Минимум 8 символов, включая цифру и заглавную букву',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Color(0xff828282)),),
                ],
              ),
              const SizedBox(height: 14),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Повторите новый пароль:',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: ColorStyles.blackColor),),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: '******************',
                suffix: GestureDetector(
                  onTap: (){
                    setState(() {
                       isRepeatHide = !isRepeatHide;
                    });
                   },child: isRepeatHide == false ? Icon(Icons.visibility_off_outlined,size: 16,) : Icon(Icons.visibility_outlined,size: 16,)),
                 controller: _repeatNewPasswordController,
                 obscureText:  isRepeatHide ? false :true,
              ),
                ],
              ),
              CustomButton(text: 'Сохранить', onTap: (){},color: ColorStyles.primaryColor,colorText: ColorStyles.whiteColor,)
            ],
          ),
        ),
      ),
    );
  }
}