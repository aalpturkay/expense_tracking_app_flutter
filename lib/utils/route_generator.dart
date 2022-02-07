import 'package:expense_tracking_app/constants/route_constants.dart';
import 'package:expense_tracking_app/features/auth/pages/login_page.dart';
import 'package:expense_tracking_app/features/auth/pages/register_page.dart';
import 'package:expense_tracking_app/features/expense/pages/add_expense_page.dart';
import 'package:expense_tracking_app/features/expense/pages/expense_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteConstants.registerPageRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        );
      case RouteConstants.loginPageRoute:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case RouteConstants.expensePageRoute:
        return MaterialPageRoute(
          builder: (context) => const ExpensePage(),
        );
      case RouteConstants.addExpensePageRoute:
        return MaterialPageRoute(
          builder: (context) => const AddExpensePage(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
