import 'dart:async';

import 'package:flutter/material.dart';

class DialogService {
  late Completer<DialogResponse> _dialogCompleter;

  Future<DialogResponse> showDialogOnScreen(
      BuildContext context, DialogRequest request) {
    _dialogCompleter = Completer<DialogResponse>();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return _buildDialog(request, dialogContext);
      },
    );

    return _dialogCompleter.future;
  }

  Widget _buildDialog(DialogRequest request, BuildContext dialogContext) {
    switch (request.dialogType) {
      case DialogType.loading:
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(request.title),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(request.description),
                ),
              ],
            ),
          ),
        );
      case DialogType.error:
        return AlertDialog(
          title: Text(request.title),
          content: Text(request.description),
          actions: <Widget>[
            ElevatedButton(
              child: Text(request.buttonText),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _dialogCompleter.complete(DialogResponse());
              },
            ),
          ],
        );
      case DialogType.info:
      default:
        return AlertDialog(
          title: Text(request.title),
          content: Text(request.description),
          actions: <Widget>[
            ElevatedButton(
              child: Text(request.buttonText),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _dialogCompleter.complete(DialogResponse());
              },
            ),
          ],
        );
    }
  }

  void dialogComplete() {
    _dialogCompleter.complete(DialogResponse());
  }
}

class DialogResponse {}

class DialogRequest {
  final String title;
  final String description;
  final String buttonText;
  final DialogType dialogType;

  DialogRequest({
    required this.title,
    required this.description,
    this.buttonText = 'Ok',
    this.dialogType = DialogType.info,
  });
}

enum DialogType {
  info,
  loading,
  error,
}
