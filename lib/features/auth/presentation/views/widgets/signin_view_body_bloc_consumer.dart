import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/custom_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';
import 'package:fruits_hub/features/home/presentation/home_view.dart';

import 'signin_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          customSnackBar(context, text: state.message);
        } else if (state is SignInSuccess) {
          customSnackBar(context, text: 'تم تسجيل الدخول بنجاح.....');
          Future.delayed(const Duration(seconds: 2), () {
            if (context.mounted) {
              Navigator.pushReplacementNamed(
                context,
                HomeView.routeName,
              );
            }
          });
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SignInLoading ? true : false,
            child: const SignInViewBody());
      },
    );
  }
}
