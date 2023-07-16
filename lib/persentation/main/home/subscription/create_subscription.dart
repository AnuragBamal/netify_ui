import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/plan_model.dart';
import 'package:netify/persentation/main/home/subscription/subscription_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

class CreateNewSubscription extends StatefulWidget {
  const CreateNewSubscription({super.key});

  @override
  State<CreateNewSubscription> createState() => _CreateNewSubscriptionState();
}

class _CreateNewSubscriptionState extends State<CreateNewSubscription> {
  final _subcriptionViewModel = instance<SubscriptionViewModel>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<dynamic>> _dropDownOperatorKey =
      GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> _dropDownSubscriberKey =
      GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> _dropDownPlanKey =
      GlobalKey<FormFieldState<dynamic>>();
  bool isSameAsBillingAddress = false;
  bool isSameAsPermanentAddress = false;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();

  _bind() {
    _subcriptionViewModel.start();

    _userNameController.addListener(() {
      _subcriptionViewModel.setUserName(_userNameController.text);
    });

    _passwordController.addListener(() {
      _subcriptionViewModel.setPassword(_passwordController.text);
    });

    _cityController.addListener(() {
      _subcriptionViewModel.setCity(_cityController.text);
    });
    _addressController.addListener(() {
      _subcriptionViewModel.setAddress(_addressController.text);
    });
    _countryController.addListener(() {
      _subcriptionViewModel.setCountry(_countryController.text);
    });

    _pinCodeController.addListener(() {
      _subcriptionViewModel.setPinCode(_pinCodeController.text);
    });

    _stateController.addListener(() {
      _subcriptionViewModel.setState(_stateController.text);
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
                  stream: _subcriptionViewModel.outputOperatorList,
                  builder: dropDownOperatorList),
              const SizedBox(
                height: AppSize.s24,
              ),
              StreamBuilder<List<SubscriberMapInfo>?>(
                  stream: _subcriptionViewModel.outputSubscriberList,
                  builder: dropDownSubscriberList),
              const SizedBox(
                height: AppSize.s24,
              ),
              StreamBuilder<List<PlanProfileMetaPlan>?>(
                  stream: _subcriptionViewModel.outputPlanList,
                  builder: dropDownPlanList),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _subcriptionViewModel.outputUserName,
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
                    stream: _subcriptionViewModel.outputPassword,
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
              StreamBuilder<List<String>?>(
                  stream: _subcriptionViewModel.outputNetworkTypeList,
                  builder: dropDownNetworkType),
              const SizedBox(
                height: AppSize.s24,
              ),
              StreamBuilder<List<String>?>(
                  stream: _subcriptionViewModel.outputIpTypeList,
                  builder: dropDownIpType),
              const SizedBox(
                height: AppSize.s24,
              ),
              StreamBuilder<bool>(
                  stream: _subcriptionViewModel.outputIsStaticIpSelected,
                  builder: (context, snapshot) {
                    return snapshot.data != null && snapshot.data!
                        ? StreamBuilder<List<String>?>(
                            stream: _subcriptionViewModel.outputStaticIpList,
                            builder: dropDownStaticIp)
                        : const SizedBox();
                  }),
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
                      AppString.sameAsPermanentAddress,
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
                        value: isSameAsPermanentAddress,
                        onChanged: (bool? value) {
                          _subcriptionViewModel
                              .setIsAddressSameAsBilling(value!);
                          setState(() {
                            isSameAsPermanentAddress = value;
                            isSameAsBillingAddress = false;
                          });
                          if (!value) {
                            _addressController.clear();
                            _pinCodeController.clear();
                            _cityController.clear();
                            _stateController.clear();
                            _countryController.clear();
                          }
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p24,
                    ),
                    child: Text(
                      AppString.sameAsBillingAddress,
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
                        value: isSameAsBillingAddress,
                        onChanged: (bool? value) {
                          _subcriptionViewModel
                              .setIsAddressSameAsPermanent(value!);
                          setState(() {
                            isSameAsBillingAddress = value;
                            isSameAsPermanentAddress = false;
                          });
                          if (!value) {
                            _addressController.clear();
                            _pinCodeController.clear();
                            _cityController.clear();
                            _stateController.clear();
                            _countryController.clear();
                          }
                        }),
                  ),
                ],
              ),
              StreamBuilder(
                  stream: _subcriptionViewModel.isBillingSameController,
                  builder: installationAddressBuilder),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: StreamBuilder<bool>(
                  stream: _subcriptionViewModel.isAllInputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (snapshot.data == true)
                            ? () {
                                _subcriptionViewModel
                                    .createNewSubscriptionSubmit(context);
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
            stream: _subcriptionViewModel.outputResellerList,
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
                      _subcriptionViewModel.setReseller(newValue);
                    }
                    _dropDownOperatorKey.currentState?.reset();
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
          key: _dropDownOperatorKey,
          decoration: const InputDecoration(
            hintText: AppString.createNewPlanSelectOperatorHint,
            labelText: AppString.createNewPlanSelectOperator,
          ),
          // value: _userViewModel.owner,
          onChanged: (String? newValue) {
            if (newValue != null && newValue != "Please Select") {
              _subcriptionViewModel.setOperator(newValue);
              _dropDownSubscriberKey.currentState?.reset();
              _dropDownPlanKey.currentState?.reset();
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

  Widget dropDownSubscriberList(
      BuildContext context, AsyncSnapshot<List<SubscriberMapInfo>?> snapshot) {
    if (snapshot.hasData) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: DropdownButtonFormField<String>(
          key: _dropDownSubscriberKey,
          decoration: const InputDecoration(
            hintText: AppString.subscriptionSubscriberTextHint,
            labelText: AppString.subscriptionSubscriberText,
          ),
          // value: _userViewModel.owner,
          onChanged: (String? newValue) {
            if (newValue != null && newValue != "Please Select") {
              _subcriptionViewModel.setOperator(newValue);
            }
          },
          items: snapshot.data!
              .map<DropdownMenuItem<String>>((SubscriberMapInfo value) {
            return DropdownMenuItem<String>(
              value: value.customerId,
              child: Text(
                value.subscriberUserName,
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

  Widget dropDownPlanList(BuildContext context,
      AsyncSnapshot<List<PlanProfileMetaPlan>?> snapshot) {
    if (snapshot.hasData) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: DropdownButtonFormField<String>(
          key: _dropDownPlanKey,
          decoration: const InputDecoration(
            hintText: AppString.subscriptionSelectPlanTextHint,
            labelText: AppString.subscriptionSelectPlanText,
          ),
          // value: _userViewModel.owner,
          onChanged: (String? newValue) {
            if (newValue != null && newValue != "Please Select") {
              _subcriptionViewModel.setPlanName(newValue);
            }
          },
          items: snapshot.data!
              .map<DropdownMenuItem<String>>((PlanProfileMetaPlan value) {
            return DropdownMenuItem<String>(
              value: value.planName,
              child: Text(
                value.planName,
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

  Widget dropDownNetworkType(
      BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
    if (snapshot.hasData) {
      return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24,
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              hintText: AppString.subscriptionNetworkTypeTextHint,
              labelText: AppString.subscriptionNetworkTypeText,
            ),
            // value: _userViewModel.owner,
            onChanged: (String? newValue) {
              if (newValue != null && newValue != "Please Select") {
                _subcriptionViewModel.setNetworkType(newValue);
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
          ));
    } else {
      return const SizedBox();
    }
  }

  Widget dropDownIpType(
      BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
    if (snapshot.hasData) {
      return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24,
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              hintText: AppString.subscriptionIpTypeTextHint,
              labelText: AppString.subscriptionIpTypeText,
            ),
            // value: _userViewModel.owner,
            onChanged: (String? newValue) {
              if (newValue != null && newValue != "Please Select") {
                _subcriptionViewModel.setIpType(newValue);
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
          ));
    } else {
      return const SizedBox();
    }
  }

  Widget dropDownStaticIp(
      BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
    if (snapshot.hasData) {
      return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24,
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              hintText: AppString.subscriptionStaticIpTextHint,
              labelText: AppString.subscriptionStaticIpText,
            ),
            // value: _userViewModel.owner,
            onChanged: (String? newValue) {
              if (newValue != null && newValue != "Please Select") {
                _subcriptionViewModel.setStaticIp(newValue);
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
          ));
    } else {
      return const SizedBox();
    }
  }

  Widget installationAddressBuilder(
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
              AppString.installationAddress,
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
                stream: _subcriptionViewModel.outputAddress,
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
                stream: _subcriptionViewModel.outputPinCode,
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
                stream: _subcriptionViewModel.outputCity,
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
                stream: _subcriptionViewModel.outputState,
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
                stream: _subcriptionViewModel.outputCountry,
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
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _subcriptionViewModel.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _pinCodeController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    super.dispose();
  }
}
