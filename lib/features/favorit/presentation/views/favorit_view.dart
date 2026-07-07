import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/favorit/domain/repo/favorit_repo.dart';
import 'package:fruit_hub/features/favorit/presentation/manager/cubit/favorit_cubit.dart';
import 'package:fruit_hub/features/favorit/presentation/views/widgets/favorit_view_body.dart';

class FavoritView extends StatelessWidget {
  const FavoritView({super.key});

  static const routeName = 'favoritView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FavoritCubit(getIt<FavoritRepo>())..getFavorit(),
        child: const FavoritViewBody(),
      ),
    );
  }
}
