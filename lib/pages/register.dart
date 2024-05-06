import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/components/button.dart';
import 'package:my_event_app/components/password.dart';

import 'package:my_event_app/components/textfield.dart';
import 'package:my_event_app/pages/register2.dart';
import 'package:my_event_app/components/custominput.dart';
import 'package:my_event_app/components/custompassword.dart';
import 'package:my_event_app/components/customPhoneNumber.dart';








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

  @override
  void dispose() {
    // Disposez des contrôleurs lorsque vous n'en avez plus besoin pour libérer les ressources.
    _nameController.dispose();
    _surnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }


class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Permet le déplacement automatique du formulaire lorsque le clavier apparaît
            backgroundColor: Color.fromARGB(255, 37, 37, 37),
            body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      SingleChildScrollView(
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
                                          controller: _usernameController,
                                    
                                    
                                        ),
                                        
                                    
                                            CustomPhoneinput(
                                              hintText: 'entrez votre numero de telephone',
                                              prefixIcon: Icon(Icons.phone),
                                             controller: _usernameController,
                                            ),
                                        
                                         PasswordTextField(
                                          controller: _passwordController,
                                          hintText: 'Mot de passe',
                                          suffixIconData: Icons.visibility,
                                          prefixIcon: Icon(Icons.password_rounded),
                                    
                                          
                                        ),
                                         PasswordTextField(
                                          controller: _passwordController,
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
                        Container(
                        alignment: Alignment(0, 0.95),
                        child:ElevatedButton(
                            onPressed: () {
                              // Actions lorsque le bouton est appuyé
                            },
                            child: Text('Soumettre'),
                          ),
                        )
                    ]
                  )
                    
                  ),
                 
                  
              );

  
  }
}

