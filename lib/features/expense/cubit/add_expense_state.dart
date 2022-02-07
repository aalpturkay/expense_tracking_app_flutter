part of 'add_expense_cubit.dart';

@immutable
abstract class AddExpenseState {}

class AddExpenseInitial extends AddExpenseState {}

class AddExpenseLoading extends AddExpenseState {}

class AddExpenseLoaded extends AddExpenseState {}
