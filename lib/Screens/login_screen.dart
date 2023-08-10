import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pantry_app/Widgets/password_form_field.dart';
import 'package:pantry_app/Widgets/provider_button.dart';
import 'package:pantry_app/Widgets/svg_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    double dpr = MediaQuery.of(context).devicePixelRatio;
    double screenWidthInPx = MediaQuery.of(context).size.width * dpr;
    double edgePadding = 10 + ((screenWidthInPx - 320) / (1440 - 320)) * 30;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(edgePadding),
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/logo.png'),
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 10),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.grey, // Set the color here
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 20),
              PasswordFormField(controller: passwordController, labelText: 'Password'),
              const SizedBox(height: 20),
              Row(
                children: [
                  if (errorMessage.isNotEmpty)
                    Expanded(
                      child: Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  if (errorMessage.isEmpty) const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: const Text('Forgot password?'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ProviderButton(
                onPressed: () async {
                  await signInWithEmail();
                },
                text: 'Sign in',
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
              ProviderButton(
                onPressed: () async {
                  await signInWithGoogle();
                },
                text: 'Sign in with Google',
                fontFamily: 'Roboto',
                icon: const SvgIcon(
                  asset: 'assets/icons/google.svg',
                  useOriginalColors: true,
                ),
                buttonColor: Colors.white,
                onButtonColor: Colors.black,
                buttonColorDark: const Color(0xFF4285F4),
                onButtonColorDark: Colors.white,
              ),
              const SizedBox(height: 10),
              ProviderButton(
                onPressed: () async {
                  await signInWithApple();
                },
                text: 'Sign in with Apple',
                icon: const SvgIcon(
                  asset: 'assets/icons/apple.svg',
                ),
                buttonColor: Colors.black,
                onButtonColor: Colors.white,
                buttonColorDark: Colors.white,
                onButtonColorDark: Colors.black,
              ),
              const SizedBox(height: 10),
              ProviderButton(
                onPressed: () async {
                  await signInAnonymously();
                },
                text: 'Sign in Anonymously',
                icon: const SvgIcon(
                  asset: 'assets/icons/anonymous.svg',
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text(
                      'By signing in, you agree to the',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/terms');
                      },
                      child: const Text('terms and conditions'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // If the sign-in was cancelled, throw an error
      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign-in aborted by user',
        );
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      setState(() {
        switch (e.code) {
          case "account-exists-with-different-credential":
            errorMessage = "The account already exists with a different credential.";
            break;
          case "invalid-credential":
            errorMessage = "Error occurred while accessing credentials. Try again.";
            break;
          case "operation-not-allowed":
            errorMessage = "Error occurred while accessing credentials. Try again.";
            break;
          case "user-disabled":
            errorMessage = "Your account has been disabled. Please contact support.";
            break;
          case "user-not-found":
            errorMessage = "User not found. Please register.";
            break;
          case "invalid-user-token":
            errorMessage = "Error occurred while accessing credentials. Try again.";
            break;
          case "network-request-failed":
            errorMessage = "Please check your internet connection and try again.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
      });
      // Re-throw the caught exception
      rethrow;
    } catch (e) {
      // If the exception is not a FirebaseAuthException, handle it here
      // You can either re-throw the exception or return a default value
      rethrow;
    }
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

  Future<void> signInWithEmail() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // If the previous line succeeds, the user is signed in. Clear the error message.
      setState(() {
        errorMessage = '';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        switch (e.code) {
          case 'user-not-found':
            errorMessage = 'No user found for that email. Please register using the link above.';
            break;
          case 'wrong-password':
            errorMessage = 'Wrong password provided for that user.';
            break;
          case 'invalid-email':
            errorMessage = 'Invalid email provided.';
            break;
          case 'user-disabled':
            errorMessage = 'User disabled.';
            break;
          case 'too-many-requests':
            errorMessage = 'Too many requests. Try again later.';
            break;
          case 'operation-not-allowed':
            errorMessage = 'Operation not allowed.';
            break;
          default:
            errorMessage = 'An unknown error occurred.';
        }
      });
    }
  }
}
