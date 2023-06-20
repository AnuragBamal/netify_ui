import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/persentation/resources/assets_manager.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';
import 'package:netify/persentation/splash/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel _splashViewModel = instance<SplashViewModel>();

  @override
  void initState() {
    super.initState();
    _splashViewModel.start();
  }

  @override
  void dispose() {
    _splashViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.surfaceColor,
      body: Center(
          child: Image(
        image: AssetImage(ImageAssets.splashLogo),
        width: AppSize.s200,
      )),
    );
  }
}
