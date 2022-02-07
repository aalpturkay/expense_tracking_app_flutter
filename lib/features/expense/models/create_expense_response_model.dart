import 'package:json_annotation/json_annotation.dart';

part 'create_expense_response_model.g.dart';

@JsonSerializable()
class CreateExpenseResponseModel {
  final String? description;
  final String? category;
  final String? paid;
  final String? id;

  CreateExpenseResponseModel({
    this.description,
    this.category,
    this.paid,
    this.id,
  });

  factory CreateExpenseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateExpenseResponseModelToJson(this);
}
