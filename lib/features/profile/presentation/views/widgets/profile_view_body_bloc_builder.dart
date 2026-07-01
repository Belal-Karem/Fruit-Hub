import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/show_snack_bar.dart';
import 'package:fruit_hub/core/widgets/custom_modal_progress_hud.dart';
import 'package:fruit_hub/features/profile/presentation/manager/update_user_date/update_user_data_cubit.dart';

import 'profile_view_body.dart';

class ProfileViewBlocBuilder extends StatelessWidget {
  const ProfileViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserDataCubit, UpdateUserDataCubitState>(
      listener: (context, state) {
        if (state is UpdateUserDataCubitFailure) {
          showErrorBar(context, state.message);
        }
        if (state is UpdateUserDataCubitSuccess) {
          showErrorBar(context, 'تم تعديل البيانات بنجاح');
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          isLoading: state is UpdateUserDataCubitLoading ? true : false,
          child: ProfileViewBody(),
        );
      },
    );
  }
}
