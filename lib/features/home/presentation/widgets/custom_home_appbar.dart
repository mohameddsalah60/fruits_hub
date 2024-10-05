import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(
          color: const Color(0XFF949D9E),
        ),
      ),
      subtitle: const Text(
        'أحمد مصطفي',
        style: TextStyles.bold16,
      ),
      trailing: Container(
        padding: const EdgeInsets.all(12),
        decoration: const ShapeDecoration(
          shape: OvalBorder(),
          color: Color(0xffEEF8ED),
        ),
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
    );
  }
}
