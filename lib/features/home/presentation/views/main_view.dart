import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruit_hub/features/home/presentation/views/products_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_botton_navigation_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottonNavigationBar(
          onItemTapped: (index) {
            currentViewIndex = index;
            setState(() {});
          },
        ),
        body: SafeArea(child: MainViewBody(currentViewIndex: currentViewIndex)),
      ),
    );
  }
}

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [HomeView(), ProductsView(), CartView()],
    );
  }
}
