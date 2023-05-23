import 'package:flutter/widgets.dart';
import 'package:premium_todo/modules/app/app.dart';
import 'package:premium_todo/modules/home/home.dart';
import 'package:premium_todo/modules/login/view/login_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}

class AppRoutes {
  static const LOGIN_PAGE = '/login_page';
  static const SIGNUP_PAGE = '/signup_page';
  static const HOME_PAGE = '/home_page';
}
