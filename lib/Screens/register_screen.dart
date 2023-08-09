import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pantry_app/Widgets/password_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
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
        title: const Text('Register'),
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
                  'Sign Up!',
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
                  'Welcome to Pantry Planner! We are glad to see that you have decided to make an account. Please enter your email address and password to create an account.',
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
              PasswordFormField(controller: passwordController, labelText: 'Password'),
              const SizedBox(height: 20),
              PasswordFormField(
                  controller: confirmPasswordController, labelText: 'Confirm Password'),
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
                          'Submit',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'By signing in, you agree to the',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/terms');
                      },
                      child: const Text('terms and conditions'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
