import 'package:flutter/material.dart';
import 'package:netify/persentation/common/state_rendrer/state_rendrer.dart';
import 'package:netify/persentation/resources/strings_manager.dart';

abstract class FlowState {
  StateRendrerType getStateRendrerType();
  String getMessage();
  String getTitle() => "";
}

// Loading State (Popuo, Full Screen)

class LoadingState extends FlowState {
  StateRendrerType stateRendrerType;
  String message;

  LoadingState({required this.stateRendrerType, String? message})
      : message = message ?? AppString.loading;

  @override
  StateRendrerType getStateRendrerType() => stateRendrerType;

  @override
  String getMessage() => message;
}

// Error State (Popuo, Full Loading)

class ErrorState extends FlowState {
  StateRendrerType stateRendrerType;
  String message;

  ErrorState({required this.stateRendrerType, required this.message});

  @override
  StateRendrerType getStateRendrerType() => stateRendrerType;

  @override
  String getMessage() => message;
}
// Content State (Content Screen, Empty Screen)

class ContentState extends FlowState {
  ContentState();

  @override
  StateRendrerType getStateRendrerType() => StateRendrerType.contentScreenState;

  @override
  String getMessage() => "";
}

class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);

  @override
  StateRendrerType getStateRendrerType() => StateRendrerType.emptyScreenState;

  @override
  String getMessage() => message;
}

class SuccessState extends FlowState {
  StateRendrerType stateRendrerType;
  String message;
  String? title;
  Function? actionFunctionName;

  SuccessState(
      {required this.stateRendrerType, required this.message, String? title}) {
    this.title = title ?? AppString.successFlowStateTitle;
    actionFunctionName = actionFunctionName ?? () {};
  }

  @override
  StateRendrerType getStateRendrerType() => stateRendrerType;

  @override
  String getMessage() => message;

  @override
  String getTitle() => title!;

  Function getActionFunctionName() => actionFunctionName!;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendrerType() == StateRendrerType.popupLoadingState) {
            showPopUp(context, getStateRendrerType(), getMessage(), getTitle(),
                () {});
            return contentScreenWidget;
          } else {
            return StateRendrer(
              stateRendrerType: getStateRendrerType(),
              message: getMessage(),
              onRetryPressed: retryActionFunction,
            );
          }
        }
      case ErrorState:
        {
          dismissDialog(context);
          if (getStateRendrerType() == StateRendrerType.popupErrorState) {
            showPopUp(context, getStateRendrerType(), getMessage(), getTitle(),
                () {});
            return contentScreenWidget;
          } else {
            return StateRendrer(
              stateRendrerType: getStateRendrerType(),
              message: getMessage(),
              onRetryPressed: retryActionFunction,
            );
          }
        }
      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRendrer(
            stateRendrerType: getStateRendrerType(),
            message: getMessage(),
            onRetryPressed: retryActionFunction,
          );
        }
      case SuccessState:
        {
          dismissDialog(context);
          if (getStateRendrerType() == StateRendrerType.popupSuccessState) {
            showPopUp(context, getStateRendrerType(), getMessage(), getTitle(),
                () {});
            return contentScreenWidget;
          } else {
            return StateRendrer(
              stateRendrerType: getStateRendrerType(),
              message: getMessage(),
              onRetryPressed: retryActionFunction,
            );
          }
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  bool _isThereCurrentDialogShowing(BuildContext context) {
    return ModalRoute.of(context)?.isCurrent != true;
  }

  showPopUp(BuildContext context, StateRendrerType stateRendrerType,
      String message, String? title, Function? action) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRendrer(
              stateRendrerType: stateRendrerType,
              message: message,
              title: title,
              onRetryPressed: action ?? () {},
            )));
  }
}
