import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProvider extends StateNotifier<User?> {
  User? user = Hive.box('user').get('user');

  UserProvider([super.user]) : super();
}

final user =
    StateNotifierProvider<UserProvider, User?>((ref) => UserProvider());
