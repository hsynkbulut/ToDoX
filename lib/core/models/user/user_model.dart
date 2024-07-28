import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime creationDate;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.creationDate,
  });

  String get fullName => '$firstName $lastName';

  // Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  // Static function to create an empty user model.
  static UserModel empty() => UserModel(
        userId: '',
        firstName: '',
        lastName: '',
        email: '',
        creationDate: DateTime.now(),
      );

  // JSON'dan UserModel nesnesi oluşturmak için factory constructor
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // UserModel nesnesini JSON'a dönüştürmek için toJson metodu
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
