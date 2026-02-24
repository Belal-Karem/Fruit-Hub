import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _plantSize;
  late Animation<double> _circleHeight;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeIn),
      ),
    );

    _plantSize = Tween<double>(
      begin: 80,
      end: 140,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _circleHeight = Tween<double>(
      begin: 100,
      end: 200,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    // excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: _plantSize.value,
                height: _plantSize.value,
                child: SvgPicture.asset(Assets.imagesPlant),
              ),
            ),

            Opacity(
              opacity: _opacity.value,
              child: SvgPicture.asset(Assets.imagesLogo),
            ),

            SizedBox(
              height: _circleHeight.value,
              child: SvgPicture.asset(Assets.imagesCircles, fit: BoxFit.fill),
            ),
          ],
        );
      },
    );
  }

  void excuteNaviagtion() {
    Future.delayed(Duration(microseconds: 500), () {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}
