import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/auth/auth_service.dart';
import 'package:notes_app/auth/loginScreen.dart' ;
import 'package:notes_app/widgets/custom_text_field.dart';

class Registerscreeb extends StatefulWidget {
  const Registerscreeb({super.key});

  @override
  State<Registerscreeb> createState() => _RegisterscreebState();
}

class _RegisterscreebState extends State<Registerscreeb> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F9),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 50),

            Center(
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Image.asset("lib/asset/notes.png", width: 40),
              ),
            ),

            const SizedBox(height: 20),
            const Text('Register',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              'Create a new account',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 20),
            const Text('Username'),
            CustomTextField(
              hint: 'Enter username',
              controller: _usernameController,
            ),

            const SizedBox(height: 15),
            const Text('Email'),
            CustomTextField(
              hint: 'Enter email',
              controller: _emailController,
            ),

            const SizedBox(height: 15),
            const Text('Password'),
            CustomTextField(
              hint: 'Enter password',
              isPassword: true,
              controller: _passwordController,
            ),

            const SizedBox(height: 15),
            const Text('Confirm Password'),
            CustomTextField(
              hint: 'Confirm password',
              isPassword: true,
              controller: _confirmPasswordController,
            ),

            const SizedBox(height: 25),

            MaterialButton(
              color: Colors.orange,
              height: 45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: _register,
              child: const Text('Register',
                  style: TextStyle(color: Colors.white)),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Loginscreen(),
                      ),
                    );
                  },
                  child: const Text('Login',
                      style: TextStyle(color: Colors.orange)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  /// 🔐 Register Logic
  Future<void> _register() async {
    if (_usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      _showMessage('Please fill all fields');
      return;
    }

    if (_passwordController.text.length < 6) {
      _showMessage('Password must be at least 6 characters');
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      _showMessage('Passwords do not match');
      return;
    }

    try {
      await _authService.registerWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      _showMessage('Account created successfully 🎉');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showMessage('Email already in use');
      } else if (e.code == 'weak-password') {
        _showMessage('Password is too weak');
      }
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }
}
