part of 'expense_cubit.dart';

@immutable
abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  final List<ExpenseModel?>? data;
  final String? balance;

  ExpenseLoaded({this.data, this.balance});
}

class ExpenseError extends ExpenseState {
  final String? errorMessage;

  ExpenseError({this.errorMessage});
}
