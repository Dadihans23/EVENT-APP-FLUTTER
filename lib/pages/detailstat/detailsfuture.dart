import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'package:my_event_app/models/event/pasteevent.dart';
import 'package:my_event_app/models/eventmodel.dart';
import 'package:intl/intl.dart'; // Importez la bibliothèque intl


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:my_event_app/models/event/pasteevent.dart';
import 'package:my_event_app/pages/detailstat/detailsfuture.dart';
import 'package:my_event_app/pages/event/eventdetails.dart';

import 'dart:convert';
import 'package:intl/intl.dart'; // Importez la bibliothèque intl
import 'package:intl/date_symbol_data_local.dart'; // Importez les données de symboles de date locales

import 'package:provider/provider.dart';

import 'package:my_event_app/models/authprovider.dart';
import 'package:my_event_app/models/organizer.dart';

import 'package:my_event_app/data/ticket_data.dart';


class detailsFuture extends StatefulWidget {

  final Event event;
  const detailsFuture({super.key , required this.event});

  @override
  State<detailsFuture> createState() => _detailsFutureState();
}

class _detailsFutureState extends State<detailsFuture> {
  @override
  Widget build(BuildContext context) {


    
     
    final organizer = Provider.of<Organisateur>(context);
    final auth = Provider.of<AuthProvider>(context);
    String? token = auth.getToken();
    String  adresse = '192.168.131.151';
    
    

    Future<List<Event>> fetchEvents(String token) async {
      final response = await http.get(
        Uri.parse('http://$adresse:8000/users/events_by_user/upcoming/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token $token',
        },
      );
      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes); // Décode en UTF-8
        List<dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse.map((event) => Event.fromJson(event)).toList();
      } else {
        throw Exception('Failed to load events');
      }
    }


    
      final Event event;
     double screenWidth = MediaQuery.of(context).size.width;
    // Définissez la taille de la police en fonction de la largeur de l'écran
    double fontSize = screenWidth * 0.06;
    DateTime eventDate = DateTime.parse(widget.event.date);
    
    String day = DateFormat('dd', 'fr_FR').format(eventDate);
    String month = DateFormat('MMMM', 'fr_FR').format(eventDate);
    String hour = DateFormat('HH', 'fr_FR').format(eventDate);
    String weekday = DateFormat('EEEE', 'fr_FR').format(eventDate); // Récupérez le jour de la semaine en français
    String year = DateFormat('yyyy', 'fr_FR').format(eventDate); // Récupérez l'année
    print("image");
    print(" voici l'image ${widget.event.image}" ); 

    print(day);
        print(month);
                print(day);
                    print(day);




    return Scaffold(
      backgroundColor: Colors.grey.shade200,
       appBar: AppBar(
                backgroundColor: Colors.grey.shade200,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(  bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Container(
                      child: Text(widget.event.name),
                     ),
                      Container(
                       child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: NetworkImage("http://$adresse:8000${widget.event.image!}"),
                          ),
                        ),
                      ),
                     )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 30),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                      children: [
                        Container(
                          child: Text("$day-$month-$year" , style: TextStyle( color: Colors.white , fontWeight: FontWeight.bold , fontSize: 14),),
                        ), 
                        Container(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 30),
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("Viewers" ,style: TextStyle( color: Colors.indigo , fontWeight: FontWeight.w400 , fontSize: 14 , letterSpacing: -1.00)),  
                                    SizedBox(height: 10,),             
                                    Text("500"   ,style: TextStyle( color: Colors.indigo , fontWeight: FontWeight.bold , fontSize: 22))
                                  ],
                                ),
                                Container(
                                  width: 1.0, // La largeur du trait
                                  height: 60.0, // La hauteur du trait
                                  color: Colors.grey, // La couleur du trait
                                ) ,
                                Column(
                                  children: [
                                    Text("Commentaires" ,style: TextStyle( color: Colors.indigo , fontWeight: FontWeight.w400 , fontSize: 14 , letterSpacing: -1.00)),  
                                    SizedBox(height: 10,),             
                                    Text("500"   ,style: TextStyle( color: Colors.indigo , fontWeight: FontWeight.bold , fontSize: 22))
                                  ],
                                ) ,
                                 Container(
                                  width: 1.0, // La largeur du trait
                                  height: 60.0, // La hauteur du trait
                                  color: Colors.grey, // La couleur du trait
                                ) ,
                                Column(
                                  children: [
                                    Text("Favoris" ,style: TextStyle( color: Colors.indigo , fontWeight: FontWeight.w400 , fontSize: 14 , letterSpacing: -1.00)),  
                                    SizedBox(height: 10,),             
                                    Text("500"   ,style: TextStyle( color: Colors.indigo , fontWeight: FontWeight.bold , fontSize: 22))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo[900]
                  ),
                ),
              ) ,
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white ,
                        borderRadius: BorderRadius.circular(2)
                      ),
                      child: Column(
                        children: [
                          Text("Participants" , style: TextStyle( color: Colors.grey.shade400 , fontWeight: FontWeight.w500 , fontSize: 16 , letterSpacing: 0.00) ),
                          Text("152" , style: TextStyle( color: Colors.black , fontWeight: FontWeight.bold , fontSize: 20 , letterSpacing: -1.00) )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white ,
                        borderRadius: BorderRadius.circular(2)
                      ),
                      child: Column(
                        children: [
                          Text("Perfomances"  , style: TextStyle( color: Colors.grey.shade400 , fontWeight: FontWeight.w500 , fontSize: 16 , letterSpacing: 0.00)),
                          Text(" ↑ 15%" , style: TextStyle( color: Colors.green[600] , fontWeight: FontWeight.bold , fontSize: 20 , letterSpacing: -1.00) )
                        ],
                      ),
                    )
                  ],
                ),
              ) ,
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
                 child: Container(
                            margin:EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey.shade300,
                                  ),
                                  child: Icon(Icons.group, color: Colors.grey.shade700, size: 25),
                                ),
                                SizedBox(width: 8,),
                                Expanded(
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Personnes attendus", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color:  Colors.grey.shade800, letterSpacing: 0.00)),
                                        Text("4000",  style: TextStyle( color: Colors.indigo , fontWeight: FontWeight.bold , fontSize: 20))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
                 child: Container(
                            margin:EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey.shade300,
                                  ),
                                  child: Icon(Icons.monetization_on, color: Colors.grey.shade700, size: 25),
                                ),
                                SizedBox(width: 8,),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Revenus generé", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color:  Colors.grey.shade800, letterSpacing: 0.00)),
                                        Text("40 000 CFA",  style: TextStyle( color: Colors.green[600] , fontWeight: FontWeight.bold , fontSize: 16))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
               )
          
            ],
          ),
        ),
      ),

    );


   
  }
}