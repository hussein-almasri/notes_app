import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/auth/RegisterScreeb.dart';
import 'package:notes_app/auth/auth_service.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _Loginscreen();
}

class _Loginscreen extends State<Loginscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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

            /// Logo
            Center(
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Image.asset(
                  "lib/asset/notes.png",
                  width: 40,
                  height: 40,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Title
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF424242),
              ),
            ),

            const SizedBox(height: 10),

            /// Subtitle
            const Text(
              'Login to continue using the app',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF9E9E9E),
                fontWeight: FontWeight.w300,
              ),
            ),

            const SizedBox(height: 20),

            /// Email
            const Text(
              'Email',
              style: TextStyle(color: Color(0xFF616161), fontWeight: FontWeight.bold),

            ),
            const SizedBox(height: 8),
            CustomTextField(
                hint: 'Enter your email',
                controller: _emailController,
              ),

            const SizedBox(height: 15),

            /// Password
            const Text(
              'Password',
              style: TextStyle(color: Color(0xFF616161),fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            

              CustomTextField(
                hint: 'Enter your password',
                isPassword: true,
                controller: _passwordController,
              ),

            SizedBox(height: 7,),
            Container(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: _forgotPassword,
               child: 
              Text('forgot password?',
              textAlign: TextAlign.right,
               style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                 fontSize: 12),
                 ))
                   ),
                   SizedBox(height: 15,),
                   //boutton 
                  MaterialButton( 
                  height: 40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20)
                  ),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: _login ,
                  child: Text('Login'),
                  ),
                  
                  SizedBox(height: 30,),
                   Center(
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have An Accont ?"),
                           TextButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Registerscreeb()));},
                           
                            child: 
                           Text('Register', textAlign: TextAlign.left, style: TextStyle(color: Colors.orange),)
                      )
                        ],
                      ),
                   ),
           ],
        ),
      ),
    
    );    
  }
  Future<void> _login() async {
  if(_emailController .text.isEmpty || _passwordController.text.isEmpty){
    _showMessage('Please fill all fields');
    return;
  }
   // Registration logic will go here

  try {
      await _authService.loginWithEmailAndPassword(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
       
      _showMessage('Login successful 🎉');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
          _showMessage('No user found for this email');
        } else if (e.code == 'wrong-password') {
          _showMessage('Wrong password');
        }
    }
  }
  void _forgotPassword() {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Reset Password'),
              content: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    if (_emailController.text.isEmpty) {
                      _showMessage('Please enter your email');
                      return;
                    }

                    try {
                      await _authService.resetPassword(
                        _emailController.text.trim(),
                      );

                      Navigator.pop(context);
                      _showMessage('Password reset email sent 📧');

                    } on FirebaseAuthException catch (e) {
                      _showMessage(e.message ?? 'Something went wrong');
                    }
                  },
                  child: const Text('Send'),
                ),
              ],
            );
          },
        );
      }
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}


