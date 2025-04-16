import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/custom_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_password_field.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup_cubits/signup_cubit.dart';

import 'have_an_account_widget.dart';
import 'terms_and_condition_widget.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String userName, email, password;

  bool valueCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: fromKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                CustomTextFromField(
                  hintText: 'الاسم كامل',
                  keyboardType: TextInputType.name,
                  onSaved: (value) {
                    userName = value!;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFromField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  keyboardType: TextInputType.emailAddress,
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
                TermsAndConditionWidget(
                  onChanged: (val) {
                    setState(() {
                      valueCheckBox = val!;
                    });
                  },
                  value: valueCheckBox,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'إنشاء حساب جديد',
                  onPressed: () {
                    if (fromKey.currentState!.validate()) {
                      if (valueCheckBox) {
                        fromKey.currentState!.save();
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                              email,
                              password,
                              userName,
                            );
                      } else {
                        customSnackBar(
                          context,
                          text: 'يجب الموافقه على الشروط والاحكام',
                        );
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 26,
                ),
                const HaveAnAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
