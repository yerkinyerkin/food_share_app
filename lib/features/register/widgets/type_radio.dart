import 'package:flutter/material.dart';
import 'package:food_share_app/core/styles/color_styles.dart';

class TypeRadio<T> extends StatelessWidget {
  const TypeRadio({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String label;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min, // <-- не растягиваемся на всю ширину
        children: [
          Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            visualDensity: VisualDensity.compact,            // компактнее
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: ColorStyles.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}