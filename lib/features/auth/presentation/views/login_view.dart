import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/build_app_bar_auth.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';

import '../../../../core/services/get_it_service.dart';
import '../../domain/repos/auth_repo.dart';
import '../manger/login_cubit/signin_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarAuth(context, title: 'تسجيل دخول'),
      body: BlocProvider(
        create: (context) => SigninCubit(getIt<AuthRepo>()),
        child: SafeArea(child: LoginViewBodyBlocConsumer()),
      ),
    );
  }
}
