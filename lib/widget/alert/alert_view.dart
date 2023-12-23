import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/presentation/navigation/navigation_routes.dart';

class AlertView {
  static show(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: () => context.go(NavigationRoutes.NEW_IDEA_ROUTE),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
