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
  final TextEditingController _priceController = TextEditingController();

  bool isTaxIncluded = false;

  final TextEditingController searchResellerController =
      TextEditingController();

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

    _priceController.addListener(() {
      if (_priceController.text.isNotEmpty) {
        _subcriptionViewModel.setPlanEnteredPrice(_priceController.text);
      } else {
        _subcriptionViewModel.setPlanEnteredPrice("0");
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
                  AppString.createNewSubscription,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(
                height: AppSize.s32,
              ),
              //dropDownResellerList(context),
              StreamBuilder<List<String>?>(
                  stream: _subcriptionViewModel.outputResellerList,
                  builder: autoCompleteSearchResellerList),
              const SizedBox(
                height: AppSize.s24,
              ),
              StreamBuilder<List<String>?>(
                  stream: _subcriptionViewModel.outputOperatorList,
                  builder: autoCompleteSearchOperatorList),
              const SizedBox(
                height: AppSize.s24,
              ),
              StreamBuilder<List<SubscriberMapInfo>?>(
                  stream: _subcriptionViewModel.outputSubscriberList,
                  builder: autoCompleteSubscriberList),
              const SizedBox(
                height: AppSize.s24,
              ),
              StreamBuilder<List<PlanProfileMetaPlan>?>(
                  stream: _subcriptionViewModel.outputPlanList,
                  builder: dropDownPlanList),
              const SizedBox(
                height: AppSize.s24,
              ),

              // StreamBuilder<List<String>?>(
              //     stream: _subcriptionViewModel.outputBillingCycle,
              //     builder: dropDownBillingCycle),
              // const SizedBox(
              //   height: AppSize.s24,
              // ),
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
                            hintText: AppString.cpeDeviceIdHint,
                            labelText: AppString.cpeDeviceId,
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
                            hintText: AppString.cpeDevicePasswordHint,
                            labelText: AppString.cpeDevicePassword,
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
                      AppString.installationSameAsPermanentAddress,
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
                      AppString.installationSameAsBillingAddress,
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

  Widget autoCompleteSearchResellerList(
      BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
    if (snapshot.hasData) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
              //return snapshot.data!;
            }
            return snapshot.data!.where((String option) {
              return option
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            _subcriptionViewModel.setReseller(selection);
            _dropDownOperatorKey.currentState?.reset();
          },
          displayStringForOption: (String option) => option,
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                onEditingComplete: onFieldSubmitted,
                decoration: const InputDecoration(
                  hintText: AppString.createNewPlanSelectResellerHint,
                  labelText: AppString.createNewPlanSelectReseller,
                ),
                onChanged: (value) {
                  _dropDownOperatorKey.currentState?.reset();
                  _dropDownSubscriberKey.currentState?.reset();
                  _dropDownPlanKey.currentState?.reset();
                }

                // onChanged: (String value) {
                //   _subcriptionViewModel.setReseller(value);
                // },
                );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return Padding(
              padding: const EdgeInsets.only(right: 48),
              child: Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 18.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight:
                            // MediaQuery.of(context).size.height * 0.33),
                            (options.length + 1) * 48.0),
                    child: Column(
                      children: [
                        Text(
                          "${options.length} suggestions",
                          style: const TextStyle(
                              fontSize: AppSize.s14,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.primaryColor),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight:
                                  //MediaQuery.of(context).size.height *0.3
                                  options.length * 52.0),
                          //height: 200.0,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final String option = options.elementAt(index);
                              return GestureDetector(
                                onTap: () {
                                  onSelected(option);
                                },
                                child: ListTile(
                                  title: Text(option),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget autoCompleteSearchOperatorList(
      BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
    if (snapshot.hasData) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
              //return snapshot.data!;
            }
            return snapshot.data!.where((String option) {
              return option
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            _dropDownSubscriberKey.currentState?.reset();
            _dropDownPlanKey.currentState?.reset();
            _subcriptionViewModel.setOperator(selection);
          },
          displayStringForOption: (String option) => option,
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                onEditingComplete: onFieldSubmitted,
                decoration: const InputDecoration(
                  hintText: AppString.createNewPlanSelectOperatorHint,
                  labelText: AppString.createNewPlanSelectOperator,
                ),
                onChanged: (value) {
                  _dropDownSubscriberKey.currentState?.reset();
                  _dropDownPlanKey.currentState?.reset();
                }

                // onChanged: (String value) {
                //   _subcriptionViewModel.setOperator(value);
                // },
                );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return Padding(
              padding: const EdgeInsets.only(right: 48),
              child: Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 18.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight:
                            // MediaQuery.of(context).size.height * 0.33),
                            (options.length + 1) * 48.0),
                    child: Column(
                      children: [
                        Text(
                          "${options.length} suggestions",
                          style: const TextStyle(
                              fontSize: AppSize.s14,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.primaryColor),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight:
                                  //MediaQuery.of(context).size.height *0.3
                                  options.length * 52.0),
                          //height: 200.0,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final String option = options.elementAt(index);
                              return GestureDetector(
                                onTap: () {
                                  onSelected(option);
                                },
                                child: ListTile(
                                  title: Text(option),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const SizedBox();
    }
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

  Widget autoCompleteSubscriberList(
      BuildContext context, AsyncSnapshot<List<SubscriberMapInfo>?> snapshot) {
    if (snapshot.hasData) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: Autocomplete<SubscriberMapInfo>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<SubscriberMapInfo>.empty();
              //return snapshot.data!;
            }
            return snapshot.data!.where((SubscriberMapInfo option) {
              return option.subscriberUserName
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (SubscriberMapInfo selection) {
            _subcriptionViewModel.setSubscriber(selection.customerId);
          },
          displayStringForOption: (SubscriberMapInfo option) =>
              option.subscriberUserName,
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                onEditingComplete: onFieldSubmitted,
                decoration: const InputDecoration(
                  hintText: AppString.subscriptionSubscriberTextHint,
                  labelText: AppString.subscriptionSubscriberText,
                ),
                onChanged: (value) {
                  _dropDownPlanKey.currentState?.reset();
                }

                // onChanged: (String value) {
                //   _subcriptionViewModel.setOperator(value);
                // },
                );
          },
          optionsViewBuilder: (context, onSelected, options) {
            return Padding(
              padding: const EdgeInsets.only(right: 48),
              child: Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 18.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight:
                            // MediaQuery.of(context).size.height * 0.33),
                            (options.length + 1) * 48.0),
                    child: Column(
                      children: [
                        Text(
                          "${options.length} suggestions",
                          style: const TextStyle(
                              fontSize: AppSize.s14,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.primaryColor),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight:
                                  //MediaQuery.of(context).size.height *0.3
                                  options.length * 52.0),
                          //height: 200.0,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: options.length,
                            itemBuilder: (context, index) {
                              final option = options.elementAt(index);
                              return GestureDetector(
                                onTap: () {
                                  onSelected(option);
                                },
                                child: ListTile(
                                  title: Text(option.subscriberUserName),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
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
              _subcriptionViewModel.setSubscriber(newValue);
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
      return Column(
        children: [
          Padding(
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
                  value: value.planId,
                  child: Text(
                    "${"${value.planName}(${value.planPrice}"})",
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
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
                stream: _subcriptionViewModel.outputPlanBasePrice,
                builder: (context, snapshot) {
                  return TextFormField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: AppString.planBasePriceHint,
                        labelText: AppString.planBasePrice,
                        errorText: snapshot.data,
                      ));
                }),
          ),
          const SizedBox(
            height: AppSize.s1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
            child: Row(
              children: [
                Checkbox(
                    activeColor: ColorManager.primaryColor,
                    value: isTaxIncluded,
                    onChanged: (bool? value) {
                      _subcriptionViewModel.setIsTaxIncluded(value!);
                      setState(() {
                        isTaxIncluded = value;
                      });
                    }),
                const Text(AppString.planTaxIncluded,
                    style: TextStyle(
                        fontSize: AppSize.s12,
                        color: ColorManager.primaryColor)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
            child: StreamBuilder<OfferPrice?>(
              stream: _subcriptionViewModel.outputPlanOfferPrice,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return offerPriceWidget(context, snapshot.data!);
                } else {
                  return Container();
                }
              },
            ),
          ),
          const SizedBox(
            height: AppSize.s24,
          ),
        ],
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

  Widget offerPriceWidget(BuildContext context, OfferPrice offerPrice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: "${AppString.planOfferPrice} : ",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: ColorManager.primaryColor),
            children: [
              TextSpan(
                text: offerPrice.offerPrice.toStringAsFixed(2),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.blackColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: AppSize.s8,
        ),
        Text.rich(
          TextSpan(
            text: "${AppString.planTaxAmount}(${offerPrice.taxPercentage}%) : ",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: ColorManager.primaryColor),
            children: [
              TextSpan(
                text: offerPrice.taxAmount.toStringAsFixed(2),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.blackColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: AppSize.s8,
        ),
        Text.rich(
          TextSpan(
            text: "${AppString.planBasePrice} : ",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: ColorManager.primaryColor),
            children: [
              TextSpan(
                text: offerPrice.basePrice.toStringAsFixed(2),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.blackColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
    _priceController.dispose();
    super.dispose();
  }
  //Unused Code for future reference uncomment if needed
// Widget dropDownResellerList(
//       BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
//     if (snapshot.hasData) {
//       return DropdownButtonFormField<String>(
//         decoration: const InputDecoration(
//           hintText: AppString.createNewPlanSelectResellerHint,
//           labelText: AppString.createNewPlanSelectReseller,
//         ),
//         // value: _userViewModel.owner,
//         onChanged: (String? newValue) {
//           if (newValue != null && newValue != "Please Select") {
//             _subcriptionViewModel.setReseller(newValue);
//           }
//           _dropDownOperatorKey.currentState?.reset();
//         },
//         items: snapshot.data!.map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(
//               value,
//               style: const TextStyle(color: Colors.black),
//             ),
//           );
//         }).toList(),
//       );
//     } else {
//       return const SizedBox();
//     }
//   }
}
