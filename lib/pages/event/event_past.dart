import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class past_event extends StatefulWidget {
  const past_event({super.key});

  @override
  State<past_event> createState() => _past_eventState();
}

class _past_eventState extends State<past_event> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            
          ),
          child: Center(
            child: 
              Expanded(
                child: Center(
                  child: Image.asset(
                    "lib/images/intro.png",
                    width: 200,
                    height: 250,
                  ),
                ),
              ),
          ),
        ),
      )
    );
  }
}