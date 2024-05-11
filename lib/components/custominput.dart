import 'package:flutter/material.dart';

class CustomTextinput extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  

  const CustomTextinput({
    Key? key,
    this.hintText = "",
    this.prefixIcon,
    this.suffixIcon,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5 , horizontal: 5),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
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
