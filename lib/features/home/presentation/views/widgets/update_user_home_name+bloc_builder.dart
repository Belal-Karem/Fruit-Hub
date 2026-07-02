import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/manager/update_ui/update_ui_cubit.dart';

import '../../../../../core/helper_functions/get_user.dart';
import '../../../../../core/utils/theme/app_text_style.dart';

class UpdateNmaeBlocBuilder extends StatelessWidget {
  const UpdateNmaeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUiCubit, UpdateUiState>(
      builder: (context, state) {
        if (state is UpdateUiSuccess) {
          return Text(
            getUserData().name,
            style: AppTextStyle.bold16.copyWith(color: Color(0xFF0C0D0D)),
          );
        }
        return Text(
          getUserData().name,
          style: AppTextStyle.bold16.copyWith(color: Color(0xFF0C0D0D)),
        );
      },
    );
  }
}
