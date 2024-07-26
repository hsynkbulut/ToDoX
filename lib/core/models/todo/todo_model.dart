import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  final String userId;
  final String todoId;
  final String title;
  final String description;
  final bool isCompleted;

  TodoModel({
    required this.userId,
    required this.todoId,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  // JSON'dan TodoModel nesnesi oluşturmak için factory constructor
  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  // TodoModel nesnesini JSON'a dönüştürmek için toJson metodu
  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
