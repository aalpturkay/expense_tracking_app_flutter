import 'package:expense_tracking_app/enums/expense_category_type.dart';
import 'package:expense_tracking_app/extensions/expense_category_type_extension.dart';

extension ExpenseCategoryExt on String {
  String get toCategoryFormat {
    switch (this) {
      case "FOOD":
        return ExpenseCategoryType.food.toReadable;
      case "ENTERTAINMENT":
        return ExpenseCategoryType.entertainment.toReadable;
      case "BILLS":
        return ExpenseCategoryType.bills.toReadable;
      case "TRANSPORT":
        return ExpenseCategoryType.transport.toReadable;
      case "PETS":
        return ExpenseCategoryType.pets.toReadable;
      case "INCOME":
        return ExpenseCategoryType.income.toReadable;
      default:
        return this;
    }
  }
}
