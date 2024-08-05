import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/login.dart';
import 'package:google_auth/welcomePage.dart';


class  MyAuthPage extends StatelessWidget {
  MyAuthPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          if (snapshot.hasData){
            return MyWelcomePage();
          }
          else{
            return MyLoginPage();
          }

        },
      ),

    );
  }
}
