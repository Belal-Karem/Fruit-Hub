import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_botton_navigation_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const routeName = 'main_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottonNavigationBar(),
      body: SafeArea(child: HomeView()),
    );
  }
}
