import 'dart:io';
import 'dart:typed_data';

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

class _Register3State extends State<Register3> {
  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController emailController =
        TextEditingController(text: widget.email);
    TextEditingController userNameController =
        TextEditingController(text: widget.username);
    TextEditingController lastNameController =
        TextEditingController(text: widget.lastName);
    TextEditingController firstNameController =
        TextEditingController(text: widget.firstName);
    
    TextEditingController phoneNumberController =
        TextEditingController(text: widget.phoneNumber);

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
                    onTap: (){
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
                    },
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
              ],
            ),
          ),
      ),
      
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
