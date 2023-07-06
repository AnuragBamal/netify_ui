import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/persentation/main/home/user/create_user_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

class CreateUserViewArguments {
  //final HomepageViewModel homepageViewModel;
  final String screenTypeIdentity;
  const CreateUserViewArguments({
    //required this.homepageViewModel,
    required this.screenTypeIdentity,
  });
}

class CreateUserView extends StatefulWidget {
  final CreateUserViewArguments arguments;
  const CreateUserView({
    super.key,
    required this.arguments,
  });

  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  final _userViewModel = instance<UserViewModel>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //final TextEditingController _aadharNumberController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _gstNumberController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  _bind() {
    _userViewModel.start();

    _firstNameController.addListener(() {
      _userViewModel.setFirstName(_firstNameController.text);
    });
    _lastNameController.addListener(() {
      _userViewModel.setLastName(_lastNameController.text);
    });
    _userNameController.addListener(() {
      _userViewModel.setUserName(_userNameController.text);
    });
    _emailController.addListener(() {
      _userViewModel.setEmail(_emailController.text);
    });
    _passwordController.addListener(() {
      _userViewModel.setPassword(_passwordController.text);
    });
    _mobileNumberController.addListener(() {
      _userViewModel.setMobileNumber(_mobileNumberController.text);
    });
    _cityController.addListener(() {
      _userViewModel.setCity(_cityController.text);
    });
    _addressController.addListener(() {
      _userViewModel.setAddress(_addressController.text);
    });
    _companyNameController.addListener(() {
      _userViewModel.setCompanyName(_companyNameController.text);
    });
    _brandNameController.addListener(() {
      _userViewModel.setBrandName(_brandNameController.text);
    });
    _pinCodeController.addListener(() {
      _userViewModel.setPincode(_pinCodeController.text);
    });
    _gstNumberController.addListener(() {
      _userViewModel.setGSTNumber(_gstNumberController.text);
    });
    _stateController.addListener(() {
      _userViewModel.setState(_stateController.text);
    });

    _userViewModel.isUserCreatedSuccessfullyStreamController.stream
        .listen((isSuccessRegistered) {
      if (isSuccessRegistered) {
        //navigate to login screen
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pop();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _bind();
    _userViewModel.intiallizeData(widget.arguments.screenTypeIdentity);
    _userViewModel.start();
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
              Text(
                widget.arguments.screenTypeIdentity ==
                        ScreenTypeIdentity.reseller
                    ? AppString.createResellerScreenTitle
                    : AppString.createOperatorScreenTitle,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: AppSize.s32,
              ),
              dropDownUserType(context),
              const SizedBox(
                height: AppSize.s24,
              ),
              dropDownOwnerType(context),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _userViewModel.outputErrorFirstName,
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
                    stream: _userViewModel.outputErrorLastName,
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
                    stream: _userViewModel.outputErrorUserName,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                            hintText: AppString.registerUsernameHint,
                            labelText: AppString.registerUsername,
                            errorText: snapshot.data,
                            suffixText:
                                "@${_userViewModel.domainNameStreamController.value}",
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
                    stream: _userViewModel.outputErrorEmail,
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
                    stream: _userViewModel.outputErrorPassword,
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
                              _userViewModel
                                  .setCountryCode(value.dialCode ?? '');
                              _userViewModel.setCountry(value.code ?? '');
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
                            stream: _userViewModel.outputErrorMobileNumber,
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
                    stream: _userViewModel.outputErrorGSTNumber,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _gstNumberController,
                          decoration: InputDecoration(
                            hintText: AppString.registerGSTNumberHint,
                            labelText: AppString.registerGSTNumber,
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
                    stream: _userViewModel.outputErrorCompanyName,
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
                    stream: _userViewModel.outputErrorBrandName,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _userViewModel.outputErrorAddress,
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
                    stream: _userViewModel.outputErrorPincode,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _pinCodeController,
                          decoration: InputDecoration(
                            hintText: AppString.registerPinCodeHint,
                            labelText: AppString.registerPinCode,
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
                    stream: _userViewModel.outputErrorCity,
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
                    stream: _userViewModel.outputErrorAddressState,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _stateController,
                          decoration: InputDecoration(
                            hintText: AppString.registerStateHint,
                            labelText: AppString.registerState,
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
                  stream: _userViewModel.allInputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (snapshot.data == true)
                            ? () {
                                _userViewModel.createNewUserSubmit(context);
                              }
                            : null,
                        child: const Text(AppString.createUserSubmitButton),
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

  Widget dropDownUserType(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: StreamBuilder<List<String>?>(
            stream: _userViewModel.userType,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: AppString.createUserSelectUserTypeHint,
                    labelText: AppString.createUserSelectUserType,
                  ),
                  // value: _userViewModel.owner,
                  onChanged: (String? newValue) {
                    if (newValue != null && newValue != "Please Select") {
                      _userViewModel.setUserType(newValue);
                    }
                  },
                  items: snapshot.data!
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                );
              } else {
                return const SizedBox();
              }
            }));
  }

  Widget dropDownOwnerType(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: StreamBuilder<List<String>?>(
            stream: _userViewModel.ownerList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: AppString.createUserSelectOwnerTypeHint,
                    labelText: AppString.createUserSelectOwnerType,
                  ),
                  // value: _userViewModel.owner,
                  onChanged: (String? newValue) {
                    if (newValue != null && newValue != "Please Select") {
                      _userViewModel.setOwneruser(newValue);
                    }
                  },
                  items: snapshot.data!
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                );
              } else {
                return const SizedBox();
              }
            }));
  }

  @override
  void dispose() {
    _userViewModel.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    // _aadharNumberController.dispose();
    _mobileNumberController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _companyNameController.dispose();
    _brandNameController.dispose();
    _pinCodeController.dispose();
    _gstNumberController.dispose();
    _stateController.dispose();

    unregisterCreateUserModule();
    super.dispose();
  }
}
