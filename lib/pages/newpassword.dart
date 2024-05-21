import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_event_app/pages/home_page.dart';

class Newpassword extends StatefulWidget {

 
  final String email;
  // final String token;
  
  const Newpassword({
    Key? key,
    required this.email,
    });

  @override
  State<Newpassword> createState() => _NewpasswordState();
}
  final TextEditingController _oldpasswordController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
 final TextEditingController _confirmPasswordController = TextEditingController();
  bool isObscure =true;


 


class _NewpasswordState extends State<Newpassword> {
  @override
  Widget build(BuildContext context) {
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
                  " REINITIALISATION DE MOT DE PASSE ",
                  textAlign: TextAlign.center,   
                  style: TextStyle(
                    
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    decorationStyle: TextDecorationStyle.double,
                  ),
                ),
              ),
              SizedBox(height: 20,),
           
              const Icon(Icons.lock , size: 100, color: Colors.grey,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
                child: Container(
                  child: Text(
                    "Veuillez reinitialiser votre mot de passe ",
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
              ),
           
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 25.0),
                child: TextField(
                  controller: _oldpasswordController,
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
                      hintText: "Nouveau de passe envoyé a l'email",
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
                      hintText: "Nouveau mot de passe",
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
                padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 25.0),
                child: TextField(
                  controller: _confirmPasswordController,
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
                      hintText: "Confirmez votre mot de passe",
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
               
              SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: GestureDetector(
                  onTap:_resetPassword,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0 , vertical: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      color: Colors.indigo[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Suivant",
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
            ],
           ),
         ),
        ),
      ),
    

    );
  }




  void _resetPassword() async {
    final oldpassword = _oldpasswordController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password.isEmpty || confirmPassword.isEmpty) {
      _showErrorDialog('Les champs ne peuvent pas être vides.');
      return;
    }

    if (password != confirmPassword) {
      _showErrorDialog('Les mots de passe ne correspondent pas.');
      return;
    }

    final response = await http.post(
      Uri.parse('http://192.168.0.142:8000/users/restpassword/'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'temp_password':oldpassword,
        'new_password': password,
        'email': widget.email
      }),
    );

    if (response.statusCode == 200) {
      _showErrorDialog('Votre mot de passe a été réinitialisé avec succès.');
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
      _showErrorDialog('Échec de la réinitialisation du mot de passe. Veuillez réessayer.');
    }
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