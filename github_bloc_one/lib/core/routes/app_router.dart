import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:github_bloc_one/view/home/home_page.dart';
import 'package:github_bloc_one/view/login/login_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen|View,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/", page: LoginPage, initial: true),
    AutoRoute(path: 'home', page: HomePage),
  ],
)
//

class AppRouter extends _$AppRouter {}
