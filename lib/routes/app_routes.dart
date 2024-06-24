import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:internshala_assignment/views/filter_view.dart';
import 'package:internshala_assignment/views/location_filter_view.dart';
import 'package:internshala_assignment/views/profile_filter_view.dart';
import 'package:internshala_assignment/views/search_internship_view.dart';
import 'package:internshala_assignment/views/splash_view.dart';

// final GoRouter router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (context, state) => SplashScreen(),
//     ),
//     routes:[

//     ]
//     GoRoute(
//       path: 'internship',
//       builder: (context, state) {
//         // final item = state.extra as ExampleModel;
//         return InternshipView();
//       },
//     ),
//     GoRoute(
//       path: 'filters',
//       builder: (context, state) {
//         // final item = state.extra as ExampleModel;
//         return FilterView();
//       },
//     ),
//     GoRoute(
//       path: 'filters/profile',
//       builder: (context, state) {
//         // final item = state.extra as ExampleModel;
//         return ProfileFilterView();
//       },
//     ),
//   ],
// );


/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'internship', // Note that you don't prefix the route with '/' since it will get it from its parent route
          builder: (BuildContext context, GoRouterState state) {
            return InternshipView();
          },
        ),
        GoRoute(
          path: 'filters', // Note that you don't prefix the route with '/' since it will get it from its parent route
          builder: (BuildContext context, GoRouterState state) {
            return FilterView();
          },
        ),
        GoRoute(
          path: 'profilefilter', // Note that you don't prefix the route with '/' since it will get it from its parent route
          builder: (BuildContext context, GoRouterState state) {
            return ProfileFilterView();
          },
        ),
        GoRoute(
          path: 'locationfilter', // Note that you don't prefix the route with '/' since it will get it from its parent route
          builder: (BuildContext context, GoRouterState state) {
            return LocationFilterView();
          },
        ),
      ],
    ),
  ],
);