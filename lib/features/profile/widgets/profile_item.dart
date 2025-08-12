import 'package:flutter/material.dart';

class ProfileItem extends StatefulWidget {
  const ProfileItem({super.key});

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // Image.asset(name)
        ],
      ),
    );
  }
}