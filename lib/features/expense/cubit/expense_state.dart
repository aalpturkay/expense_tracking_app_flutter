part of 'expense_cubit.dart';

@immutable
abstract class ExpenseState extends Equatable {}

class ExpenseInitial extends ExpenseState {
  @override
  List<Object?> get props => [];
}

class ExpenseLoading extends ExpenseState {
  @override
  List<Object?> get props => [];
}

class ExpenseLoaded extends ExpenseState {
  final List<ExpenseModel?>? data;
  final String? balance;

  ExpenseLoaded({this.data, this.balance});

  @override
  List<Object?> get props => [data, balance];
}

class ExpenseError extends ExpenseState {
  final String? errorMessage;

  ExpenseError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
