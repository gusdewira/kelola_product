import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../moduls/dashboard/dashboard_view.dart';
import 'paths.dart';

final GoRouter router = GoRouter(
  initialLocation: Paths.home,
  routes: <RouteBase>[
    GoRoute(
        path: Paths.home,
        builder: (BuildContext context, GoRouterState state) =>
            const DashboardView())
  ],
);