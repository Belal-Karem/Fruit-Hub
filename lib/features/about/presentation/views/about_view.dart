import 'package:flutter/material.dart';
import 'package:fruit_hub/features/about/presentation/views/widgets/about_view_body.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  static const routeName = 'about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AboutViewBody());
  }
}
