import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.text,
    this.isLoading = false,
  });
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      content: Row(
        children: [
          isLoading
              ? const SizedBox(
                  height: 32,
                  width: 32,
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyles.regular16,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
