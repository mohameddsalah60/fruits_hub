import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

import 'custom_checkbox.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget(
      {super.key, required this.value, required this.onChanged});
  final bool value;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(13, 0),
      child: Row(
        children: [
          CustomCheckbox(
            onChanged: onChanged,
            value: value,
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: 'من خلال إنشاء حساب ، فإنك توافق على  ',
                style: TextStyles.semiBold16.copyWith(
                  color: const Color(0xff949D9E),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'الشروط والأحكام الخاصة بنا',
                    style: TextStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
