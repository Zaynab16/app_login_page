import 'package:flutter/material.dart';

class Snackbar {
  void showSnack(
    String message,
    GlobalKey<ScaffoldState> scaffoldKey,
    VoidCallback undo,
  ) {
    final scaffoldContext = scaffoldKey.currentContext;
    if (scaffoldContext != null) {
      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
        SnackBar(
          content: Text(message),
          action: undo != null
              ? SnackBarAction(
                  textColor: Theme.of(scaffoldContext).primaryColor,
                  label: "Undo",
                  onPressed: undo,
                )
              : null,
        ),
      );
    }
  }
}
