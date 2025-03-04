import 'package:shoply/features/auth/domain/repositories/Signup_Repository.dart';

class Signup {
  SignUpRepository repo;

  Signup(this.repo);

  Future<void> call(
      {required String name,
      required String email,
      required String password}) async {}
}
