part of 'add_expense_cubit.dart';

@immutable
abstract class AddExpenseState extends Equatable {}

class AddExpenseInitial extends AddExpenseState {
  @override
  List<Object?> get props => [];
}

class AddExpenseLoading extends AddExpenseState {
  @override
  List<Object?> get props => [];
}

class AddExpenseLoaded extends AddExpenseState {
  @override
  List<Object?> get props => [];
}
