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

import 'package:my_event_app/models/eventmodel.dart';

class StatFutureEvent extends StatefulWidget {
  const StatFutureEvent({super.key});

  @override
  State<StatFutureEvent> createState() => _StatFutureEventState();
}

class _StatFutureEventState extends State<StatFutureEvent> {

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR'); // Initialisez les données de formatage de date en français
  }
  @override
  Widget build(BuildContext context) {
    
    final organizer = Provider.of<Organisateur>(context);
    final auth = Provider.of<AuthProvider>(context);
    String? token = auth.getToken();
    String  adresse = '192.168.109.151';
    
    

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

    void navigateToEventDetails(BuildContext context, Event event) {
  Future.delayed(Duration(milliseconds: 10), () { // Délai de 500 ms
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 1800),
        pageBuilder: (context, animation, secondaryAnimation) => detailsFuture(event: event),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(5.0, 5.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  });
}

    
    if (token != null) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: FutureBuilder<List<Event>>(
            future: fetchEvents(token),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No events found'));
              } else {
                List<Event> events = snapshot.data!;
                return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    Event event = events[index];
                    DateTime eventDate = DateTime.parse(event.date); // Parsez la date de l'événement
                    String day = DateFormat('dd', 'fr_FR').format(eventDate); // Récupérez le jour
                    String month = DateFormat('MMMM', 'fr_FR').format(eventDate); // Récupérez le mois en français
                    String weekday = DateFormat('EEEE', 'fr_FR').format(eventDate); // Récupérez le jour de la semaine en français
                    print(event.image) ;
                    return GestureDetector(
                       onTap: () {
                            navigateToEventDetails(context, event);
                        },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white ,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 5),
                            child: Row(
                              children: [
                                Container(
                                  child: Container(
                                    height: 85,
                                    width: 85,
                                    decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage("http://$adresse:8000${event.image!}"),
                                         fit: BoxFit.cover, // Remplir tout l'espace du container
                                         alignment: Alignment.center, // Centrer l'image
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 9,),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(event.name, style: TextStyle( color:Colors.black  , fontWeight: FontWeight.bold , fontSize: 15)  ) ,
                                      Container(child: Row(
                                              children: [
                                                  Text(
                                                    day,
                                                    style: TextStyle(color: Colors.grey, fontSize: 13 , fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(
                                                    " - $month",
                                                    style: TextStyle(color: Colors.grey, fontSize: 12 , fontWeight: FontWeight.bold , letterSpacing: 1.00),
                                                  ),
                                              ],
                                        ),) ,
                                        Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.place_rounded , size: 15,),
                                            Text(event.locationPlace, style: TextStyle( color:Colors.black  , fontWeight: FontWeight.w500 , letterSpacing: -1.00)  )
                                          ],
                                        ),
                                      )
                                                    
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      );
    } else {
      // Gérer le cas où token est nul, par exemple afficher un message d'erreur
      return Center(child: Text('Token is null'));
    }
  }
}