import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome to Pantry Planner! Please sign in to continue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // TODO: Implement forgot password functionality
              },
              child: const Text('Forgot password?'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await signInWithGoogle();
              },
              child: const Text('Sign in'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // TODO: Implement registration functionality
              },
              child: const Text("Don't have an account? Register"),
            ),
            const SizedBox(height: 20),
            const Text(
              'By signing in, you agree to our terms and conditions',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    if (kIsWeb) {
      return await _auth.signInWithPopup(appleProvider);
    } else {
      return await _auth.signInWithProvider(appleProvider);
    }
  }
}
