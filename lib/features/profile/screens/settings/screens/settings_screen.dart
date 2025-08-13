import 'package:flutter/material.dart';
import 'package:food_share_app/core/common/custom_button.dart';
import 'package:food_share_app/core/styles/color_styles.dart';
import 'package:food_share_app/features/profile/screens/change_password/screens/change_password.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
   bool dark = true;
  String lang = 'Русский';
  String tz = 'Алматы';
  int tab = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(onTap: (){
                       Navigator.pop(context);
                    },child: Icon(Icons.arrow_back_ios_new_outlined,size: 20,color: ColorStyles.primaryColor)),
                    Text('Настройки приложения',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: ColorStyles.primaryColor),),
                    SizedBox(),
                ],
              ),
              const SizedBox(height: 29),
              const SettingLabel('Язык приложения:',),
              PillTile(
                icon: 'assets/images/png/language_icon.png',
                text: lang,
                trailing: const Icon(Icons.expand_more, size: 20),
                onTap: () {},
              ),
              const SizedBox(height: 18),

              const SettingLabel('Тема приложения:'),
              PillTile(
                icon: 'assets/images/png/theme_icon.png',
                text: 'Темная тема',
                trailing: SizedBox(
                  height: 10,
                  child: Switch(
                    value: dark,
                    activeColor: Colors.white,
                    activeTrackColor: ColorStyles.primaryColor,
                    onChanged: (v) => setState(() => dark = v),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              const SettingLabel('Часовой пояс:'),
              PillTile(
                icon: 'assets/images/png/clock_icon.png',
                text: tz,
                trailing: const Icon(Icons.expand_more, size: 22),
                onTap: () {},
              ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    CustomButton(text: 'Сменить пароль', onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()));
                    },color: ColorStyles.primaryColor,colorText: ColorStyles.whiteColor,),
                    CustomButton(text: 'Выйти', onTap: (){},color: ColorStyles.primaryColor,colorText: ColorStyles.whiteColor,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingLabel extends StatelessWidget {
  const SettingLabel(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          color: ColorStyles.blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }
}

class PillTile extends StatelessWidget {
  const PillTile({
    super.key,
    required this.icon,
    required this.text,
    this.trailing,
    this.onTap,
  });

  final String icon;
  final String text;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 9),
        decoration: BoxDecoration(
          color: ColorStyles.greyColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Image.asset(icon,width: 18,height: 18,),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 12, color: ColorStyles.blackColor,fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
