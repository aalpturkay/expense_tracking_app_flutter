import 'package:expense_tracking_app/enums/expense_category_type.dart';

extension ExpenseCategoryTypeExt on ExpenseCategoryType {
  String get toReadable {
    switch (this) {
      case ExpenseCategoryType.food:
        return "Food";
      case ExpenseCategoryType.entertainment:
        return "Entertainment";
      case ExpenseCategoryType.pets:
        return "Pets";
      case ExpenseCategoryType.transport:
        return "Transport";
      case ExpenseCategoryType.bills:
        return "Bills";
      default:
        return "Income";
    }
  }
}
