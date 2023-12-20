import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:proyecto_final/presentation/navigation/navigation_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset(
        'assets/lottie/lightbulb.json',
        repeat: true,
        animate: true,
        width: 200,
      )),
    );
  }

  _navigateToNextPage() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    if (mounted) {
      context.push(NavigationRoutes.NEW_IDEA_ROUTE);
    }
  }
}
