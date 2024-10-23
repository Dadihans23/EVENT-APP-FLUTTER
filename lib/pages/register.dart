import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/components/button.dart';
import 'package:my_event_app/components/password.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:my_event_app/components/textfield.dart';
import 'package:my_event_app/pages/register2.dart';
import 'package:my_event_app/components/custominput.dart';
import 'package:my_event_app/components/custompassword.dart';
import 'package:my_event_app/components/customPhoneNumber.dart';
import 'package:my_event_app/pages/sumary_screen.dart';
import 'package:my_event_app/pages/login.dart';






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
              child: Container(
                child: SingleChildScrollView( 
                  physics:BouncingScrollPhysics(),
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
                                              "Remplissez vos informations",
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
                                          SizedBox(height: 15,),
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
                              ),
                              SizedBox(height: 15,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 0.5,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()) );
                                    },
                                    child: Container(
                                      child: Text("deja un compte ?" ,style: TextStyle(color: Colors.grey.shade300 , fontSize: 12 , fontWeight:FontWeight.w600),),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 0.5,
                                      color: Colors.grey.shade500,
                                    ),
                                  )
                                ],
                              ),
                          ]
                        ),
                ),
              ),
            )
                    
                  
              );

  
  }
  void _registerUser() async {
  String name = _nameController.text.trim();
  String surname = _surnameController.text.trim();
  String username = _usernameController.text.trim();
  String email = _emailController.text.trim();
  String phone = _phoneController.text.trim();
  String password = _passwordController.text.trim();
  String confirmPassword = _confirmPasswordController.text.trim();

  // Débogage : Afficher les valeurs des champs


  if (name.isEmpty || surname.isEmpty || username.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty){
    _showErrorDialog("Veuillez remplir tous les champs.");
    return;
  }

  if (password != confirmPassword) {
    _showErrorDialog("Les mots de passe ne correspondent pas.");
    return;
  }

  // Vérification du format de l'email
  RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegExp.hasMatch(email)) {
    _showErrorDialog("Veuillez entrer une adresse email valide.");
    return;
  }

  // Toutes les vérifications sont passées, continuer avec le traitement des données

   Map<String, dynamic> requestBody = {
    'email': email,
    'username': username,
    'telephone': phone,
  };

//   {
//     "email": "test@example.com",
//     "username": "test_user",
//     "telephone": "1234567890"
// }

  // Convertir le corps de la requête en JSON
  
String jsonBody = json.encode(requestBody);
  
// Définir l'URL de ton API Django
String apiUrl = 'http://192.168.131.151:8000/users/Check_existing_organizer/';

  // Enregistrer l'utilisateur, etc.

try {
  // Effectuer la requête POST
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonBody,
  );
     
  // Décode la réponse en tant que JSON en spécifiant l'encodage des caractères
  Map<String, dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));

  // Vérifier si la requête a réussi (code de statut 200)
  if (response.statusCode == 200) {
    // Vérifier si la réponse de l'API contient "success" à true
    if (jsonResponse['success'] == true) {
      print("permier etape bien recu");
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
      );
    } else {
      // Afficher le message d'erreur de l'API
      _showErrorDialog(jsonResponse['message']);
    }
  } else {
    // Traitement en cas d'échec
    print('Échec de l\'inscription. Code de statut: ${response.statusCode}');
  }
} catch (error) {
  // cas d'erreurs
  print('Erreur lors de la requête POST: $error');
}

 
  ;
  }


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

