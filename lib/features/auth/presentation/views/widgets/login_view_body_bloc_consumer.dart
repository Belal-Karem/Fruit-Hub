import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_modal_progress_hud.dart';
import '../../manger/login_cubit/signin_cubit.dart';
import 'login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {}
        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          isLoading: state is SigninLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
