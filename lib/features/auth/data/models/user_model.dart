import 'package:shoply/features/auth/domain/entities/user_entity.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.createdAt,
    required super.userData,
    required super.appData,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    UserModel userModel = UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      createdAt: json['created_at'],
      userData: json['user_data'],
      appData: json['app_data'],
    );

    return userModel;
  }
}
