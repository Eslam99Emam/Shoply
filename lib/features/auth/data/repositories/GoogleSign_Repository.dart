import 'package:shoply/features/auth/data/datascources/Google_Sign_datasource.dart';
import 'package:shoply/features/auth/domain/repositories/GoogleSign_Repository.dart';

class GoogleSignRepositoryIMPL implements GoogleSignRepository {
  @override
  Future<bool> signWithGoogle() async {
    return await GoogleSignDatasourceIMPL().signWithGoogle();
  }
}
