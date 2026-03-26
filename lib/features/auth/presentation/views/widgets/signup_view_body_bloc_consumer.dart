import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_modal_progress_hud.dart';
import '../../manger/signup_cubit/signup_cubit.dart';
import 'signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pop(context);
        }
        if (state is SignupFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          isLoading: state is SignupLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
