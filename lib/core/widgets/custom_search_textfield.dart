import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/app_text_styles.dart';

class CustomSearchTextfield extends StatelessWidget {
  const CustomSearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: SizedBox(
          width: 20,
          child: Center(
            child: SvgPicture.asset(Assets.imagesFilterSearchImg),
          ),
        ),
        prefixIcon: SizedBox(
          width: 20,
          child: Center(
            child: SvgPicture.asset(Assets.imagesSearchImg),
          ),
        ),
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        hintText: 'ابحث عن..........',
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xff949D9E),
        ),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
      style: TextStyles.semiBold16.copyWith(
        color: const Color(0xff000000),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xffE6E9E9),
      ),
      borderRadius: BorderRadius.circular(4),
    );
  }
}
