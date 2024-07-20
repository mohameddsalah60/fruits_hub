import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        value: value,
        onChanged: (val) {
          value = val!;
          setState(() {});
        },
        activeColor: AppColors.primaryColor,
        side: const BorderSide(width: 1.5, color: Color(0xffDDDFDF)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
