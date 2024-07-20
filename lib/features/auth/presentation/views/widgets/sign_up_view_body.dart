import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';

import 'have_an_account_widget.dart';
import 'terms_and_condition_widget.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFromField(
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFromField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFromField(
                hintText: 'كلمة المرور',
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              SizedBox(
                height: 16,
              ),
              TermsAndConditionWidget(),
              SizedBox(
                height: 30,
              ),
              CustomButton(text: 'إنشاء حساب جديد'),
              SizedBox(
                height: 26,
              ),
              HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
