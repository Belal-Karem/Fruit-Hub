import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/repo/prodcts_repo/products_repo.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/features/favorit/domain/repo/favorit_repo.dart';
import 'package:fruit_hub/features/favorit/presentation/manager/cubit/favorit_cubit.dart';

import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
        ),
        BlocProvider(create: (context) => FavoritCubit(getIt<FavoritRepo>())),
      ],
      child: HomeViewBody(),
    );
  }
}
