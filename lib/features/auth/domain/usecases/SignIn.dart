import 'package:shoply/features/auth/domain/repositories/SignIn_Repository.dart';

class Signin {
  SigninRepository repo;

  Signin(this.repo);

  Future<void> call({required String email, required String password}) async {}
}
