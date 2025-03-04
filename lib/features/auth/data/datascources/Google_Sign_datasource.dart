import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoply/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class GoogleSignDatasource {
  Future<bool> signWithGoogle();
}

class GoogleSignDatasourceIMPL implements GoogleSignDatasource {
  @override
  Future<bool> signWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '436767965641-7g3090qqo0fg29qo4lkk6mbojobf5u2q.apps.googleusercontent.com',
    );

    googleSignIn.signOut();
    log("signed out");

    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      log("no user");
      return false;
    }

    log("signed in");

    final googleAuth = await googleUser.authentication;

    log("Authentication successful");

    final accessToken = googleAuth.accessToken;

    if (accessToken == null) {
      log(googleAuth.accessToken.toString());
      log("Access token is null");
      return false;
    }

    log("Access token retrieved: $accessToken");

    final idToken = googleAuth.idToken;

    if (idToken == null) {
      log(googleAuth.idToken.toString());
      log("ID token is null");
      return false;
    }

    log("ID token retrieved: $idToken");

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    log("Signed in with ID token");

    return supabase.auth.currentUser != null;
  }
}
