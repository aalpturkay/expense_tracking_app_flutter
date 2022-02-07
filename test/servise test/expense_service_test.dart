import 'package:expense_tracking_app/enums/expense_category_type.dart';
import 'package:expense_tracking_app/extensions/expense_category_type_extension.dart';
import 'package:expense_tracking_app/features/expense/models/expense_model.dart';
import 'package:expense_tracking_app/features/expense/services/expense_service.dart';
import 'package:expense_tracking_app/utils/dio_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ExpenseService service;

  generateService() {
    service = ExpenseService(DioUtil.createDioInstance());
  }

  group('Expense Service Tests', () {
    setUp(() => generateService());
    test(
      'Create Expense Test',
      () async {
        final response = await service.createExpense(
          ExpenseModel(
            description: "Salary",
            category: ExpenseCategoryType.income.toReadable.toUpperCase(),
            paid: "4444",
          ),
        );

        expect(response?.category, "INCOME");
      },
    );

    test('Get Expenses Test', () async {
      final response = await service.getExpenses();
      expect(response.runtimeType, List<ExpenseModel>);
    });

    test('Delete Expense By Id Test', () async {
      final response = await service
          .deleteExpenseById("47f6c51f-1f14-49b2-90fb-b2d23f6f4fb6");
    });
  });
}
