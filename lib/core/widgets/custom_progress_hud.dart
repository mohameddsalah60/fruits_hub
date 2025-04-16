import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';

import 'custom_alert_dialog.dart';

class CustomProgressHud extends StatelessWidget {
  const CustomProgressHud(
      {super.key, required this.isLoading, required this.child});
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CustomAlertDialog(
        text: "جاري التحميل ...",
        isLoading: true,
      ),
      inAsyncCall: isLoading,
      child: child,
    );
  }
}
