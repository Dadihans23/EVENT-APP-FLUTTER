import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/pages/home_page.dart';
import 'package:my_event_app/components/descriptionrow.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
     
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                color: Colors.amber,
                  height: MediaQuery.of(context).size.height*0.5,
                  width: MediaQuery.of(context).size.width*1,
                  child:SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100, 
                            width: 100,
                            color: Colors.red,
                          ),
                          Container(
                            height: 100, 
                            width: 100,
                            color: Colors.green,
                          ),
                          Container(
                            height: 100, 
                            width: 100,
                            color: Colors.blue,
                          ),
                          Container(
                            height: 100, 
                            width: 100,
                            color: Colors.red,
                          ),Container(
                            height: 100, 
                            width: 100,
                            color: Colors.brown,
                          ),
                        ],
                      ),
              ), 
              ),
            ),
          
            
          ],
        ),

      )
    ) ;
  }
}