import 'package:shoply/features/auth/domain/repositories/Google_Sign_Repository.dart';

class GoogleSign {
  GoogleSignRepository repo;

  GoogleSign(this.repo);

  Future<bool> call() async {
    return await repo.signWithGoogle();
  }
}
