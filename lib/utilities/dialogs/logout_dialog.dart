import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/genericDialog.dart';

Future<bool?> showLogoutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Log Out',
    content: 'Are You Sure Wanna Logout?',
    optionBuilder: () => {
      'Cancel': false,
      'Log Out': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
