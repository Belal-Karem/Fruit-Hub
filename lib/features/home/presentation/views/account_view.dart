import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/repo/ubdate_user_data/ubdate_user_date_repo.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/home/domain/entites/repo/upload_image_repo.dart';
import 'package:fruit_hub/features/home/presentation/manager/upload_image/upload_image_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/account_view_body.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadImageCubit(
        getIt<UploadImageRepo>(),
        getIt<UbdateUserDataRepo>(),
      ),
      child: Scaffold(body: AccountViewBody()),
    );
  }
}
