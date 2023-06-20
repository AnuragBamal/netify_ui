import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/persentation/forgot_password/forgot_password_view_model.dart';
import 'package:netify/persentation/resources/assets_manager.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordViewModel _viewModel =
      instance<ForgotPasswordViewModel>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _newPassCodeController = TextEditingController();
  final TextEditingController _confirmPassCodeController =
      TextEditingController();

  _bind() {
    _viewModel.start();
    _userNameController.addListener(() {
      _viewModel.setUserName(_userNameController.text);
    });
    _otpController.addListener(() {
      _viewModel.setOtp(_otpController.text);
    });
    _newPassCodeController.addListener(() {
      _viewModel.setNewPasscode(_newPassCodeController.text);
    });
    _confirmPassCodeController.addListener(() {
      _viewModel.setConfirmNewPasscode(_confirmPassCodeController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.surfaceColor,
      body: _getContentWidget(context),
    );
  }

  Widget _getContentWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p64),
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
                AppString.forgotPasswordScreenHeader,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: AppSize.s64,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _viewModel.outputErrorUserName,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                            hintText: AppString.registerUsernameHint,
                            labelText: AppString.registerUsername,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              StreamBuilder(
                stream: _viewModel.outputIsOtpSent,
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p24,
                      ),
                      child:
                          StreamBuilder<String?>(builder: (context, snapshot) {
                        return TextFormField(
                            controller: _otpController,
                            decoration: InputDecoration(
                              hintText: AppString.forgotPasswordOtp,
                              labelText: AppString.forgotPasswordOtp,
                              errorText: snapshot.data,
                            ));
                      }),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              StreamBuilder(
                stream: _viewModel.outputIsOtpSent,
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p24,
                      ),
                      child: StreamBuilder<String?>(
                          stream: _viewModel.outputErrorNewPasscode,
                          builder: (context, snapshot) {
                            return TextFormField(
                                controller: _newPassCodeController,
                                decoration: InputDecoration(
                                  hintText: AppString
                                      .forgotPasswordScreenPasswordHint,
                                  labelText:
                                      AppString.forgotPasswordScreenPassword,
                                  errorText: snapshot.data,
                                ));
                          }),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              StreamBuilder(
                stream: _viewModel.outputIsOtpSent,
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p24,
                      ),
                      child: StreamBuilder<String?>(
                          stream: _viewModel.outputErrorConfirmPasscode,
                          builder: (context, snapshot) {
                            return TextFormField(
                                controller: _confirmPassCodeController,
                                decoration: InputDecoration(
                                  hintText:
                                      AppString.registerConfirmPasswordHint,
                                  labelText: AppString.registerConfirmPassword,
                                  errorText: snapshot.data,
                                ));
                          }),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: StreamBuilder<bool>(
                  stream: _viewModel.outputIsAllInputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (snapshot.data == true)
                            ? () {
                                _viewModel.submitForgotPassword(context);
                              }
                            : null,
                        child: const Text(AppString.forgotPasswordSubmit),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _otpController.dispose();
    _newPassCodeController.dispose();
    _confirmPassCodeController.dispose();
    _viewModel.dispose();
    super.dispose();
  }
}
