import 'package:flutter/material.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/font_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/styles_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

enum StateRendrerType {
  //pop up states
  popupLoadingState,
  popupErrorState,
  popupSuccessState,
  //full screen states
  fullScreenLoadingState,
  fullScreenErrorState,

  contentScreenState, //The UI of the screen
  emptyScreenState, //Empty View when we receive no data from API side for list screen
}

class StateRendrer extends StatelessWidget {
  final StateRendrerType stateRendrerType;
  final String message, title;
  final Function onRetryPressed;

  const StateRendrer(
      {super.key,
      required this.stateRendrerType,
      String? message,
      String? title,
      required this.onRetryPressed})
      : message = message ?? AppString.loading,
        title = title ?? "";

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendrerType) {
      case StateRendrerType.popupLoadingState:
        return _getPopUpDialog(context, [
          _getIconWidget(""),
        ]);
      case StateRendrerType.popupErrorState:
        return _getPopUpDialog(context, [
          _getIconWidget(""),
          _getMessageWidget(message),
          _getRetryButtonWidget(AppString.ok, context)
        ]);
      case StateRendrerType.popupSuccessState:
        return _getPopUpDialog(context, [
          _getIconWidget(""),
          _getTitleWidget(title),
          _getMessageWidget(message),
          _getRetryButtonWidget(AppString.ok, context)
        ]);
      case StateRendrerType.fullScreenLoadingState:
        return _getItemsInColumn(
            [_getIconWidget(""), _getMessageWidget(message)]);
      case StateRendrerType.fullScreenErrorState:
        return _getItemsInColumn([
          _getIconWidget(""),
          _getMessageWidget(message),
          _getRetryButtonWidget(AppString.retryAgain, context)
        ]);
      case StateRendrerType.contentScreenState:
        return Container(); //add content screen state , one can play around with this
      case StateRendrerType.emptyScreenState:
        return _getItemsInColumn(
            [_getIconWidget(""), _getMessageWidget(message)]);
      default:
        return Container();
    }
  }

  Widget _getIconWidget(String iconPath) {
    return const Center(
      child: SizedBox(
        height: AppSize.s100,
        width: AppSize.s100,
        child: CircularProgressIndicator(), // json image,
      ),
    );
  }

  Widget _getTitleWidget(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: AppSize.s20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _getMessageWidget(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Text(message,
            style: getMediumStyle(
                color: ColorManager.blackColor, fontSize: FontSize.s16)),
      ),
    );
  }

  Widget _getRetryButtonWidget(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: SizedBox(
          width: AppSize.s200,
          child: ElevatedButton(
            onPressed: () {
              if (stateRendrerType == StateRendrerType.fullScreenErrorState) {
                onRetryPressed.call(); //to call the API function again to retry
              } else {
                Navigator.of(context)
                    .pop(); //pop up state error to dismiss the dialog
              }
            },
            child: Text(
              buttonTitle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children);
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.r10),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: ColorManager.transparentColor,
      child: Container(
        height: AppSize.s300,
        width: AppSize.s200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.r10),
          shape: BoxShape.rectangle,
          color: ColorManager.surfaceColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: AppSize.r10,
              offset: Offset(AppSize.s0, AppSize.s14),
            ),
          ],
        ),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
