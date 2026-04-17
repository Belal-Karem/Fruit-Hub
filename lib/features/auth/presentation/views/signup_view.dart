import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/build_app_bar_auth.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/manger/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarAuth(context, title: 'إنشاء حساب'),
      body: BlocProvider(
        create: (context) => SignupCubit(getIt<AuthRepo>()),
        child: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
