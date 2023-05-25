import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/genericDialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Password Reset',
    content: "we've sent you an email link",
    optionBuilder: () => {
      'OK': null,
    },
  );
}
