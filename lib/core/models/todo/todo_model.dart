import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  final String userId;
  final String todoId;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime creationDate;

  TodoModel({
    required this.userId,
    required this.todoId,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.creationDate,
  });

  TodoModel copyWith({
    String? userId,
    String? todoId,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? creationDate,
  }) {
    return TodoModel(
      userId: userId ?? this.userId,
      todoId: todoId ?? this.todoId,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  // JSON'dan TodoModel nesnesi oluşturmak için factory constructor
  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  // TodoModel nesnesini JSON'a dönüştürmek için toJson metodu
  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
