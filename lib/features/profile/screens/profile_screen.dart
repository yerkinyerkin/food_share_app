import 'package:flutter/material.dart';
import 'package:food_share_app/core/styles/color_styles.dart';
import 'package:food_share_app/features/profile/screens/my_profile.dart';
import 'package:food_share_app/features/profile/screens/settings/screens/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37).copyWith(top: 50),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Text('Пользовательские данные',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: ColorStyles.primaryColor,letterSpacing: -0.6),)),
                  ],
              ),
              const SizedBox(height: 11),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Text('Редактируйте данные, настраивайте безопасность и контролируйте свои уведомления',
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ColorStyles.blackColor,letterSpacing: -0.4),)),
                  ],
              ),
              const SizedBox(height: 72),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 37,vertical: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: ColorStyles.primaryColor),
                  child: Row(
                    children: [
                      Icon(Icons.person_2_outlined,size: 20,color: ColorStyles.whiteColor,),
                      const SizedBox(width: 10),
                      Text('Мой профиль',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ColorStyles.whiteColor,),),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
               GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                },
                 child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 37,vertical: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: ColorStyles.primaryColor),
                  child: Row(
                    children: [
                      Icon(Icons.settings_outlined,size: 20,color: ColorStyles.whiteColor,),
                      const SizedBox(width: 10),
                      Text('Настройки приложения',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ColorStyles.whiteColor,),),
                    ],
                  ),
                               ),
               ),
              const SizedBox(height: 16),
               Container(
                padding: const EdgeInsets.symmetric(horizontal: 37,vertical: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: ColorStyles.primaryColor),
                child: Row(
                  children: [
                    Icon(Icons.notifications_outlined,size: 20,color: ColorStyles.whiteColor,),
                    const SizedBox(width: 10),
                    Text('Уведомления',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ColorStyles.whiteColor,),),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   GestureDetector(onTap: (){},child: Text('Обратная связь',
                     style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: ColorStyles.blackColor,decoration: TextDecoration.underline),),
                   ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}