import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/manager/update_ui/update_ui_cubit.dart';

import '../../../../../core/helper_functions/show_snack_bar.dart';
import '../../manager/upload_image/upload_image_cubit.dart';
import 'account_header.dart';

class AccountHeaderBlocBuilder extends StatelessWidget {
  const AccountHeaderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        if (state is UploadImageSuccess) {
          return UpdateUiBlocBuilder();
        }
        if (state is UploadImageFailure) {
          showErrorBar(context, state.message);
        }
        return const UpdateUiBlocBuilder();
      },
    );
  }
}

class UpdateUiBlocBuilder extends StatelessWidget {
  const UpdateUiBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUiCubit, UpdateUiState>(
      builder: (context, state) {
        if (state is UpdateUiSuccess) {
          return AccountHeader();
        }
        return const AccountHeader();
      },
    );
  }
}
