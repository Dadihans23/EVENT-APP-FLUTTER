import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/pages/login.dart';
import'package:my_event_app/pages/newpassword.dart';


import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';


import 'dart:convert';
import 'package:http/http.dart' as http;

class resetpassword extends StatefulWidget {
  const resetpassword({super.key});

  @override
  State<resetpassword> createState() => _resetpasswordState();
}
  final TextEditingController _emailController = TextEditingController();

class _resetpasswordState extends State<resetpassword> {

  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
  }

 
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
                  " MOT DE PASSE OUBLIE ?",
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
                    "Votre mot de passe sera reinitialiser par Email",
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

              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0 , vertical: 5),
                child: Text(
                  'Entrez votre adresse email',
                  style: TextStyle(color: Colors.grey[400] 
                  ,fontSize: 12 , fontWeight: FontWeight.w600
                    ),
                ),
              ),
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
              
           
                ],
              ),
              
               
               
              SizedBox(height: 20,),

           
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: GestureDetector(
                  onTap: _sendResetPasswordLink,
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
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Text("Retour vers la connexion? cliquez ici" ,style: TextStyle(color: Colors.grey.shade300 , fontSize: 10 , fontWeight:FontWeight.w600 ),),
                                          ),
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
           
                        
                      
            ],
           ),
         ),
        ),
      ),
    

    );
  }
  
  void _sendResetPasswordLink() async {
  String email = _emailController.text.trim();


  // Débogage : Afficher les valeurs des champs


  if ( email.isEmpty){
    _showErrorDialog("Veuillez remplir tous les champs.");
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
  };

//   {
//     "email": "test@example.com",
//     "username": "test_user",
//     "telephone": "1234567890"
// }

  // Convertir le corps de la requête en JSON
  
String jsonBody = json.encode(requestBody);
  
// Définir l'URL de ton API Django
String apiUrl = 'http://192.168.0.142:8000/users/forgotPassword/';

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
        _showSuccessDialog("Un jpoo de réinitialisation de mot de passe a été envoyé.");
      
    } else {
      // Afficher le message d'erreur de l'API
      _showErrorDialog(jsonResponse['message']);
    }
  } 
  else if (response.statusCode == 404) {
      _showErrorDialog('Adresse e-mail non trouvée. Veuillez vérifier votre adresse e-mail et réessayer.');
    } 
  else {
    // Traitement en cas d'échec
    print('Échec de l\'envoie. Code de statut: ${response.statusCode}');
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




  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          title: Text("Succès", style: TextStyle(color: Colors.indigo[900], fontSize: 18, fontWeight: FontWeight.bold),),
          content: Text(message, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => Newpassword(email: _emailController.text.trim()),
                    transitionDuration: Duration(milliseconds: 400),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
     }

}
