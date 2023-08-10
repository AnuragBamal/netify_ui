import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/plan_model.dart';
import 'package:netify/persentation/main/plans/price_chart/create_price_chart_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

class CreatePriceChartArguments {
  final String screenTypeIdentity;
  const CreatePriceChartArguments({required this.screenTypeIdentity});
}

class CreatePriceChart extends StatefulWidget {
  final CreatePriceChartArguments arguments;
  const CreatePriceChart({super.key, required this.arguments});

  @override
  State<CreatePriceChart> createState() => _CreatePriceChartState();
}

class _CreatePriceChartState extends State<CreatePriceChart> {
  final _plansPageViewModel = instance<CreatePlanPageViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _planpriceController = TextEditingController();
  bool isTaxIncluded = false;
  _bind() {
    _planpriceController.addListener(() {
      _plansPageViewModel.setPlanPrice(_planpriceController.text == ""
          ? 0
          : int.parse(_planpriceController.text));
    });
  }

  @override
  void initState() {
    super.initState();
    _bind();
    _plansPageViewModel.start();
  }

  @override
  void dispose() {
    _planpriceController.dispose();
    _plansPageViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.surfaceColor,
      body: _getContentWidget(context),
    );
  }

  Widget _getContentWidget(BuildContext context) {
    if (widget.arguments.screenTypeIdentity ==
        ScreenTypeIdentity.resellerPriceChart) {
      return _buildResellerPriceChartForm(context);
    } else {
      return _buildOperatorPriceChartForm(context);
    }
  }

  Widget _buildResellerPriceChartForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppString.createNewResellerPlanTitle,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: AppSize.s100,
              ),
              dropDownResellers(context),
              const SizedBox(
                height: AppSize.s24,
              ),
              dropDownPlans(context, _plansPageViewModel.listOfPlansStream),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _plansPageViewModel.outputErrorPlanPriceStream,
                    builder: (context, snapshot) {
                      return TextFormField(
                          controller: _planpriceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: AppString.createNewResellerPlanPriceHInt,
                            labelText: AppString.createNewResellerPlanPrice,
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
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: StreamBuilder<bool>(
                  stream: _plansPageViewModel.isAllResellerPriceInputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (snapshot.data == true)
                            ? () {
                                _plansPageViewModel
                                    .createNewResellerPriceChartSubmit(context);
                              }
                            : null,
                        child: const Text(
                            AppString.createNewResellerPlanSubmitButton),
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

  Widget _buildOperatorPriceChartForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                AppString.createNewOperatorPlanTitle,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: AppSize.s100,
              ),
              dropDownResellers(context),
              const SizedBox(
                height: AppSize.s24,
              ),
              dropDownResellerPlans(
                  context, _plansPageViewModel.listOfResellerPlansStream),
              const SizedBox(
                height: AppSize.s24,
              ),
              dropDownOperators(context),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p24,
                ),
                child: StreamBuilder<String?>(
                    stream: _plansPageViewModel.outputErrorPlanPriceStream,
                    builder: (context, snapshot) {
                      return TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _planpriceController,
                          decoration: InputDecoration(
                            hintText: AppString.createNewResellerPlanPriceHInt,
                            labelText: AppString.createNewResellerPlanPrice,
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
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: StreamBuilder<bool>(
                  stream: _plansPageViewModel.isAllOperatorPriceInputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (snapshot.data == true)
                            ? () {
                                _plansPageViewModel
                                    .createNewOperatorPriceChartSubmit(context);
                              }
                            : null,
                        child: const Text(
                            AppString.createNewOperatorPlanSubmitButton),
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

  Widget dropDownPlans(
      BuildContext context, Stream<List<PlanProfileMetaPlan>> stream) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: StreamBuilder<List<PlanProfileMetaPlan>?>(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: AppString.createNewPlanSelectPlanHint,
                    labelText: AppString.createNewPlanSelectPlan,
                  ),
                  // value: _userViewModel.owner,
                  onChanged: (String? newValue) {
                    if (newValue != null && newValue != "Please Select") {
                      _plansPageViewModel.setSelectedPlan(newValue);
                    }
                  },
                  items: snapshot.data!.map<DropdownMenuItem<String>>(
                      (PlanProfileMetaPlan value) {
                    return DropdownMenuItem<String>(
                      value: value.planName,
                      child: Text(
                        "${value.planName}(${value.planPrice})",
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

  Widget dropDownResellerPlans(
      BuildContext context, Stream<List<PlanProfileMetaPlan>> stream) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: StreamBuilder<List<PlanProfileMetaPlan>?>(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: AppString.createNewPlanSelectPlanHint,
                    labelText: AppString.createNewPlanSelectPlan,
                  ),
                  // value: _userViewModel.owner,
                  onChanged: (String? newValue) {
                    if (newValue != null && newValue != "Please Select") {
                      _plansPageViewModel.setSelectedPlan(newValue);
                    }
                  },
                  items: snapshot.data!.map<DropdownMenuItem<String>>(
                      (PlanProfileMetaPlan value) {
                    return DropdownMenuItem<String>(
                      value: value.planName,
                      child: Text(
                        "${value.planName}(${value.planPrice})",
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

  Widget dropDownResellers(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: StreamBuilder<List<String>?>(
            stream: _plansPageViewModel.listOfResellerStream,
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
                      _plansPageViewModel.setResellerUsername(newValue);
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

  Widget dropDownOperators(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: StreamBuilder<List<String>?>(
            stream: _plansPageViewModel.listOfOperatorStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: AppString.createNewPlanSelectOperatorHint,
                    labelText: AppString.createNewPlanSelectOperator,
                  ),
                  // value: _userViewModel.owner,
                  onChanged: (String? newValue) {
                    if (newValue != null && newValue != "Please Select") {
                      _plansPageViewModel.setOperatorUsername(newValue);
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
