import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/components/button.dart';
import 'package:my_event_app/components/password.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importez cette bibliothèque pour utiliser les formatters

class CustomPhoneinput extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomPhoneinput({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        keyboardType: TextInputType.number,        
        maxLength: 10, // Limite le nombre maximum de caractères à 10
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
