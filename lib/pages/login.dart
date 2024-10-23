import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:my_event_app/components/textfield.dart';
import 'package:my_event_app/pages/home_page.dart';
import 'package:my_event_app/pages/register2.dart';
import 'package:my_event_app/components/custominput.dart';
import 'package:my_event_app/components/custompassword.dart';
import 'package:my_event_app/components/customPhoneNumber.dart';
import 'package:my_event_app/pages/resetpassword.dart';
import 'package:my_event_app/pages/sumary_screen.dart';
import 'package:my_event_app/pages/login.dart';
import 'package:my_event_app/pages/register.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:my_event_app/models/organizer.dart';
import 'package:my_event_app/models/authprovider.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

bool isObscure =true;

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
 final adresse = '192.168.109.151' ;
 final auth =Provider.of<AuthProvider>(context);
 final organisateur =Provider.of<Organisateur>(context);

void _connexion() async {
  String email = _emailController.text.trim();
  String password = _passwordController.text.trim();

  // Débogage : Afficher les valeurs des champs
  print('Email: $email');
  print('Password: $password');

  if (email.isEmpty || password.isEmpty) {
    _showErrorDialog("Veuillez remplir tous les champs.");
    return;
  }

  // Vérification du format de l'email
  RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegExp.hasMatch(email)) {
    _showErrorDialog("Veuillez entrer une adresse email valide.");
    return;
  }
  
   Map<String, dynamic> requestBody = {
    'email': email,
    'password':password
    
  };


  // Convertir le corps de la requête en JSON
  
String jsonBody = json.encode(requestBody);
  
// Définir l'URL de ton API Django
String apiUrl = 'http://${adresse}:8000/users/Login_organizer/';

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
      print(jsonResponse['token']);
      auth.setToken(jsonResponse['token']);

      jsonResponse['success'] = false;


      // print(jsonResponse['user']);
      // Organisateur organisateur = Organisateur.fromJson(jsonResponse['user']);
      // print('organisateur : ${organisateur.email}');

      Provider.of<Organisateur>(context, listen: false).updateFromMap(jsonResponse['user']);        
      

      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondryAnimation) => HomePage(
        
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
     _showErrorDialog(jsonResponse['error']);

  }
} catch (error) {
  // cas d'erreurs
  print('Erreur lors de la requête POST: $error');
}

  // Enregistrer l'utilisateur, etc.
}




    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      body: SafeArea(
        child: Center(
         child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
           child: Column(
            children: [
                Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            " EVENT APP",
                            style: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              decorationStyle: TextDecorationStyle.double,
                            ),
                          ),
                        ),
              SizedBox(height: 20,),
           
              const Icon(Icons.lock , size: 100, color: Colors.grey,),
           
              SizedBox(height: 20,),
           
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: "Email",
                      hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                      prefixIcon: Icon(Icons.email_sharp , color: Colors.grey, )
                      )
                      ,
                ),
              ),
           
           
              Padding(
                padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 25.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: isObscure,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: "Mot de passe",
                      hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                      prefixIcon: Icon(Icons.password , color: Colors.grey, ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure; // Inverse l'état de l'obfuscation lorsque l'icône est cliquée.
                          });
                        },
                      ),
                          ),
                ),
              ) ,
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => resetpassword()));
                      },
                      child: Container(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[400] 
                          ,fontSize: 12 , fontWeight: FontWeight.w600
                        
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), 
              SizedBox(height: 20,),

           
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: GestureDetector(
                  onTap: _connexion,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0 , vertical: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      color: Colors.indigo[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Connexion",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                                                ),
                ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
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
                                          child: Text("Pas de compte ?" ,style: TextStyle(color: Colors.grey.shade300 , fontSize: 12 , fontWeight:FontWeight.w600),),
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
                        ),
           
           
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>register()) );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0 , vertical: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                                              
                 ),
                ),
                      
            ],
           ),
         ),
        ),
      ),
    

    );
  }
  

void _showErrorDialog(String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        title: Text(
          "Erreur",
          style: TextStyle(color: Colors.indigo[900], fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(
          message,
          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
        ),
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
