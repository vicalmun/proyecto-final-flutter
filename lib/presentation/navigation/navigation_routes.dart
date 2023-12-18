// ignore_for_file: constant_identifier_names

import 'package:go_router/go_router.dart';
import 'package:proyecto_final/presentation/view/idea/idea_detail_page.dart';
import 'package:proyecto_final/presentation/view/idea/ideas_list_page.dart';
import 'package:proyecto_final/presentation/view/idea/new_idea_page.dart';
import 'package:proyecto_final/presentation/view/splash/splash_page.dart';
import 'package:proyecto_final/presentation/view/user/login_page.dart';

class NavigationRoutes {
  // Routes
  static const String SPLASH_ROUTE = '/';
  static const String NEW_IDEA_ROUTE = '/home';
  static const String IDEAS_LIST_ROUTE = '$NEW_IDEA_ROUTE/$_IDEAS_LIST_PATH';
  static const String LOGIN_ROUTE = '$NEW_IDEA_ROUTE/$_LOGIN_PATH';
  static const String IDEA_DETAIL_ROUTE =
      '$NEW_IDEA_ROUTE/$IDEAS_LIST_ROUTE/$_IDEA_DETAIL_PATH';

  // Paths
  static const String _IDEA_DETAIL_PATH = 'detail';
  static const String _IDEAS_LIST_PATH = 'ideas';
  static const String _LOGIN_PATH = 'login';
}

// Implementacion de go router
final GoRouter router =
    GoRouter(initialLocation: NavigationRoutes.SPLASH_ROUTE, routes: [
  GoRoute(
    path: NavigationRoutes.SPLASH_ROUTE,
    builder: (context, state) => const SplashPage(),
  ),
  GoRoute(
    path: NavigationRoutes.NEW_IDEA_ROUTE, // /home
    builder: (context, state) => const NewIdeaPage(),
    routes: [
      GoRoute(
        path: NavigationRoutes._LOGIN_PATH, // /home/login
        builder: (context, state) => const UserLoginPage(),
      ),
      GoRoute(
        path: NavigationRoutes._IDEAS_LIST_PATH, // /home/ideas
        builder: (context, state) => const IdeasListPage(),
        routes: [
          GoRoute(
            path: NavigationRoutes._IDEA_DETAIL_PATH, // /home/ideas/detail
            builder: (context, state) => const IdeaDetailPage(),
          ),
        ],
      ),
    ],
  ),
]);


// La ruta del login va como hija de NEW_IDEA_ROUTE??