
import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/genericDialog.dart';

Future<bool?> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Delete',
    content: 'Are You Sure Wanna delete item?',
    optionBuilder: () => {
      'Cancel': false,
      'Yes': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
