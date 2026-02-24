import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_preferences%20_singleton.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesCircles, fit: BoxFit.fill),
      ],
    );
  }

  void excuteNaviagtion() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsonBoardingViewSeen) ?? false;
    Future.delayed(Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        Navigator.of(context).pushReplacementNamed(LoginView.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(OnBoardingView.routeName);
      }
    });
  }
}
