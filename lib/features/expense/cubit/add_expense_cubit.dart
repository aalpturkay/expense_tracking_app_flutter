import 'package:bloc/bloc.dart';
import 'package:expense_tracking_app/enums/expense_category_type.dart';
import 'package:expense_tracking_app/features/expense/models/expense_category_model.dart';
import 'package:expense_tracking_app/features/expense/models/expense_model.dart';
import 'package:expense_tracking_app/features/expense/services/expense_service.dart';
import 'package:meta/meta.dart';

part 'add_expense_state.dart';

class AddExpenseCubit extends Cubit<AddExpenseState> {
  final ExpenseService expenseService;

  List<ExpenseCategoryModel> expenseCategories = ExpenseCategoryType.values
      .map(
        (cateType) => ExpenseCategoryModel(
          imagePath: "assets/images/${cateType.name}.png",
          categoryType: cateType,
        ),
      )
      .toList();

  AddExpenseCubit(this.expenseService) : super(AddExpenseInitial());

  createExpense({
    required String description,
    required String paid,
    required String category,
  }) async {
    try {
      // print("$description $paid $category");
      emit(AddExpenseLoading());

      final response = await expenseService.createExpense(
        ExpenseModel(
          description: description.trim(),
          category: category,
          paid: paid.trim(),
        ),
      );
      emit(AddExpenseLoaded());
    } catch (e) {}
  }
}
