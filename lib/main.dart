import 'package:expense_tracking_app/features/auth/cubit/auth_cubit.dart';
import 'package:expense_tracking_app/features/auth/pages/register_page.dart';
import 'package:expense_tracking_app/features/auth/services/auth_service.dart';
import 'package:expense_tracking_app/features/expense/cubit/add_expense_cubit.dart';
import 'package:expense_tracking_app/features/expense/cubit/expense_cubit.dart';
import 'package:expense_tracking_app/features/expense/pages/add_expense_page.dart';
import 'package:expense_tracking_app/features/expense/pages/expense_page.dart';
import 'package:expense_tracking_app/features/expense/services/expense_service.dart';
import 'package:expense_tracking_app/utils/dio_util.dart';
import 'package:expense_tracking_app/utils/route_generator.dart';
import 'package:expense_tracking_app/utils/token_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/pages/login_page.dart';

late bool isTokenEmpty;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isTokenEmpty = await TokenUtil.isAccessTokenEmpty();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(
            AuthService(
              DioUtil.createDioInstance(),
            ),
          ),
          child: const RegisterPage(),
        ),
        BlocProvider(
          create: (_) => AuthCubit(
            AuthService(
              DioUtil.createDioInstance(),
            ),
          ),
          child: LoginPage(),
        ),
        BlocProvider(
          create: (_) => ExpenseCubit(
            ExpenseService(
              DioUtil.createDioInstance(),
            ),
          ),
          child: const ExpensePage(),
        ),
        BlocProvider(
          create: (_) => AddExpenseCubit(
            ExpenseService(
              DioUtil.createDioInstance(),
            ),
          ),
          child: const AddExpensePage(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracking App',
      initialRoute: isTokenEmpty ? '/registerPage' : '/expensePage',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline3: TextStyle(fontSize: 40),
          headline4: TextStyle(fontSize: 30),
          headline6: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
