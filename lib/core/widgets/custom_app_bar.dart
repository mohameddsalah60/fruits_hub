import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

AppBar buildAppBar(BuildContext context,
    {required String title, void Function()? onTap}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    leading: GestureDetector(
      onTap: onTap,
      child: const Icon(Icons.arrow_back_ios_new),
    ),
  );
}
