// // register1.dart

// import 'package:flutter/material.dart';
// import 'package:my_event_app/components/button.dart';
// import 'package:my_event_app/components/password.dart';

// import 'package:my_event_app/components/textfield.dart';
// import 'package:my_event_app/pages/register2.dart';

// class Register1 extends StatefulWidget {
//   Register1({Key? key}) : super(key: key);

//   @override
//   _Register1State createState() => _Register1State();
// }

// class _Register1State extends State<Register1> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   bool isEmailValid = true;
//   bool isPasswordValid = true;
//   bool isConfirmPasswordValid = true;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 43, 43, 43),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(height: 0),
//                 Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(width: 20),
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: Text(
//                           " CREER UN COMPTE ",
//                           style: TextStyle(
//                             color: Colors.indigo[900],
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 0.5,
//                             decorationStyle: TextDecorationStyle.double,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 50),
//                         child: Text(
//                           "Fill in the following information to create your account",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: const Color.fromARGB(255, 255, 255, 255),
//                             fontSize: 14.0,
//                             fontWeight: FontWeight.bold,
//                             fontStyle: FontStyle.italic,
//                             letterSpacing: 0.4,
//                             decorationStyle: TextDecorationStyle.double,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 MyTextField(
//                   controller: emailController,
//                   hintText: 'Entrez votre email',
//                   obscureText: false,
//                   suffixIconData: Icons.email,
//                   errorText: isEmailValid ? null : 'Invalide email',
//                 ),

//                 PasswordTextField(
//                   controller: passwordController,
//                   hintText: 'Enter your Password',
//                   suffixIconData: Icons.visibility,
//                 ),
//                 PasswordTextField(
//                   controller: confirmPasswordController,
//                   hintText: 'Enter your Confirm password',
//                   suffixIconData: Icons.visibility,
//                   errorText: isConfirmPasswordValid ? null : 'Passwords do not match',
//                 ),

//                 const SizedBox(height: 50),
//                 Button(
//                   onPressed: () {
//                     setState(() {
//                       isEmailValid = validateEmail(emailController.text);
//                       isPasswordValid = validatePassword(passwordController.text);
//                       isConfirmPasswordValid = validateConfirmPassword(passwordController.text, confirmPasswordController.text);
//                     });

//                     if (isEmailValid && isPasswordValid && isConfirmPasswordValid) {
//                       Navigator.push(
//                         context,
//                         PageRouteBuilder(
//                           pageBuilder: (context, animation, secondaryAnimation) => Register2(
//                             email: emailController.text,
//                             password: passwordController.text,
//                           ),
//                           transitionDuration: Duration(milliseconds: 400),
//                           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                             return FadeTransition(
//                               opacity: animation,
//                               child: child,
//                             );
//                           },
//                         ),
//                       );
//                     }
//                   },
//                   buttonText: "Continue",
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   bool validateEmail(String email) {
//     // Validation de l'email
//     // Vous pouvez utiliser des expressions régulières ou d'autres méthodes de validation
//     return email.isNotEmpty && email.contains('@gmail.com');
//   }

//   bool validatePassword(String password) {
//     // Validation du mot de passe
//     // Par exemple, vérifiez si le mot de passe a une longueur minimale
//     return password.isNotEmpty && password.length >= 6;
//   }

//   bool validateConfirmPassword(String password, String confirmPassword) {
//     // Validation du mot de passe confirmé
//     return confirmPassword.isNotEmpty && confirmPassword == password;
//   }
// }
