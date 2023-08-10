import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The leading property defines the widget to display before the toolbar's title.
        // It is often used to display a back button.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Forgot Your Password?',
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
                  'Please enter your email address to reset your password. We will send you an email with a link to reset your password.',
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 20),
              Align(
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // await signInWithEmail();
                },
                style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  // foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(14),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Text(
                          'Send',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<AuthStatus> resetPassword({required String email}) async {
  //   await _auth
  //       .sendPasswordResetEmail(email: email)
  //       .then((value) => _status = AuthStatus.successful)
  //       .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
  //   return _status;
  // }
}
