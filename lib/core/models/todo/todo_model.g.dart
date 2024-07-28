// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      userId: json['userId'] as String,
      todoId: json['todoId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      isCompleted: json['isCompleted'] as bool,
      creationDate: DateTime.parse(json['creationDate'] as String),
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'todoId': instance.todoId,
      'title': instance.title,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'creationDate': instance.creationDate.toIso8601String(),
    };
