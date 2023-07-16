import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/persentation/main/home/subscriber/subscriber_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

class CreateSubscriber extends StatefulWidget {
  const CreateSubscriber({super.key});

  @override
  State<CreateSubscriber> createState() => _CreateSubscriberState();
}

class _CreateSubscriberState extends State<CreateSubscriber> {
  final _subscriberViewModel = instance<SubscriberViewModel>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<dynamic>> _dropdownKey =
      GlobalKey<FormFieldState<dynamic>>();
  bool isBillingSameController = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //final TextEditingController _aadharNumberController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();
  final TextEditingController _gstNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _billingAddressController =
      TextEditingController();
  final TextEditingController _billingCityController = TextEditingController();
  final TextEditingController _billingStateController = TextEditingController();
  final TextEditingController _billingPinCodeController =
      TextEditingController();
  final TextEditingController _billingCountryController =
      TextEditingController();

  _bind() {
    _subscriberViewModel.start();

    _firstNameController.addListener(() {
      _subscriberViewModel.setFirstName(_firstNameController.text);
    });
    _lastNameController.addListener(() {
      _subscriberViewModel.setLastName(_lastNameController.text);
    });
    _userNameController.addListener(() {
      _subscriberViewModel.setUserName(_userNameController.text);
    });
    _emailController.addListener(() {
      _subscriberViewModel.setEmail(_emailController.text);
    });
    _passwordController.addListener(() {
      _subscriberViewModel.setPassword(_passwordController.text);
    });
    _mobileNumberController.addListener(() {
      _subscriberViewModel.setMobileNumber(_mobileNumberController.text);
    });
    _cityController.addListener(() {
      _subscriberViewModel.setCity(_cityController.text);
    });
    _addressController.addListener(() {
      _subscriberViewModel.setAddress(_addressController.text);
    });
    _countryController.addListener(() {
      _subscriberViewModel.setCountry(_countryController.text);
    });
    _companyNameController.addListener(() {
      _subscriberViewModel.setCompanyName(_companyNameController.text);
    });
    _brandNameController.addListener(() {
      _subscriberViewModel.setBrandName(_brandNameController.text);
    });
    _pinCodeController.addListener(() {
      _subscriberViewModel.setPinCode(_pinCodeController.text);
    });
    _gstNumberController.addListener(() {
      _subscriberViewModel.setGstNumber(_gstNumberController.text);
    });
    _stateController.addListener(() {
      _subscriberViewModel.setState(_stateController.text);
    });
    _billingAddressController.addListener(() {
      _subscriberViewModel.setBillingAddress(_billingAddressController.text);
    });
    _billingCityController.addListener(() {
      _subscriberViewModel.setBillingCity(_billingCityController.text);
    });
    _billingStateController.addListener(() {
      _subscriberViewModel.setBillingState(_billingStateController.text);
    });
    _billingPinCodeController.addListener(() {
      _subscriberViewModel.setBillingPinCode(_billingPinCodeController.text);
    });
    _billingCountryController.addListener(() {
      _subscriberViewModel.setBillingCountry(_billingCountryController.text);
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

  Widget _getContentWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p64),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  AppString.createNewSubscriber,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(
                height: AppSize.s32,
              ),
              dropDownResellerList(context),
              const SizedBox(
                height: AppSize.s24,
              ),
              StreamBuilder<List<String>?>(
                  stream: _subscriberViewModel.outputOperatorList,
                  builder: dropDownOperatorList),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _subscriberViewModel.outputFirstName,
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
                    stream: _subscriberViewModel.outputLastName,
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
                    stream: _subscriberViewModel.outputUserName,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                            hintText: AppString.registerUsernameHint,
                            labelText: AppString.registerUsername,
                            errorText: snapshot.data,
                            suffixText:
                                "@${_subscriberViewModel.domainNameStreamController.value}",
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
                    stream: _subscriberViewModel.outputEmail,
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
                    stream: _subscriberViewModel.outputPassword,
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
                              _subscriberViewModel
                                  .setCountryCode(value.dialCode ?? '');
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
                            stream: _subscriberViewModel.outputMobileNumber,
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
                    stream: _subscriberViewModel.outputGstNumber,
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
                    stream: _subscriberViewModel.outputCompanyName,
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
                    stream: _subscriberViewModel.outputBrandName,
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
                    stream: _subscriberViewModel.outputAddress,
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
                    stream: _subscriberViewModel.outputPinCode,
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
                    stream: _subscriberViewModel.outputCity,
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
                    stream: _subscriberViewModel.outputState,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _subscriberViewModel.outputCountry,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _countryController,
                          decoration: InputDecoration(
                            hintText: AppString.registerCountryHint,
                            labelText: AppString.registerCountry,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p24,
                    ),
                    child: Text(
                      AppString.isBillingAddSame,
                      style: TextStyle(
                          fontSize: AppSize.s14,
                          color: ColorManager.primaryColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p8,
                    ),
                    child: Checkbox(
                        activeColor: ColorManager.primaryColor,
                        value: isBillingSameController,
                        onChanged: (bool? value) {
                          _subscriberViewModel.setIsBillingSame(value!);
                          setState(() {
                            isBillingSameController = value;
                          });
                          if (!value) {
                            _billingAddressController.clear();
                            _billingPinCodeController.clear();
                            _billingCityController.clear();
                            _billingStateController.clear();
                            _billingCountryController.clear();
                          }
                        }),
                  ),
                ],
              ),
              StreamBuilder(
                  stream: _subscriberViewModel.isBillingSameController,
                  builder: billingAddressBuilder),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: StreamBuilder<bool>(
                  stream: _subscriberViewModel.isAllInputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (snapshot.data == true)
                            ? () {
                                _subscriberViewModel
                                    .createNewSubscriberSubmit(context);
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

  Widget dropDownResellerList(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: StreamBuilder<List<String>?>(
            stream: _subscriberViewModel.outputResellerList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: AppString.createNewPlanSelectResellerHint,
                    labelText: AppString.createNewPlanSelectReseller,
                  ),
                  // value: _userViewModel.owner,
                  onChanged: (String? newValue) {
                    if (newValue != null && newValue != "Please Select") {
                      _subscriberViewModel.setReseller(newValue);
                    }
                    _dropdownKey.currentState?.reset();
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

  Widget dropDownOperatorList(
      BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
    if (snapshot.hasData) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: DropdownButtonFormField<String>(
          key: _dropdownKey,
          decoration: const InputDecoration(
            hintText: AppString.createNewPlanSelectOperatorHint,
            labelText: AppString.createNewPlanSelectOperator,
          ),
          // value: _userViewModel.owner,
          onChanged: (String? newValue) {
            if (newValue != null && newValue != "Please Select") {
              _subscriberViewModel.setOperator(newValue);
            }
          },
          items: snapshot.data!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget billingAddressBuilder(
      BuildContext context, AsyncSnapshot<bool> snapshot) {
    if (snapshot.hasData && !snapshot.data!) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: AppSize.s24,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p24,
            ),
            child: Text(
              "Billing Address:",
              style: TextStyle(fontSize: AppSize.s16),
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
                stream: _subscriberViewModel.outputBillingAddress,
                builder: (context, snapshot) {
                  return TextFormField(
                      controller: _billingAddressController,
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
                stream: _subscriberViewModel.outputBillingPinCode,
                builder: (context, snapshot) {
                  return TextFormField(
                      controller: _billingPinCodeController,
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
                stream: _subscriberViewModel.outputBillingCity,
                builder: (context, snapshot) {
                  return TextFormField(
                      controller: _billingCityController,
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
                stream: _subscriberViewModel.outputBillingState,
                builder: (context, snapshot) {
                  return TextFormField(
                      controller: _billingStateController,
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
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p24,
            ),
            child: StreamBuilder<String?>(
                stream: _subscriberViewModel.outputBillingCountry,
                builder: (context, snapshot) {
                  return TextFormField(
                      controller: _billingCountryController,
                      decoration: InputDecoration(
                        hintText: AppString.registerCountryHint,
                        labelText: AppString.registerCountry,
                        errorText: snapshot.data,
                      ));
                }),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _subscriberViewModel.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _companyNameController.dispose();
    _brandNameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    _gstNumberController.dispose();
    _addressController.dispose();
    _pinCodeController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _billingAddressController.dispose();
    _billingPinCodeController.dispose();
    _billingCityController.dispose();
    _billingStateController.dispose();
    _billingCountryController.dispose();

    super.dispose();
  }
}
