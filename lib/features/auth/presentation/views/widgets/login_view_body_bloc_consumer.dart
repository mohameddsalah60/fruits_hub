import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/custom_snack_bar.dart';
import 'package:fruits_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/login_cubits/login_cubit.dart';

import 'login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          customSnackBar(context, text: state.message);
        } else if (state is LoginSuccess) {
          customSnackBar(context, text: state.userEntity.uId);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is LoginLoading ? true : false,
            child: const LoginViewBody());
      },
    );
  }
}
