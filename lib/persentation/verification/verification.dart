import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/resources/assets_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';
import 'package:netify/persentation/verification/verification_view_model.dart';

class Verification extends StatefulWidget {
  final LoginUserInfoArgument argument;
  const Verification({
    super.key,
    required this.argument,
  });

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
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getContentWidget(context),
    );
  }

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
                                            _verificationViewModel.submitOtp(
                                                context, widget.argument);
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
                                                    .regenerateOtp(context);
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
