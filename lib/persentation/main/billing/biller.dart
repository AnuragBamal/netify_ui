import 'package:flutter/material.dart';
import 'package:netify/domain/model/billing_model.dart';
import 'package:netify/persentation/main/billing/billing_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

class Biller extends StatefulWidget {
  final BillingPageViewModel billingPageViewModel;
  const Biller({super.key, required this.billingPageViewModel});

  @override
  State<Biller> createState() => _BillerState();
}

class _BillerState extends State<Biller> {
  final GlobalKey<FormState> _billerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<dynamic>> _dropDownBillerResellerKey =
      GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> _dropDownBillerOperatorKey =
      GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> _dropDownBillerSubscriberKey =
      GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> _dropDownBillerSubscriptionKey =
      GlobalKey<FormFieldState<dynamic>>();
  @override
  Widget build(BuildContext context) {
    return billerWidget();
  }

  Widget billerWidget() {
    return SingleChildScrollView(
      child: Form(
          //key: _billerFormKey,
          child: Column(
        children: [
          Center(
            child: Text(
              AppString.billerTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: AppSize.s32,
          ),
          StreamBuilder<List<String>?>(
              stream: widget.billingPageViewModel.outputResellerList,
              builder: autoCompleteSearchResellerList),
          const SizedBox(
            height: AppSize.s24,
          ),
          StreamBuilder<List<String>?>(
              stream: widget.billingPageViewModel.outputOperatorList,
              builder: autoCompleteSearchOperatorList),
          const SizedBox(
            height: AppSize.s24,
          ),
          StreamBuilder<List<OperatorSubscriberMap>?>(
              stream: widget.billingPageViewModel.outputSubscriberList,
              builder: autoCompleteSubscriberList),
          const SizedBox(
            height: AppSize.s24,
          ),
          StreamBuilder<List<SubscriptionSubscriberMap>?>(
              stream: widget.billingPageViewModel.outputSubscriptionList,
              builder: dropDownSubscriptionList),
          const SizedBox(
            height: AppSize.s1,
          ),
          StreamBuilder<SubscriptionSubscriberMap?>(
              stream: widget.billingPageViewModel.outputSelectedSubscription,
              builder: selectedSubscriptionList),
          const SizedBox(
            height: AppSize.s24,
          ),
          StreamBuilder<bool>(
              stream: widget.billingPageViewModel.outputIsBillerDetailsValid,
              builder: (context, snapshot) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: (snapshot.data == true)
                        ? () {
                            if (snapshot.hasData && snapshot.data!) {
                              widget.billingPageViewModel.billerSubmit(context);
                            }
                          }
                        : null,
                    child: const Text(AppString.billerSubmitButton),
                  ),
                );
              }),
        ],
      )),
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
            _dropDownBillerOperatorKey.currentState?.reset();
            _dropDownBillerSubscriberKey.currentState?.reset();
            _dropDownBillerSubscriptionKey.currentState?.reset();

            widget.billingPageViewModel.setReseller(selection);
          },
          displayStringForOption: (String option) => option,
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            // if (_dropDownBillerResellerKey.currentState?.value == null) {
            //   WidgetsBinding.instance.addPostFrameCallback((_) {
            //     textEditingController.clear();
            //   });
            // }
            if (snapshot.data!.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                textEditingController.text = "No Reseller Found";
              });
            }
            if (snapshot.data!.length == 1) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _dropDownBillerOperatorKey.currentState?.reset();
                _dropDownBillerSubscriberKey.currentState?.reset();
                _dropDownBillerSubscriptionKey.currentState?.reset();

                textEditingController.text = snapshot.data!.first;

                widget.billingPageViewModel.setReseller(snapshot.data!.first);
              });
            }
            return TextFormField(
                key: _dropDownBillerResellerKey,
                controller: textEditingController,
                focusNode: focusNode,
                onEditingComplete: onFieldSubmitted,
                decoration: const InputDecoration(
                  hintText: AppString.createNewPlanSelectResellerHint,
                  labelText: AppString.createNewPlanSelectReseller,
                ),
                onChanged: (value) {
                  _dropDownBillerOperatorKey.currentState?.reset();
                  _dropDownBillerSubscriberKey.currentState?.reset();
                  _dropDownBillerSubscriptionKey.currentState?.reset();
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
            _dropDownBillerSubscriberKey.currentState?.reset();
            _dropDownBillerSubscriptionKey.currentState?.reset();
            widget.billingPageViewModel.setOperator(selection);
          },
          displayStringForOption: (String option) => option,
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            // if (_dropDownBillerOperatorKey.currentState?.value == null) {
            //   WidgetsBinding.instance.addPostFrameCallback((_) {
            //     textEditingController.clear();
            //   });
            // }
            if (snapshot.data!.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                textEditingController.text = "No Operator Found";
              });
            }
            if (snapshot.data!.length == 1) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _dropDownBillerSubscriberKey.currentState?.reset();
                _dropDownBillerSubscriptionKey.currentState?.reset();
                textEditingController.text = snapshot.data!.first;
                widget.billingPageViewModel.setOperator(snapshot.data!.first);
              });
            }
            return TextFormField(
                key: _dropDownBillerOperatorKey,
                controller: textEditingController,
                focusNode: focusNode,
                onEditingComplete: onFieldSubmitted,
                decoration: const InputDecoration(
                  hintText: AppString.createNewPlanSelectOperatorHint,
                  labelText: AppString.createNewPlanSelectOperator,
                ),
                onChanged: (value) {
                  _dropDownBillerSubscriberKey.currentState?.reset();
                  _dropDownBillerSubscriptionKey.currentState?.reset();
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

  Widget autoCompleteSubscriberList(BuildContext context,
      AsyncSnapshot<List<OperatorSubscriberMap>?> snapshot) {
    if (snapshot.hasData) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
        ),
        child: Autocomplete<OperatorSubscriberMap>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<OperatorSubscriberMap>.empty();
              //return snapshot.data!;
            }
            return snapshot.data!.where((OperatorSubscriberMap option) {
              return option.subscriberUserName
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (OperatorSubscriberMap selection) {
            _dropDownBillerSubscriptionKey.currentState?.reset();
            widget.billingPageViewModel.setSubscriber(selection.customerId);
          },
          displayStringForOption: (OperatorSubscriberMap option) =>
              option.subscriberUserName,
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            if (snapshot.data!.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                textEditingController.text = "No Subscriber Found";
              });
            }

            if (snapshot.data!.length == 1) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _dropDownBillerSubscriptionKey.currentState?.reset();
                textEditingController.text =
                    snapshot.data!.first.subscriberUserName;
                widget.billingPageViewModel
                    .setSubscriber(snapshot.data!.first.customerId);
              });
            }
            // if (snapshot.data!.length == 1) {
            //   _billingPageViewModel.setOperator(snapshot.data!.first);

            return TextFormField(
                key: _dropDownBillerSubscriberKey,
                controller: textEditingController,
                focusNode: focusNode,
                onEditingComplete: onFieldSubmitted,
                decoration: const InputDecoration(
                  hintText: AppString.subscriptionSubscriberTextHint,
                  labelText: AppString.subscriptionSubscriberText,
                ),
                onChanged: (value) {
                  _dropDownBillerSubscriptionKey.currentState?.reset();
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

  Widget dropDownSubscriptionList(BuildContext context,
      AsyncSnapshot<List<SubscriptionSubscriberMap>?> snapshot) {
    if (snapshot.hasData) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p24,
            ),
            child: DropdownButtonFormField<String>(
              key: _dropDownBillerSubscriptionKey,
              decoration: const InputDecoration(
                hintText: AppString.subscriptionHint,
                labelText: AppString.subscription,
              ),
              // value: _userViewModel.owner,
              onChanged: (String? newValue) {
                if (newValue != null && newValue != "Please Select") {
                  widget.billingPageViewModel.setSubscription(newValue);
                }
              },
              items: snapshot.data!.map<DropdownMenuItem<String>>(
                  (SubscriptionSubscriberMap value) {
                return DropdownMenuItem<String>(
                  value: value.subscriptionId,
                  child: Text(
                    value.subscriptionId,
                    style: const TextStyle(color: Colors.black),
                    textScaleFactor: 0.8,
                  ),
                );
              }).toList(),
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

  Widget selectedSubscriptionList(BuildContext context,
      AsyncSnapshot<SubscriptionSubscriberMap?> snapshot) {
    if (snapshot.hasData) {
      return Column(
        children: [
          Text.rich(TextSpan(
              text: "Subscription Status: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: snapshot.data!.subscriptionStatus,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Plan Name: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: snapshot.data!.planName,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Offered Price: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: "Rs ${snapshot.data!.offeredPrice}",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Network Type: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: snapshot.data!.networkType,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "IP Type: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: snapshot.data!.ipType,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Last Renewal Date: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: snapshot.data!.lastRenewalDate,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
