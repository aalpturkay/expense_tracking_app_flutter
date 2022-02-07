import 'package:dio/dio.dart';
import 'package:expense_tracking_app/features/expense/models/create_expense_response_model.dart';
import 'package:expense_tracking_app/features/expense/models/expense_model.dart';

abstract class IExpenseService {
  final Dio dio;

  IExpenseService(this.dio);

  Future<CreateExpenseResponseModel?> createExpense(ExpenseModel expenseModel);
  Future<List<ExpenseModel?>?> getExpenses({String? description});
  Future<String?> getBalance();
  Future<void> deleteExpenseById(String id);
}
