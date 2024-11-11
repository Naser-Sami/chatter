import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';

class THelperFunctions {
  THelperFunctions._();

  static void showToastBar(BuildContext context, Widget title,
      {int? duration, Widget? subtitle, Widget? leading, Color? color, Color? shadowColor, Widget? trailing, dynamic Function()? onTap}) {
    DelightToastBar(
      autoDismiss: true,
      snackbarDuration: Duration(milliseconds: duration ?? 5000),
      builder: (context) => ToastCard(
        title: title,
        subtitle: subtitle,
        leading: leading,
        color: color ?? Theme.of(context).colorScheme.primaryContainer,
        shadowColor: shadowColor,
        trailing: trailing,
        onTap: onTap,
      ),
    ).show(context);
  }

  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
