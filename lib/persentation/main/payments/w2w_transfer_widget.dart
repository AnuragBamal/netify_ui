import 'package:flutter/material.dart';
import 'package:netify/domain/model/wallet_model.dart';
import 'package:netify/persentation/main/payments/payments_view_model.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

class W2WTransferWidget extends StatefulWidget {
  final PaymentsPageViewModel paymentsPageViewModel;
  final List<Payee> payee;
  const W2WTransferWidget(
      {super.key, required this.paymentsPageViewModel, required this.payee});

  @override
  State<W2WTransferWidget> createState() => _W2WTransferWidgetState();
}

class _W2WTransferWidgetState extends State<W2WTransferWidget> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _amountController.addListener(() {
      widget.paymentsPageViewModel.setTransferAmount(_amountController.text);
    });
    _remarksController.addListener(() {
      widget.paymentsPageViewModel.setRemarks(_remarksController.text);
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Column(
              children: [
                _getPayeeWidget(context, widget.payee),
                const SizedBox(
                  height: AppSize.s8,
                ),
                _getAmountWidget(context),
                const SizedBox(
                  height: AppSize.s8,
                ),
                _getRemarksWidget(context),
                const SizedBox(
                  height: AppSize.s8,
                ),
                _getTransferButton(context),
                const SizedBox(
                  height: AppSize.s8,
                ),
              ],
            ),
          ),
          // _getPayeeWidget(context, payee),
          // _getAmountWidget(context),
          // _getTransferButton(context),
        ],
      ),
    );
  }

  Widget _getPayeeWidget(BuildContext context, List<Payee> payee) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s16, right: AppSize.s16),
      child: DropdownButtonFormField<Payee>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          labelText: AppString.payee,
        ),
        //value: payee[0],
        onChanged: (Payee? newValue) {
          widget.paymentsPageViewModel
              .setPayeeName(newValue!.userName, newValue.userId);
        },
        items: payee
            .map<DropdownMenuItem<Payee>>((Payee value) => DropdownMenuItem(
                  value: value,
                  child: Text(value.userName),
                ))
            .toList(),
      ),
    );
  }

  Widget _getAmountWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: AppSize.s16, right: AppSize.s16),
        child: StreamBuilder<String?>(
            stream: widget.paymentsPageViewModel.outputForAmount,
            builder: (context, snapshot) {
              return TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSize.s8),
                    ),
                    labelText: AppString.transferAmount,
                    errorText: snapshot.data),
              );
            }));
  }

  Widget _getTransferButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s16, right: AppSize.s16),
      child: StreamBuilder<bool>(
          stream: widget.paymentsPageViewModel.outputForActivateW2wTransfer,
          builder: (context, snapshot) {
            return ElevatedButton(
              onPressed: (snapshot.data == true)
                  ? () {
                      widget.paymentsPageViewModel.triggerTransfer(context);
                      _amountController.clear();
                    }
                  : null,
              child: const Text(AppString.transferButton),
            );
          }),
    );
  }

  Widget _getRemarksWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s16, right: AppSize.s16),
      child: TextFormField(
        controller: _remarksController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          labelText: AppString.remarks,
        ),
      ),
    );
  }
}
