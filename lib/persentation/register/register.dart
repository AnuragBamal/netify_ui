import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/persentation/register/register_view_model.dart';
import 'package:netify/persentation/resources/assets_manager.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _registerViewModel = instance<RegisterViewModel>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _domainNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _aadharNumberController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();

  _bind() {
    _registerViewModel.start();
    _domainNameController.addListener(() {
      _registerViewModel.setDomain(_domainNameController.text);
    });
    _firstNameController.addListener(() {
      _registerViewModel.setFirstName(_firstNameController.text);
    });
    _lastNameController.addListener(() {
      _registerViewModel.setLastName(_lastNameController.text);
    });
    _userNameController.addListener(() {
      _registerViewModel.setUserName(_userNameController.text);
    });
    _emailController.addListener(() {
      _registerViewModel.setEmail(_emailController.text);
    });
    _passwordController.addListener(() {
      _registerViewModel.setPassword(_passwordController.text);
    });
    _confirmPasswordController.addListener(() {
      _registerViewModel.setConfirmPassword(_confirmPasswordController.text);
    });
    _aadharNumberController.addListener(() {
      _registerViewModel.setAadharNumber(_aadharNumberController.text);
    });
    _mobileNumberController.addListener(() {
      _registerViewModel.setMobileNumber(_mobileNumberController.text);
    });
    _cityController.addListener(() {
      _registerViewModel.setCity(_cityController.text);
    });
    _addressController.addListener(() {
      _registerViewModel.setAddress(_addressController.text);
    });
    _companyNameController.addListener(() {
      _registerViewModel.setCompanyName(_companyNameController.text);
    });
    _brandNameController.addListener(() {
      _registerViewModel.setBrandName(_brandNameController.text);
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
        body: _getContentWidget(context));
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
                AppString.registerFormText,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: AppSize.s64,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: DropdownButtonFormField<String>(
                  items: _registerViewModel.tenantTypesList,
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_rounded,
                    color: ColorManager.primaryColor,
                  ),
                  decoration: const InputDecoration(
                    hintText: AppString.registerTenancyTypeHint,
                    labelText: AppString.registerTenancyType,
                  ),
                  onChanged: (String? tenancyType) {
                    _registerViewModel.setTenancyType(tenancyType);
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorDomain,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _domainNameController,
                          decoration: InputDecoration(
                            hintText: AppString.garudaDomainNameHint,
                            labelText: AppString.garudaDomainName,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorFirstName,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            hintText: AppString.registerFirstNameHint,
                            labelText: AppString.registerFirstName,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorLastName,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            hintText: AppString.registerLastNameHint,
                            labelText: AppString.registerLastName,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorUserName,
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorEmail,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: AppString.registerEmailHint,
                            labelText: AppString.registerEmail,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: AppString.registerPasswordHint,
                            labelText: AppString.registerPassword,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorConfirmPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            hintText: AppString.registerConfirmPasswordHint,
                            labelText: AppString.registerConfirmPassword,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorAadharNumber,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _aadharNumberController,
                          decoration: InputDecoration(
                            hintText: AppString.registerAadharNumberHint,
                            labelText: AppString.registerAadharNumber,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p24,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: CountryCodePicker(
                            onChanged: (value) {
                              _registerViewModel
                                  .setCountryCode(value.dialCode ?? '');
                              _registerViewModel.setCountry(value.code ?? '');
                            },
                            initialSelection: "IN",
                            favorite: const ['+91', 'IN'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            hideMainText: true,
                            alignLeft: true,
                          )),
                      Expanded(
                        flex: 3,
                        child: StreamBuilder<String?>(
                            stream: _registerViewModel.outputErrorMobileNumber,
                            builder: (context, snapshot) {
                              return TextFormField(
                                  controller: _mobileNumberController,
                                  decoration: InputDecoration(
                                    hintText:
                                        AppString.registerMobileNumberHint,
                                    labelText: AppString.registerMobileNumber,
                                    errorText: snapshot.data,
                                  ));
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorCity,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _cityController,
                          decoration: InputDecoration(
                            hintText: AppString.registerCityHint,
                            labelText: AppString.registerCity,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorAddress,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            hintText: AppString.registerAddressHint,
                            labelText: AppString.registerAddress,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorCompanyName,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _companyNameController,
                          decoration: InputDecoration(
                            hintText: AppString.registerCompanyNameHint,
                            labelText: AppString.registerCompanyName,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _registerViewModel.outputErrorBrandName,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _brandNameController,
                          decoration: InputDecoration(
                            hintText: AppString.registerBrandNameHint,
                            labelText: AppString.registerBrandName,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: StreamBuilder<bool>(
                  stream: _registerViewModel.allInputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (snapshot.data == true)
                            ? () {
                                _registerViewModel.submitRegister(context);
                              }
                            : null,
                        child: const Text(AppString.registerSignupButton),
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
  void dispose() {
    _registerViewModel.dispose();
    // _userNameController.removeListener(_registerViewModel.setUserName);
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _aadharNumberController.dispose();
    _mobileNumberController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _domainNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _companyNameController.dispose();
    _brandNameController.dispose();

    super.dispose();
  }
}
