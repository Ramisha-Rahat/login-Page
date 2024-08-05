// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
//
// class  MyWelcomePage extends StatelessWidget {
//
//   MyWelcomePage({super.key});
//
//   void sigout() {
//     FirebaseAuth.instance.signOut();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: sigout,
//               icon: Icon(Icons.logout),
//           )
//         ],
//       ),
//
//       body:
//         Center(
//           child: Text('Welcome! Logged in')
//         )
//     );
//   }
//
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/login.dart';

class MyWelcomePage extends StatelessWidget {
  MyWelcomePage({super.key});

  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyLoginPage()), // Ensure you have a LoginPage defined
    );
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? photoUrl = user?.photoURL; // Get the user's profile picture URL
    final String? displayName = user?.displayName; // Get the user's display name

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => signOut(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (photoUrl != null) // Display profile picture if available
              CircleAvatar(
                backgroundImage: NetworkImage(photoUrl),
                radius: 40,
              ),
            SizedBox(height: 20),
            Text('Welcome! Logged in as ${displayName ?? 'User'}'), // Display user's name or 'User' if null
          ],
        ),
      ),
    );
  }
}
