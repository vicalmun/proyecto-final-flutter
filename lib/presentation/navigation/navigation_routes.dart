// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_final/model/idea/idea.dart';
import 'package:proyecto_final/presentation/view/idea/idea_detail_page.dart';
import 'package:proyecto_final/presentation/view/idea/ideas_list_page.dart';
import 'package:proyecto_final/presentation/view/idea/new_idea_page.dart';
import 'package:proyecto_final/presentation/view/settings/settings_page.dart';
import 'package:proyecto_final/presentation/view/splash/splash_page.dart';
import 'package:proyecto_final/presentation/view/user/login_page.dart';

class NavigationRoutes {
  // Routes
  static const String SPLASH_ROUTE = '/';
  static const String NEW_IDEA_ROUTE = '/home';
  static const String IDEAS_LIST_ROUTE = '$NEW_IDEA_ROUTE/$_IDEAS_LIST_PATH';
  static const String LOGIN_ROUTE = '$NEW_IDEA_ROUTE/$_LOGIN_PATH';
  static const String IDEA_DETAIL_ROUTE =
      '$IDEAS_LIST_ROUTE/$_IDEA_DETAIL_PATH';
  static const String IDEA_DETAIL_FROM_HOME =
      '$NEW_IDEA_ROUTE/$_IDEA_DETAIL_PATH';
  static const String SETTINGS_ROUTE = '$NEW_IDEA_ROUTE/$_SETTINGS_PATH';

  // Paths
  static const String _IDEA_DETAIL_PATH = 'detail';
  static const String _IDEAS_LIST_PATH = 'ideas';
  static const String _LOGIN_PATH = 'login';
  static const String _SETTINGS_PATH = 'settings';
}

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

// Implementacion de go router
final GoRouter router = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: NavigationRoutes.SPLASH_ROUTE,
    routes: [
      GoRoute(
        path: NavigationRoutes.SPLASH_ROUTE,
        parentNavigatorKey: _navigatorKey,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: NavigationRoutes.NEW_IDEA_ROUTE, // /home
        parentNavigatorKey: _navigatorKey,
        builder: (context, state) => const NewIdeaPage(),
        routes: [
          GoRoute(
              path: NavigationRoutes._SETTINGS_PATH, // /home/login
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SettingsPage())),
          GoRoute(
              path: NavigationRoutes._LOGIN_PATH, // /home/login
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: UserLoginPage())),
          GoRoute(
              path: NavigationRoutes._IDEA_DETAIL_PATH,
              builder: (context, state) => IdeaDetailPage(
                    idea: state.extra as Idea,
                  )),
          GoRoute(
            path: NavigationRoutes._IDEAS_LIST_PATH, // /home/ideas
            builder: (context, state) => const IdeasListPage(),
            routes: [
              GoRoute(
                path: NavigationRoutes._IDEA_DETAIL_PATH, // /home/ideas/detail
                builder: (context, state) => IdeaDetailPage(
                  idea: state.extra as Idea,
                ),
              ),
            ],
          ),
        ],
      ),
    ]);


// La ruta del login va como hija de NEW_IDEA_ROUTE??