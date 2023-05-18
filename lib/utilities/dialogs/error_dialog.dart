import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/genericDialog.dart';

Future<void> showErrorDialog(BuildContext context, String text) {
  return showGenericDialog<void>(
    context: context,
    title: 'an Error Occurred',
    content: text,
    optionBuilder: ()=>{
      'OK':null,
    },
  );
}
