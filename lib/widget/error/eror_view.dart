import 'package:flutter/material.dart';

class ErrorView {
  static show(BuildContext context, String message, Function onRetry,
      {Function? onCancel}) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          icon: const Icon(Icons.error_outline),
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                if (onCancel != null) {
                  onCancel.call();
                }
                Navigator.of(dialogContext).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                onRetry.call();
                Navigator.of(dialogContext).pop();
              },
              child: const Text("Retry"),
            )
          ],
        );
      },
    );
  }
}
