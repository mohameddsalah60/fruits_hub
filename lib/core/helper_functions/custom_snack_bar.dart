import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

customSnackBar(context, {required String text, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red.shade400,
      content: Text(
        text,
        style: TextStyles.regular16,
      ),
    ),
  );
}
