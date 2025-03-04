import 'package:hive/hive.dart';
import 'package:shoply/features/auth/data/datascources/Login_Datasource.dart';
import 'package:shoply/features/auth/domain/repositories/SignIn_Repository.dart';
import 'package:shoply/main.dart';

class SigninRepositoryIMPL implements SigninRepository {

  SigninDatasource datasource;

  SigninRepositoryIMPL({required this.datasource});

  @override
  Future<void> signIn({required String email, required String password}) async {
    if (await datasource.signIn(email: email, password: password)) {
      Hive.box('user').put('user', supabase.auth.currentUser);
    }
  }
}
