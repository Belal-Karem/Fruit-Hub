import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/about/domain/repo/about_repo.dart';
import 'package:fruit_hub/features/about/presentation/manager/cubit/about_cubit.dart';
import 'package:fruit_hub/features/about/presentation/views/widgets/about_view_body_bloc_builder.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  static const routeName = 'about';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutCubit(getIt<AboutRepo>())..getAbout(),
      child: Scaffold(body: AboutViewBodyBlocBuilder()),
    );
  }
}
