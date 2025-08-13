import 'package:flutter/material.dart';
import 'package:food_share_app/core/styles/color_styles.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
   final _name   = TextEditingController(text: 'Иванова Иванова');
  final _gender = TextEditingController(text: 'Женский');
  final _age    = TextEditingController(text: '20 лет');
  final _email  = TextEditingController(text: 'ivanova@mail.ru');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _gender.dispose();
    _age.dispose();
    _email.dispose();
    super.dispose();
  }

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
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children:  [
                  LabeledUnderlineField(label: 'Имя',     controller: _name,   readOnly: true),
                  LabeledUnderlineField(label: 'Пол',     controller: _gender, readOnly: true),
                  LabeledUnderlineField(label: 'Возраст', controller: _age,    readOnly: true),
                  LabeledUnderlineField(label: 'E-mail',  controller: _email,  readOnly: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

const _dividerColor = Color(0xFFDB7F00); // orange

class LabeledUnderlineField extends StatelessWidget {
  const LabeledUnderlineField({
    super.key,
    required this.label,
    this.controller,
    this.hintText,
    this.readOnly = false,
    this.keyboardType,
    this.onTap,
  });

  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final bool readOnly;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                label,
                style: const TextStyle(
                  color: ColorStyles.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextFormField(
                controller: controller,
                readOnly: readOnly,
                onTap: onTap,
                keyboardType: keyboardType,
                style: const TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  hintText: hintText,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,         // no default border
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(height: 2, color: _dividerColor), // orange line
        ],
      ),
    );
  }
}
