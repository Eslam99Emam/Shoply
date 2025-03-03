import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoply/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class GoogleSignDatasource {
  Future<bool> signWithGoogle();
}

class GoogleSignDatasourceIMPL implements GoogleSignDatasource {
  @override
  Future<bool> signWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return false;
    }

    final googleAuth = await googleUser.authentication;

    final accessToken = googleAuth.accessToken;

    if (accessToken == null) {
      return false;
    }

    final idToken = googleAuth.idToken;

    if (idToken == null) {
      return false;
    }

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    return supabase.auth.currentUser != null;
  }
}
