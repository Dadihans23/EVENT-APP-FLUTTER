import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_event_app/pages/sumary_screen.dart';
import 'package:my_event_app/pages/home_page.dart';

class Register3 extends StatefulWidget {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String username;
  final String phoneNumber;

  Register3({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phoneNumber,
  });

  @override
  _Register3State createState() => _Register3State();
}

   final TextEditingController _organisationController = TextEditingController();
   final TextEditingController _descriptionController = TextEditingController();  
   

class _Register3State extends State<Register3> {
  Uint8List? _image;
  File? selectedImage;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
   
  

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.35,
                  width: MediaQuery.of(context).size.width*1,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        Container(
                              child: GestureDetector(
                                onTap: () {
                                  showImagePickerOption(context);
                                },
                                child: Stack(
                                  children: [
                                    _image != null
                                        ? Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              color: Colors.black26,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: MemoryImage(_image!),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              color: Colors.black26,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "lib/images/inconu2.png"),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
        
                    
                      ] 
                    ),
                  ),
                        
                ),
                Divider(
                  color: Colors.grey.shade800,
                  
                ), 
                SizedBox(height: 30,),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
                 child: Container(
                            child:TextField(
                              controller:_organisationController ,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200 , fontStyle: FontStyle.italic,),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: "Nom de l'organisation",
                              filled: true,
                              fillColor: Colors.transparent,
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade100, // Changer la couleur du texte d'indicatif de saisie
                                fontStyle: FontStyle.italic, // Ajouter un style italic au texte d'indicatif de saisie
                                fontWeight: FontWeight.w400, // Ajouter un style bold au texte d'indicatif de saisie
                              ),
                            ),
                          )
                      
                   
                 ),
               ),
                            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 15),
                 child: Container(
                      child: TextField(
                        controller: _descriptionController,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200 , fontStyle: FontStyle.italic,),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: "Description de l'organisation",
                          filled: true,
                          fillColor: Colors.transparent,
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade100, // Changer la couleur du texte d'indicatif de saisie
                            fontStyle: FontStyle.italic, // Ajouter un style italic au texte d'indicatif de saisie
                            fontWeight: FontWeight.w400, // Ajouter un style bold au texte d'indicatif de saisie
                          ),
                        ),
                        maxLines: null, // ou une valeur supérieure à 1
                      ),
                    )

               ),
               SizedBox(height: 80),
               GestureDetector(
                    onTap: _createuser,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0 , vertical: 15),
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          " ddd",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
      ),
      
    );
    
  }

  void _createuser() async{
    String description = _descriptionController.text;
    String nom_organisation = _organisationController.text;
    String email = widget.email;
    String username = widget.username;
    String prenom = widget.lastName;
    String nom = widget.firstName;
    String telephone = widget.phoneNumber;
    String password = widget.password;

  print('Name: $nom');
  print('Surname: $prenom');
  print('Username: $username');
  print('Email: $email');
  print('Phone: $telephone');
  print('Password: $password');
  print('nom_organisation: $nom_organisation');
  print('description: $description');


  if (description.isEmpty || nom_organisation.isEmpty ){
    _showErrorDialog("Veuillez remplir tous les champs.");
    return;
  }
   Map<String, dynamic> requestBody = {
    'email': "dadi@gmail.com",
    'username': "hooo",
    'password': "12345678",
    'nom': nom,
    'prenom': prenom,
    'nom_organisation': nom_organisation,
    'description': description,
    'telephone': "0151655248",

  };

//   {
//     "email": "test@example.com",
//     "username": "test_user",
//     "password": "password123",
//     "nom": "Nom",
//     "prenom": "Prénom",
//     "nom_organisation": "Organisation XYZ",
//     "description": "Description de l'organisation",
//     "telephone": "1234567890"
// }


  // Convertir le corps de la requête en JSON
  String jsonBody = json.encode(requestBody);
  

  // Définir l'URL de ton API Django
  String apiUrl = 'http://127.0.0.1:8000/users/Register_organizer/';

  try {
    // Effectuer la requête POST
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody,
    );

    // Vérifier si la requête a réussi (code de statut 200)
    if (response.statusCode == 200) {
      // Traitement en cas de succès

      Map<String, dynamic> jsonResponse = json.decode(response.body);

      String token = jsonResponse['token'];

      print('Token: $token');


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
      // Traitement en cas d'échec
      print('Échec de l\'inscription. Code de statut: ${response.statusCode}');
    }
  } catch (error) {
    // cas d'erreurs
    print('Erreur lors de la requête POST: $error');
  }

  // Toutes les vérifications sont passées, continuer avec le traitement des données

  // Enregistrer l'utilisateur, etc.
  
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

  Widget _buildTextFieldWithLabel(
      String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color.fromARGB(255, 160, 160, 160),
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: TextField(
            controller: controller,
            style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              fillColor: const Color.fromARGB(255, 110, 110, 110),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[500]),
            ),
          ),
        ),
      ],
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.indigo[800],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            color: Colors.white ,
                            size: 70,
                          ),
                          Text("Gallery" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 70,
                          ),
                          Text("Camera" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        
      },

    );
  }
  
  void signAnimation(BuildContext context) {
    // Afficher le widget CircularProgressIndicator pendant 3 secondes
    showModalBottomSheet(
      backgroundColor: Colors.indigo[800],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6.5,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Inscription ...",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: AutofillHints.familyName,
                    ),
                  ),
                  SizedBox(height: 25),
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    strokeWidth: 8.0,
                    semanticsLabel: 'Chargement en cours',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );

    // Retarder la navigation vers un autre écran
    Future.delayed(Duration(seconds: 3), () {
      // Naviguer vers l'écran suivant (par exemple, SumaryScreen)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

  //Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
