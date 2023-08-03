import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign in',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome to Pantry Planner! Please sign in to continue.',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    color: Colors.grey, // Set the color here
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Implement registration functionality
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // TODO: Implement forgot password functionality
                },
                child: const Text('Forgot password?'),
              ),
            ),
            const SizedBox(height: 20),
            SignInButtonBuilder(
              text: 'Sign in with Email',
              icon: Icons.email,
              onPressed: () async {
                //TODO: Implement sign in with email functionality
              },
              backgroundColor: Colors.blueGrey.shade700,
            ),
            const SizedBox(height: 20),
            const Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    height: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "OR",
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await signInWithGoogle();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.fromLTRB(12, 12, 12, 12),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.asset(
                    'assets/images/g-logo.png', // Replace with the path to your Google logo
                    height: 25.0,
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                            fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20),
            // SignInButton(
            //   Buttons.apple,
            //   onPressed: () async {
            //     await signInWithApple();
            //   },
            // ),
            ElevatedButton(
              onPressed: () async {
                await signInWithApple();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.fromLTRB(12, 12, 12, 12),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.apple,
                    size: 25.0,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Sign in with Apple',
                        style: TextStyle(
                            fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await signInAnonymously();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.fromLTRB(12, 12, 12, 12),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.person, // Use the person icon
                    size: 25.0,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Sign in Anonymously',
                        style: TextStyle(
                            fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'By signing in, you agree to our terms and conditions',
                style: TextStyle(fontSize: 16, color: Colors.grey),
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

  Future<UserCredential> signInAnonymously() async {
    try {
      return await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
      rethrow; // Throw the exception after handling it
    }
  }
}
