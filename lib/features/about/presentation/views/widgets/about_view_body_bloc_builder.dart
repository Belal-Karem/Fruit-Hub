import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_modal_progress_hud.dart';
import 'package:fruit_hub/features/about/presentation/manager/cubit/about_cubit.dart';
import 'package:fruit_hub/features/about/presentation/views/widgets/about_view_body.dart';
import '../../../../../core/helper_functions/get_dummy.dart';
import '../../../../../core/helper_functions/show_snack_bar.dart';

class AboutViewBodyBlocBuilder extends StatelessWidget {
  const AboutViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit, AboutState>(
      builder: (context, state) {
        if (state is AboutSuccess) {
          return AboutViewBody(about: state.about);
        }
        if (state is AboutFailure) {
          showErrorBar(context, state.message);
        }
        if (state is AboutLoading) {
          return CustomModalProgressHUD(
            isLoading: AboutLoading is AboutLoading ? true : false,
            child: AboutViewBody(about: getDummyAbout()),
          );
        }
        return CustomModalProgressHUD(
          isLoading: AboutLoading is AboutLoading ? true : false,
          child: AboutViewBody(about: getDummyAbout()),
        );
      },
    );
  }
}
