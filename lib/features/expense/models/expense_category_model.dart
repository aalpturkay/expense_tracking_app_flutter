import 'package:expense_tracking_app/enums/expense_category_type.dart';

class ExpenseCategoryModel {
  final String imagePath;
  final ExpenseCategoryType categoryType;

  ExpenseCategoryModel({
    required this.imagePath,
    required this.categoryType,
  });
}
