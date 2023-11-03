import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/persentation/main/plans/create_plan/create_plan_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

class CreateNewPlan extends StatefulWidget {
  const CreateNewPlan({super.key});

  @override
  State<CreateNewPlan> createState() => _CreatePlanState();
}

class _CreatePlanState extends State<CreateNewPlan> {
  final _plansPageViewModel = instance<CreatePlanViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _planNameController = TextEditingController();
  final _planDescriptionController = TextEditingController();
  final _planValidityController = TextEditingController();
  final _planpriceController = TextEditingController();
  final _maxSessionTimeController = TextEditingController();
  final _maxDataTransferInGBInSessionController = TextEditingController();
  final _maxCocurentSessionForUserController = TextEditingController();
  final _uploadSpeedController = TextEditingController();
  final _downloadSpeedController = TextEditingController();
  final _dataLimitController = TextEditingController();
  final _uploadSpeedFupController = TextEditingController();
  final _downloadSpeedFupController = TextEditingController();
  final _dataLimitFupController = TextEditingController();
  bool isTaxIncluded = false;

  _bind() {
    _planNameController.addListener(() {
      _plansPageViewModel.setPlanName(_planNameController.text);
    });
    _planDescriptionController.addListener(() {
      _plansPageViewModel.setPlanDescription(_planDescriptionController.text);
    });
    _planValidityController.addListener(() {
      if (_planValidityController.text.isNotEmpty) {
        _plansPageViewModel.setPlanValidity(_planValidityController.text);
      }
    });
    _planpriceController.addListener(() {
      if (_planpriceController.text.isNotEmpty) {
        _plansPageViewModel.setPlanEnteredPrice(_planpriceController.text);
      } else {
        _plansPageViewModel.setPlanEnteredPrice("0");
      }
    });
    _maxSessionTimeController.addListener(() {
      if (_maxSessionTimeController.text.isNotEmpty) {
        _plansPageViewModel
            .setmaxSessionTimeInHours(_maxSessionTimeController.text);
      }
    });
    _maxDataTransferInGBInSessionController.addListener(() {
      if (_maxDataTransferInGBInSessionController.text.isNotEmpty) {
        _plansPageViewModel.setMaxDataTransferInGB(
            _maxDataTransferInGBInSessionController.text);
      }
    });
    _maxCocurentSessionForUserController.addListener(() {
      if (_maxCocurentSessionForUserController.text.isNotEmpty) {
        _plansPageViewModel
            .setMaxConcurrentSession(_maxCocurentSessionForUserController.text);
      }
    });
    _uploadSpeedController.addListener(() {
      if (_uploadSpeedController.text.isNotEmpty) {
        _plansPageViewModel.setPlanUploadSpeed(_uploadSpeedController.text);
      }
    });
    _downloadSpeedController.addListener(() {
      if (_downloadSpeedController.text.isNotEmpty) {
        _plansPageViewModel.setPlanDownloadSpeed(_downloadSpeedController.text);
      }
    });
    _dataLimitController.addListener(() {
      if (_dataLimitController.text.isNotEmpty) {
        _plansPageViewModel.setPlanDataLimit(_dataLimitController.text);
      }
    });
    _uploadSpeedFupController.addListener(() {
      if (_uploadSpeedFupController.text.isNotEmpty) {
        _plansPageViewModel
            .setPlanFUPUploadSpeed(_uploadSpeedFupController.text);
      }
    });
    _downloadSpeedFupController.addListener(() {
      if (_downloadSpeedFupController.text.isNotEmpty) {
        _plansPageViewModel
            .setPlanFUPDownloadSpeed(_downloadSpeedFupController.text);
      }
    });
    _dataLimitFupController.addListener(() {
      if (_dataLimitFupController.text.isNotEmpty) {
        _plansPageViewModel.setPlanFUPDataLimit(_dataLimitFupController.text);
      }
    });
  }

  @override
  void initState() {
    _plansPageViewModel.start();
    isTaxIncluded = _plansPageViewModel.isTaxIncluded;
    // _maxCocurentSessionForUser.text = "1";
    // _maxDataTransferInGBInSession.text = "0";
    // _maxSessionTimeController.text = "0";
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.surfaceColor,
      body: _buildPlanForm(context),
    );
  }

  Widget _buildPlanForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppString.createNewPlanTitle,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _plansPageViewModel.outputPlanName,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _planNameController,
                          decoration: InputDecoration(
                            hintText: AppString.createNewPlanPlanNameHint,
                            labelText: AppString.createNewPlanPlanName,
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
                    stream: _plansPageViewModel.outputPlanDescription,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _planDescriptionController,
                          decoration: InputDecoration(
                            hintText:
                                AppString.createNewPlanPlanDescriptionHint,
                            labelText: AppString.createNewPlanDescription,
                            errorText: snapshot.data,
                          ));
                    }),
              ),
              StreamBuilder<bool>(
                stream: _plansPageViewModel.outputIsIntiallized,
                builder: afterIntiallizationWorkflow,
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: StreamBuilder<bool>(
                  stream: _plansPageViewModel.outputIsFormValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (snapshot.data == true)
                            ? () {
                                _plansPageViewModel
                                    .createNewPlanSubmit(context);
                              }
                            : null,
                        child: const Text(AppString.createNewPlanSubmitButton),
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

  Widget afterIntiallizationWorkflow(
      BuildContext context, AsyncSnapshot<bool> snapshot) {
    if (snapshot.data == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: AppSize.s24,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p24,
                  ),
                  child: StreamBuilder<String?>(
                      stream: _plansPageViewModel.outputPlanValidity,
                      builder: (context, snapshot) {
                        return TextFormField(
                            controller: _planValidityController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: AppString.planValidityHint,
                              labelText: AppString.planValidity,
                              errorText: snapshot.data,
                            ));
                      }),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: AppPadding.p24),
                child: dropDownValidityUnit(context),
              )),
            ],
          ),
          const SizedBox(
            height: AppSize.s24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p24,
            ),
            child: StreamBuilder<String?>(
                stream: _plansPageViewModel.outputPlanBasePrice,
                builder: (context, snapshot) {
                  return TextFormField(
                      controller: _planpriceController,
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
                      _plansPageViewModel.setIsTaxIncluded(value!);
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
              stream: _plansPageViewModel.outputPlanOfferPrice,
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p24,
            ),
            child: dropDownPlanType(context),
          ),
          const SizedBox(
            height: AppSize.s24,
          ),
          StreamBuilder<String?>(
            stream: _plansPageViewModel.outputPlanType,
            builder: planTypeWidget,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p24,
            ),
            child: TextFormField(
                controller: _maxSessionTimeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: AppString.planMaxSessionTimeInHoursHint,
                  labelText: AppString.planMaxSessionTimeInHours,
                )),
          ),
          const SizedBox(
            height: AppSize.s24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p24,
            ),
            child: TextFormField(
                controller: _maxDataTransferInGBInSessionController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: AppString.planMaxDataInSessionHint,
                  labelText: AppString.planMaxDataInSession,
                )),
          ),
          const SizedBox(
            height: AppSize.s24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p24,
            ),
            child: TextFormField(
                controller: _maxCocurentSessionForUserController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: AppString.planMaxSimultaneousSessionOfUserHint,
                  labelText: AppString.planMaxSimultaneousSessionOfUser,
                )),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget dropDownValidityUnit(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        hintText: AppString.planValidityTypeHint,
        labelText: AppString.planValidityType,
      ),
      // value: _userViewModel.owner,
      onChanged: (String? newValue) {
        if (newValue != null && newValue != "Please Select") {
          _plansPageViewModel.setPlanValidityUnit(newValue);
        }
      },
      items: _plansPageViewModel.planValidityUnit
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
  }

  Widget dropDownPlanType(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        hintText: AppString.selectPlanHint,
        labelText: AppString.selectPlan,
      ),
      // value: _userViewModel.owner,
      onChanged: (String? newValue) {
        if (newValue != null && newValue != "Please Select") {
          _plansPageViewModel.setPlanType(newValue);
        }
      },
      items: _plansPageViewModel.planType
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
  }

  Widget offerPriceWidget(BuildContext context, OfferPrice offerPrice) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: "${AppString.planOfferPrice} : ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primaryColor),
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
              text:
                  "${AppString.planTaxAmount}(${offerPrice.taxPercentage}%) : ",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primaryColor),
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
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primaryColor),
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
      ),
    );
  }

  Widget planTypeWidget(BuildContext context, AsyncSnapshot<String?> snapshot) {
    if (snapshot.hasData && snapshot.data != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p24,
                  ),
                  child: StreamBuilder<String?>(
                      stream: _plansPageViewModel.outputPlanUploadSpeed,
                      builder: (context, snapshot) {
                        return TextFormField(
                            controller: _uploadSpeedController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: AppString.uploadSpeedHint,
                              labelText: AppString.uploadSpeed,
                              errorText: snapshot.data,
                            ));
                      }),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: AppPadding.p24),
                child: dropDownSpeedType(context, uploadSpeedUnit),
              )),
            ],
          ),
          const SizedBox(
            height: AppSize.s24,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p24,
                  ),
                  child: StreamBuilder<String?>(
                      stream: _plansPageViewModel.outputPlanDownloadSpeed,
                      builder: (context, snapshot) {
                        return TextFormField(
                            controller: _downloadSpeedController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: AppString.downloadSpeedHint,
                              labelText: AppString.downloadSpeed,
                              errorText: snapshot.data,
                            ));
                      }),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: AppPadding.p24),
                child: dropDownSpeedType(context, downloadSpeedUnit),
              )),
            ],
          ),
          const SizedBox(
            height: AppSize.s24,
          ),
          if (snapshot.data == PlanType.fup ||
              snapshot.data == PlanType.limited)
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p24,
                    ),
                    child: StreamBuilder<String?>(
                        stream: _plansPageViewModel.outputPlanDataLimit,
                        builder: (context, snapshot) {
                          return TextFormField(
                              controller: _dataLimitController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: AppString.dataLimitHint,
                                labelText: AppString.dataLimit,
                                errorText: snapshot.data,
                              ));
                        }),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p24),
                  child: dropDownDataLimitType(context, maxDataLimitUnit),
                )),
              ],
            ),
          const SizedBox(
            height: AppSize.s24,
          ),
          if (snapshot.data == PlanType.fup)
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p24,
                    ),
                    child: StreamBuilder<String?>(
                        stream: _plansPageViewModel.outputPlanFUPUploadSpeed,
                        builder: (context, snapshot) {
                          return TextFormField(
                              controller: _uploadSpeedFupController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: AppString.fupUploadSpeedHint,
                                labelText: AppString.fupUploadSpeed,
                                errorText: snapshot.data,
                              ));
                        }),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p24),
                  child: dropDownSpeedType(context, fupUploadSpeedUnit),
                )),
              ],
            ),
          if (snapshot.data == PlanType.fup)
            const SizedBox(
              height: AppSize.s24,
            ),
          if (snapshot.data == PlanType.fup)
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p24,
                    ),
                    child: StreamBuilder<String?>(
                        stream: _plansPageViewModel.outputPlanFUPDownloadSpeed,
                        builder: (context, snapshot) {
                          return TextFormField(
                              controller: _downloadSpeedFupController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: AppString.fupDownloadSpeedHint,
                                labelText: AppString.fupDownloadSpeed,
                                errorText: snapshot.data,
                              ));
                        }),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p24),
                      child: dropDownSpeedType(context, fupDownloadSpeedUnit),
                    )),
              ],
            ),
          const SizedBox(
            height: AppSize.s24,
          ),
          if (snapshot.data == PlanType.fup)
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p24,
                    ),
                    child: StreamBuilder<String?>(
                        stream: _plansPageViewModel.outputPlanFUPDataLimit,
                        builder: (context, snapshot) {
                          return TextFormField(
                              controller: _dataLimitFupController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: AppString.fupDataLimitHint,
                                labelText: AppString.fupDataLimit,
                                errorText: snapshot.data,
                              ));
                        }),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p24),
                  child: dropDownDataLimitType(context, fupDataLimitUnit),
                )),
              ],
            ),
          if (snapshot.data == PlanType.fup)
            const SizedBox(
              height: AppSize.s24,
            ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget dropDownSpeedType(BuildContext context, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        hintText: AppString.speedUnitHint,
        labelText: AppString.speedUnit,
      ),
      // value: _userViewModel.owner,
      onChanged: onChanged,
      items: _plansPageViewModel.planSpeedUnit
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
  }

  Widget dropDownDataLimitType(
      BuildContext context, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        hintText: AppString.dataLimitUnitHint,
        labelText: AppString.dataLimitUnit,
      ),
      // value: _userViewModel.owner,
      onChanged: onChanged,
      items: _plansPageViewModel.planDataLimitUnit
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
  }

  uploadSpeedUnit(String? newValue) {
    if (newValue != null && newValue != "Please Select") {
      _plansPageViewModel.setPlanUploadSpeedUnit(newValue);
    }
  }

  downloadSpeedUnit(String? newValue) {
    if (newValue != null && newValue != "Please Select") {
      _plansPageViewModel.setPlanDownloadSpeedUnit(newValue);
    }
  }

  fupUploadSpeedUnit(String? newValue) {
    if (newValue != null && newValue != "Please Select") {
      _plansPageViewModel.setPlanFUPUploadSpeedUnit(newValue);
    }
  }

  fupDownloadSpeedUnit(String? newValue) {
    if (newValue != null && newValue != "Please Select") {
      _plansPageViewModel.setPlanFUPDownloadSpeedUnit(newValue);
    }
  }

  maxDataLimitUnit(String? newValue) {
    if (newValue != null && newValue != "Please Select") {
      _plansPageViewModel.setPlanDataLimitUnit(newValue);
    }
  }

  fupDataLimitUnit(String? newValue) {
    if (newValue != null && newValue != "Please Select") {
      _plansPageViewModel.setPlanFUPDataLimitUnit(newValue);
    }
  }

  @override
  void dispose() {
    _planNameController.dispose();
    _planDescriptionController.dispose();
    _uploadSpeedController.dispose();
    _downloadSpeedController.dispose();
    _dataLimitController.dispose();
    _uploadSpeedFupController.dispose();
    _downloadSpeedFupController.dispose();
    _dataLimitFupController.dispose();
    super.dispose();
  }
}
