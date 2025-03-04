import 'package:riverpod/riverpod.dart';
import 'package:shoply/features/auth/data/datascources/Google_Sign_Datasource.dart';
import 'package:shoply/features/auth/data/repositories/Google_Sign_Repository.dart';
import 'package:shoply/features/auth/domain/usecases/Google_Sign.dart';

final googleSignProvider = Provider((ref) => GoogleSignDatasourceIMPL());

final googleSignRepositoryProvider =
    Provider((ref) => GoogleSignRepositoryIMPL(ref.read(googleSignProvider)));

final googleSignUseCaseProvider =
    Provider((ref) => GoogleSign(ref.read(googleSignRepositoryProvider)));

