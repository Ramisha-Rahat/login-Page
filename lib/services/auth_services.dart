import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{

  //google sign in
  signInWithGoogle() async {
    //interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtaining detail
    final GoogleSignInAuthentication gAuth= await gUser!.authentication;

    //creating credentials
    final credential= GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    //user sign in wrapped up
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

}