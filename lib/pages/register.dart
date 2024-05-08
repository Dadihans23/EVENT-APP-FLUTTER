import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/components/button.dart';
import 'package:my_event_app/components/password.dart';

import 'package:my_event_app/components/textfield.dart';
import 'package:my_event_app/pages/register2.dart';
import 'package:my_event_app/components/custominput.dart';
import 'package:my_event_app/components/custompassword.dart';
import 'package:my_event_app/components/customPhoneNumber.dart';
import 'package:my_event_app/pages/sumary_screen.dart';








class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  
  

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color.fromARGB(255, 37, 37, 37),
            body: SafeArea(
              child: SingleChildScrollView( 
                    child: Column( 
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                           SingleChildScrollView(
                              // physics: BouncingScrollPhysics(),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 30,),
                                      Container(
                                        child: Text("creer votre compte" , 
                                                style: TextStyle(
                                                      color: Colors.indigo[900],
                                                      letterSpacing: 0.5,
                                                      fontSize: 22 ,
                                                      fontWeight: FontWeight.bold,
                                                      decorationStyle: TextDecorationStyle.double,
                                                      ),
                                                ),
                                      ),
                                      SizedBox(height: 12,),
                                      Container(
                                          child: Text(
                                            "Fill in the following information to create your account",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              letterSpacing: 0.4,
                                              decorationStyle: TextDecorationStyle.double,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Container(
                                          child: Form(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(child:CustomTextinput(
                                                      hintText: 'nom',
                                                      prefixIcon: null,
                                                      controller: _nameController,
                                                    )
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Expanded(child:CustomTextinput(
                                                      hintText: 'prenom',
                                                      prefixIcon: null,
                                                      controller: _surnameController,
                                            
                                                    )
                                                    ),
                                                  ],
                                                ) ,
                                                CustomTextinput(
                                                  hintText: 'entrez votre username',
                                                  prefixIcon: Icon(Icons.person),
                                                 controller: _usernameController,
                                            
                                                ),
                                                CustomTextinput(
                                                  hintText: "entrez votre email",
                                                  prefixIcon: Icon(Icons.email),
                                                  controller: _emailController,
                                            
                                            
                                                ),
                                                
                                            
                                                    CustomPhoneinput(
                                                      hintText: 'entrez votre numero de telephone',
                                                      prefixIcon: Icon(Icons.phone),
                                                     controller: _phoneController,
                                                    ),
                                                
                                                 PasswordTextField(
                                                  controller: _passwordController,
                                                  hintText: 'Mot de passe',
                                                  suffixIconData: Icons.visibility,
                                                  prefixIcon: Icon(Icons.password_rounded),
                                            
                                                  
                                                ),
                                                 PasswordTextField(
                                                  controller: _confirmPasswordController,
                                                  hintText: 'Mot de passe',
                                                  suffixIconData: Icons.visibility,
                                                  prefixIcon: Icon(Icons.password_rounded),
                                                ),
                                                
                                            
                                              ],
                                            ),
                                          ),
                                        ),
                                        
                                    ],
                                  ),
                                ),
                              ),
                            SizedBox(height: 15,),
                        
                            GestureDetector(
                              onTap: _registerUser,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 0 , vertical: 15),
                                margin: const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                  color: Colors.indigo[900],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ]
                      ),
              ),
            )
                    
                  
              );

  
  }
  void _registerUser() {
  String name = _nameController.text.trim();
  String surname = _surnameController.text.trim();
  String username = _usernameController.text.trim();
  String email = _emailController.text.trim();
  String phone = _phoneController.text.trim();
  String password = _passwordController.text.trim();
  String confirmPassword = _confirmPasswordController.text.trim();

  // Débogage : Afficher les valeurs des champs
  print('Name: $name');
  print('Surname: $surname');
  print('Username: $username');
  print('Email: $email');
  print('Phone: $phone');
  print('Password: $password');
  print('Confirm Password: $confirmPassword');

  // if (name.isEmpty || surname.isEmpty || username.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
  //   _showErrorDialog("Veuillez remplir tous les champs.");
  //   return;
  // }

  // if (password != confirmPassword) {
  //   _showErrorDialog("Les mots de passe ne correspondent pas.");
  //   return;
  // }

  // // Vérification du format de l'email
  // RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  // if (!emailRegExp.hasMatch(email)) {
  //   _showErrorDialog("Veuillez entrer une adresse email valide.");
  //   return;
  // }

  // Toutes les vérifications sont passées, continuer avec le traitement des données

  // Enregistrer l'utilisateur, etc.
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondryAnimation) => Register3(
        email: _emailController.text,
        password: _passwordController.text,
        firstName: _nameController.text,
        lastName: _surnameController.text,
        username: _usernameController.text,
        phoneNumber: _phoneController.text,

        
      ),
      transitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  )
  ;}


void _showErrorDialog(String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        title: Text("Erreur"  , style :TextStyle( color: Colors.indigo[900] , fontSize: 18, fontWeight:FontWeight.bold),),
        content: Text(message , style: TextStyle(color: Colors.black , fontSize: 14, fontWeight:FontWeight.w700),),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

}

