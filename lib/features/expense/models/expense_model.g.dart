// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) => ExpenseModel(
      description: json['description'] as String,
      category: json['category'] as String,
      paid: json['paid'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ExpenseModelToJson(ExpenseModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'category': instance.category,
      'paid': instance.paid,
      'id': instance.id,
    };
