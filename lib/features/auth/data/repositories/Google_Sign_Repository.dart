import 'package:shoply/features/auth/data/datascources/Google_Sign_Datasource.dart';
import 'package:shoply/features/auth/domain/repositories/Google_Sign_Repository.dart';

class GoogleSignRepositoryIMPL implements GoogleSignRepository {
  GoogleSignDatasource googleSignDatasource;

  GoogleSignRepositoryIMPL(this.googleSignDatasource);

  @override
  Future<bool> signWithGoogle() async {
    return await googleSignDatasource.signWithGoogle();
  }
}
