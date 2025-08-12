import 'package:flutter/material.dart';
import 'package:food_share_app/core/styles/color_styles.dart';

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
              
            ],
          ),
        ),
      ),
    );
  }
}