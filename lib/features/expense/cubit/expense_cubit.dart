import 'package:bloc/bloc.dart';
import 'package:expense_tracking_app/features/expense/models/expense_model.dart';
import 'package:expense_tracking_app/features/expense/services/expense_service.dart';
import 'package:meta/meta.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  final ExpenseService expenseService;
  ExpenseCubit(this.expenseService) : super(ExpenseInitial());
  List<ExpenseModel?>? expenses;
  String? balance;
  getExpenses({String? description}) async {
    try {
      emit(ExpenseLoading());
      expenses = await expenseService.getExpenses(description: description);
      balance = await expenseService.getBalance();
      emit(ExpenseLoaded(data: expenses, balance: balance));
    } catch (e) {}
  }

  deleteExpenseById(String id) async {
    try {
      final response = await expenseService.deleteExpenseById(id);
      balance = await expenseService.getBalance();
      expenses?.removeWhere((element) => element?.id == id);
      emit(ExpenseLoaded(data: expenses, balance: balance));
    } catch (e) {}
  }
}
