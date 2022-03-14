import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/register.dart';

const String homePage = 'home';
const String registerPage = 'register';

Route <dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
      case registerPage:
        return MaterialPageRoute(builder: (context) => const RegisterPage());
    default:
      throw('this route name does not exist');
  }
}