import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';

import 'dont_have_an_account_widget.dart';
import 'or_divider.dart';
import 'social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const CustomTextFromField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFromField(
                hintText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: Icon(Icons.remove_red_eye),
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightprimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const CustomButton(
                text: 'تسجيل دخول',
              ),
              const SizedBox(
                height: 32,
              ),
              const DonthHaveAnAccountWidget(),
              const SizedBox(
                height: 32,
              ),
              const OrDivider(),
              const SizedBox(
                height: 16,
              ),
              const SocialLoginButton(
                text: 'تسجيل بواسطة جوجل',
                img: Assets.imagesGoogleIcon,
              ),
              const SizedBox(
                height: 16,
              ),
              const SocialLoginButton(
                text: 'تسجيل بواسطة أبل',
                img: Assets.imagesAppleIcon,
              ),
              const SizedBox(
                height: 16,
              ),
              const SocialLoginButton(
                text: 'تسجيل بواسطة فيسبوك',
                img: Assets.imagesFacebookIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
