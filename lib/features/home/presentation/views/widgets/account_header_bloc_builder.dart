import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return AccountHeader();
        }
        if (state is UploadImageFailure) {
          showErrorBar(context, state.message);
        }
        return const AccountHeader();
      },
    );
  }
}
