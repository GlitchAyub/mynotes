import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/genericDialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Sharing',
    content: 'You Cannot Share Empty File!',
    optionBuilder: ()=>{
      'OK':null,
    },
  );
}
