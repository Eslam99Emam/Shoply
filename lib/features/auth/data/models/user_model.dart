import 'package:shoply/core/entities/user_entity.dart';
import 'package:supabase/supabase.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.createdAt,
    required super.userData,
    required super.appData,
  });

  factory UserModel.fromSupabaseUser(User user) {
    UserModel userModel = UserModel(
      id: user.id,
      name: user.userMetadata!['name'],
      email: user.email!,
      createdAt: user.createdAt,
      userData: user.userMetadata!,
      appData: user.appMetadata,
    );

    return userModel;
  }
}
