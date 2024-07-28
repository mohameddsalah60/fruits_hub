import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/login_cubits/login_cubit.dart';

import 'dont_have_an_account_widget.dart';
import 'or_divider.dart';
import 'social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: fromKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                CustomTextFromField(
                  hintText: 'البريد الإلكتروني',
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFromField(
                  hintText: 'كلمة المرور',
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (isVisible) {
                          setState(() {
                            isVisible = false;
                          });
                        } else {
                          setState(() {
                            isVisible = true;
                          });
                        }
                      },
                      icon: const Icon(Icons.remove_red_eye)),
                  obscureText: isVisible,
                  onSaved: (value) {
                    password = value!;
                  },
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
                CustomButton(
                  text: 'تسجيل دخول',
                  onPressed: () {
                    if (fromKey.currentState!.validate()) {
                      fromKey.currentState!.save();
                      context.read<LoginCubit>().loginUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
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
      ),
    );
  }
}
