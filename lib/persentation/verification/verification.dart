import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:netify/app/di.dart';
import 'package:netify/persentation/common/state_rendrer/state_rendrer_implementor.dart';
import 'package:netify/persentation/resources/assets_manager.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/routes_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';
import 'package:netify/persentation/verification/verification_view_model.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final VerificationViewModel _verificationViewModel =
      instance<VerificationViewModel>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  _bind() {
    _verificationViewModel.start();
    _otpController.addListener(() {
      _verificationViewModel.setOtp(_otpController.text);
    });
    _verificationViewModel.isVerificationSuccessfullStreamController.stream
        .listen((isSuccess) {
      if (isSuccess != null && isSuccess) {
        //navigate to main screen
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context, rootNavigator: true).pop(true);
          // Future.delayed(const Duration(seconds: 1), () {
          //   //                 // Navigator.of(context).push(
          //   //                 // MaterialPageRoute(
          //   //                 // builder: (context) => NextPage(),
          //   //                 // ),
          //   //                 // );
          //   ////Navigator.of(context, rootNavigator: true).pop(true);
          //   Navigator.of(context).popUntil((route) => route.isFirst);
          //   Navigator.pushNamed(context, Routes.homeRoute);
          // });
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.surfaceColor,
      body: _getContentWidget(context),
    );
  }

  // Widget _main(BuildContext context) {
  //   return StreamBuilder<bool?>(
  //       stream:
  //           _verificationViewModel.isVerificationSuccessfullStreamController,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           if (snapshot.data!) {
  //             SchedulerBinding.instance.addPostFrameCallback((_) {
  //               //Navigator.of(context).pop(true);
  //               //Navigator.of(context).popUntil((route) => route.isFirst);
  //               // // Navigator.pushNamed(context, Routes.homeRoute);
  //               Future.delayed(const Duration(seconds: 5), () {
  //                 // Navigator.of(context).push(
  //                 // MaterialPageRoute(
  //                 // builder: (context) => NextPage(),
  //                 // ),
  //                 // );
  //                 Navigator.of(context).pop(true);
  //               });
  //             });
  //             return Container();
  //           }
  //           return _getContentWidget(context);
  //         }
  //         return _getContentWidget(context);
  //       });
  // }

  Widget _getContentWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Image(
                    image: AssetImage(ImageAssets.splashLogo),
                    width: AppSize.s200,
                  ),
                  const SizedBox(
                    height: AppSize.s64,
                  ),
                  Text(
                    AppString.verifyUser,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: AppSize.s64,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                    child: TextFormField(
                      controller: _otpController,
                      decoration: const InputDecoration(
                        hintText: AppString.enterVerificationCode,
                        labelText: AppString.verificationCode,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s48,
                  ),
                  SizedBox(
                    height: AppSize.s100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: AppSize.s130,
                          child: StreamBuilder<bool>(
                              stream:
                                  _verificationViewModel.outputActiveSubmitOtp,
                              builder: (context, snapshot) {
                                return ElevatedButton(
                                    onPressed: (snapshot.data == true)
                                        ? () {
                                            _verificationViewModel.submitOtp();
                                          }
                                        : null,
                                    child: const Text(AppString.submitOtp));
                              }),
                        ),
                        SizedBox(
                          width: AppSize.s130,
                          child: StreamBuilder<RegenerateOtp>(
                              stream:
                                  _verificationViewModel.outputIsRegenerateOtp,
                              builder: (context, snapshot) {
                                return ElevatedButton(
                                    onPressed:
                                        (snapshot.data?.isRegenerateOtpActive ??
                                                    true) ==
                                                true
                                            ? () {
                                                _verificationViewModel
                                                    .regenerateOtp();
                                              }
                                            : null,
                                    child: (snapshot.data
                                                    ?.isRegenerateOtpActive ??
                                                true) ==
                                            true
                                        ? const Text(AppString.regenerateOtp)
                                        : _getDisabledResendOtpWidget(
                                            snapshot));
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }

  Widget _getDisabledResendOtpWidget(AsyncSnapshot<RegenerateOtp> snapshot) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(AppString.regenerateOtp),
        Text((snapshot.data?.countLeft ?? 0) > 0
            ? snapshot.data!.countLeft.toString()
            : "")
      ],
    );
  }

  @override
  void dispose() {
    _verificationViewModel.dispose();
    _otpController.dispose();
    super.dispose();
  }
}
