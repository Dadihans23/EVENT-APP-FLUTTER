import 'dart:io';
import 'dart:typed_data';

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
  final String description;
  final String phoneNumber;

  Register3({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.description,
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
    TextEditingController descriptionController =
        TextEditingController(text: widget.description);
    TextEditingController phoneNumberController =
        TextEditingController(text: widget.phoneNumber);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              showImagePickerOption(context);
            },
            child: Container(
              height: size.height * 0.20,
              decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                  image: AssetImage("lib/images/bgvide.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 0.0),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 75, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: GestureDetector(
                      onTap: () {
                        showImagePickerOption(context);
                      },
                      child: Stack(
                        children: [
                          _image != null
                              ? Container(
                                  height: 80,
                                  width: 80,
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
                                  height: 80,
                                  width: 80,
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
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextFieldWithLabel(
                            'Nom', firstNameController),
                      ),
                      SizedBox(width: 3.0),
                      Expanded(
                        child: _buildTextFieldWithLabel(
                            'Prénom', lastNameController),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  _buildTextFieldWithLabel('username', userNameController),
                  SizedBox(height: 8.0),
                  _buildTextFieldWithLabel('Email', emailController),
                  SizedBox(height: 8.0),
                  _buildTextFieldWithLabel(
                      'Description', descriptionController),
                  SizedBox(height: 8.0),
                  _buildTextFieldWithLabel(
                      'Numéro de téléphone', phoneNumberController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.indigo[900],
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            signAnimation(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
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
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
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
