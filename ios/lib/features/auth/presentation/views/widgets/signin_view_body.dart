import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_password_field.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';

import 'dont_have_an_account_widget.dart';
import 'or_divider.dart';
import 'social_signin_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

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
                CustomPasswordField(
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
                      context
                          .read<SignInCubit>()
                          .signinUserWithEmailAndPassword(
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
                SocialSignInButton(
                  text: 'تسجيل بواسطة جوجل',
                  img: Assets.imagesGoogleIcon,
                  onPressed: () {
                    context.read<SignInCubit>().signinUserWithGoogle();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SocialSignInButton(
                  text: 'تسجيل بواسطة فيسبوك',
                  img: Assets.imagesFacebookIcon,
                  onPressed: () {
                    context.read<SignInCubit>().signinUserWithFacebook();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
