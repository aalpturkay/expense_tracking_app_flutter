import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:expense_tracking_app/constants/path_constants.dart';
import 'package:expense_tracking_app/enums/expense_category_type.dart';
import 'package:expense_tracking_app/exeptions/custom_exeptions.dart';
import 'package:expense_tracking_app/features/expense/models/expense_model.dart';
import 'package:expense_tracking_app/features/expense/models/create_expense_response_model.dart';
import 'package:expense_tracking_app/features/expense/services/IExpenseService.dart';

class ExpenseService extends IExpenseService {
  ExpenseService(Dio dio) : super(dio);

  @override
  Future<CreateExpenseResponseModel?> createExpense(
      ExpenseModel expenseModel) async {
    CreateExpenseResponseModel? responseData;

    try {
      final response =
          await dio.post(PathConstants.expenseUrl, data: expenseModel.toJson());

      responseData = CreateExpenseResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      throw InternalServerErrorExeption("Something went wrong.");
    }

    return responseData;
  }

  @override
  Future<List<ExpenseModel?>?> getExpenses({String? description}) async {
    List<ExpenseModel?>? responseData;

    try {
      final response = await dio.get(
        PathConstants.expenseUrl,
        queryParameters: description != null
            ? {
                "description": description,
              }
            : null,
      );
      // print(response);
      responseData =
          (response.data as List).map((e) => ExpenseModel.fromJson(e)).toList();
    } on DioError catch (e) {
      throw InternalServerErrorExeption("Something went wrong.");
    }

    return responseData;
  }

  @override
  Future<void> deleteExpenseById(String id) async {
    try {
      final response = await dio.delete("${PathConstants.expenseUrl}/$id");
    } catch (e) {}
  }

  @override
  Future<String?> getBalance() async {
    String? balance;
    try {
      final response = await dio.get(PathConstants.balanceUrl);
      balance = response.data;
    } catch (e) {}
    return balance;
  }
}
