import 'package:flutter/material.dart';
import 'package:food_share_app/core/styles/color_styles.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: (){
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back_ios_new_outlined,size: 20,color: ColorStyles.primaryColor)),
                  Text('Мой профиль',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: ColorStyles.primaryColor),),
                  Image.asset('assets/images/png/edit.png',width: 20,height: 20,)
                ],
              ),
              const SizedBox(height: 19),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ColorStyles.whiteColor,
                      border: Border.all(color: ColorStyles.primaryColor,width: 1)
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star,color: Color(0xffFFC107),size: 12),
                  const SizedBox(width: 1),
                  Icon(Icons.star,color: Color(0xffFFC107),size: 12),
                  const SizedBox(width: 1),
                  Icon(Icons.star,color: Color(0xffFFC107),size: 12),
                  const SizedBox(width: 1),
                  Icon(Icons.star,color: Color(0xffFFC107),size: 12),
                  const SizedBox(width: 1),
                  Icon(Icons.star,color: Color(0xffFFC107),size: 12),
                ],
              ),
              const SizedBox(height: 16),
              
            ],
          ),
        ),
      ),
    );
  }
}