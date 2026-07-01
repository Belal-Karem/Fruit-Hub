import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/repo/ubdate_user_data/ubdate_user_date_repo.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/profile/presentation/manager/update_user_date/update_user_data_cubit.dart';
import 'package:fruit_hub/features/profile/presentation/views/widgets/profile_view_body_bloc_builder.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UpdateUserDataCubit(getIt<UpdateUserDataRepo>()),
        child: ProfileViewBlocBuilder(),
      ),
    );
  }
}
