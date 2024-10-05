import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_alert_dialog.dart';

void customSnackBar(BuildContext context, {required String text}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomAlertDialog(
        text: text,
      );
    },
  );

  Future.delayed(const Duration(seconds: 2), () {
    if (context.mounted) {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    }
  });
}
