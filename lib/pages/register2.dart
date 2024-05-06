import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:my_event_app/components/button.dart';
import 'package:my_event_app/components/nameInput.dart';
import 'package:my_event_app/components/textfield.dart';
import 'package:my_event_app/components/phone_input_button.dart';
import 'package:my_event_app/pages/sumary_screen.dart';

class Register2 extends StatefulWidget {
  final String email;
  final String password;

  Register2({
    required this.email,
    required this.password,
  });

  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();





  bool isNameValid = true;
  bool isLastNameValid = true;
  bool isPseudoValid = true;
  bool isUsernameValid=true;
  bool isNumberValid=true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          " CREER UN COMPTE ",
                          style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            decorationStyle: TextDecorationStyle.double,
                          ),
                        ),
                      ),
                  SizedBox(height: 15.0),
                  Text(
                    "Veuillez remplir vos information pour creer votre compte",

                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0.4,
                      decorationStyle: TextDecorationStyle.double,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: NameTextField(
                          hintText: 'Nom',
                          controller: firstNameController
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: NameTextField(
                          hintText: 'Prenom',
                          controller: lastNameController

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  SizedBox(height: 5.0),
                  MyTextField(
                    controller: descriptionController,
                    hintText: 'Description',
                    obscureText: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Couleur de fond du TextField
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 187, 187, 187),
                            blurRadius: 10,
                            offset: Offset(0, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.black.withOpacity(0.08)),
                      ),
                      child: Stack(
                        children: [
                          PhoneInputButton(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.DIALOG,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                            selectorTextStyle: TextStyle(color: Colors.black),
                            initialValue: null,
                            textFieldController: phoneNumberController,
                            inputDecoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 15, left: 0),
                              border: InputBorder.none,
                              hintText: 'phone number',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 12,
                              ),
                            ),
                            formatInput: false,
                          ),
                          Positioned(
                            left: 90,
                            top: 8,
                            bottom: 8,
                            child: Container(
                              height: 40,
                              width: 1,
                              color: Colors.black.withOpacity(0.15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Button(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register3(
                            email: widget.email,
                            password: widget.password,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            username: usernameController.text,
                            phoneNumber: phoneNumberController.text,
                          ),
                        ),
);
                    },
                    buttonText: "Continue",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
   bool validateName(String name) {
    // Validation de l'email
    // Vous pouvez utiliser des expressions régulières ou d'autres méthodes de validation
    return name.isNotEmpty;
  }
   bool validateLastName(String lastName) {
    // Validation de l'email
    // Vous pouvez utiliser des expressions régulières ou d'autres méthodes de validation
    return lastName.isNotEmpty ;
  }


  bool validatePseudo(String pseudo) {
    // Validation du mot de passe
    // Par exemple, vérifiez si le mot de passe a une longueur minimale
    return pseudo.isNotEmpty && pseudo.length >= 6;
  }

  bool validateUsername(String username) {
    // Validation du mot de passe
    // Par exemple, vérifiez si le mot de passe a une longueur minimale
    return username.isNotEmpty && username.length >= 6;
  }

  bool validateNumber(String Number) {
    // Validation du mot de passe
    // Par exemple, vérifiez si le mot de passe a une longueur minimale
    return Number.isNotEmpty && Number.length >= 10;
  }



}
