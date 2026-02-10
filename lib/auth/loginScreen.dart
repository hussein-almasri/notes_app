import 'package:flutter/material.dart';
import 'package:notes_app/auth/RegisterScreeb.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _Loginscreen();
}

class _Loginscreen extends State<Loginscreen> {
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
              ),

            SizedBox(height: 7,),
            Container(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: (){}, child: 
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
                  onPressed: (){},
                  child: Text('Login'),
                  ),
                  
                  SizedBox(height: 30,),
                   Center(
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have An Accont ?"),
                           TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Registerscreeb()));},
                           
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
}
//   /// Reusable TextField
//   Widget _buildTextField({
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
// 