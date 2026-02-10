import 'package:flutter/material.dart';
import 'package:notes_app/auth/loginScreen.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
class Registerscreeb extends StatefulWidget {
  const Registerscreeb({super.key});

  @override
  State<Registerscreeb> createState() => _RegisterscreebState();
}

class _RegisterscreebState extends State<Registerscreeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xFFF7F9F9),
      body:  Padding(
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
              'Register',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF424242),
              ),
            ),
            const SizedBox(height: 10),

            /// Subtitle
            const Text(
              'Enter Your peersonal details to create an account',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF9E9E9E),
                fontWeight: FontWeight.w300,
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Username',
              style: TextStyle(color: Color(0xFF616161), fontWeight: FontWeight.bold),

            ),
            const SizedBox(height: 8),
            CustomTextField(
              hint: 'Enter your username',
            ),
            const SizedBox(height: 20),
            const Text(
              'Email',
              style: TextStyle(color: Color(0xFF616161), fontWeight: FontWeight.bold),

            ),
            const SizedBox(height: 8),
            CustomTextField(
              hint: 'Enter your email',
            ),
            const SizedBox(height: 20),
            const Text(
              'Password',
              style: TextStyle(color: Color(0xFF616161), fontWeight: FontWeight.bold),

            ),   const SizedBox(height: 8),
            CustomTextField(
                hint: 'Enter your password',
                isPassword: true,
              ),
              const SizedBox(height: 20),
                const Text(
              'Confirm Password',
              style: TextStyle(color: Color(0xFF616161), fontWeight: FontWeight.bold),

            ),   const SizedBox(height: 8),
            CustomTextField(
              hint: 'Enter your password',
              isPassword: true,
            ),
            SizedBox(height: 20,),
            MaterialButton(onPressed:  (){},
            height: 40,
             color: Colors.orange,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
             child: const Text('Register',style: TextStyle(color: Colors.white),),
            ),
              Center(
               child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(" Have An Accont?"),
                        TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Loginscreen()));},
                            child: 
                           Text('Login', textAlign: TextAlign.left, style: TextStyle(color: Colors.orange),)
                      )
                        ],
                      ),
                   ),
            ],
            
      ),
      )
    );
  }
}

// Widget _buildTextField({
//     required String hint,
//     bool isPassword = false,
//   }) {
//     return TextFormField(
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(
//           fontSize: 14,
//           color: Color(0xFF9E9E9E),
//         ),
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//         filled: true,
//         fillColor: const Color(0xFFF2F2F2),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(50),
//           borderSide: const BorderSide(color: Color(0xFFD1D1D1)),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(50),
//           borderSide: const BorderSide(color: Color(0xFFD1D1D1)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(50),
//           borderSide: const BorderSide(color: Color(0xFF9E9E9E)),
//         ),
//       ),
//     );
//   }

