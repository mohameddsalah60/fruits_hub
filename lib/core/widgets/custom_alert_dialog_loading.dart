import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class AlertDialogLoading extends StatelessWidget {
  const AlertDialogLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      content: const Row(
        children: [
          SizedBox(
            height: 32,
            width: 32,
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "جاري التحميل ...",
            style: TextStyles.regular16,
          ),
        ],
      ),
    );
  }
}
