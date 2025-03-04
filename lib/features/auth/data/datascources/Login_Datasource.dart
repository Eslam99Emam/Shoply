import 'dart:developer';

import 'package:shoply/main.dart';

abstract class SigninDatasource {
  Future<bool> signIn({required String email, required String password});
}

class SigninDatasourceIMPL implements SigninDatasource {
  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return supabase.auth.currentUser != null;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
