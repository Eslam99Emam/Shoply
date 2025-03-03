
abstract class SigninRepository {
  Future<void> signIn({required String email, required String password});
}