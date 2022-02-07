// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_expense_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateExpenseResponseModel _$CreateExpenseResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateExpenseResponseModel(
      description: json['description'] as String?,
      category: json['category'] as String?,
      paid: json['paid'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CreateExpenseResponseModelToJson(
        CreateExpenseResponseModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'category': instance.category,
      'paid': instance.paid,
      'id': instance.id,
    };
