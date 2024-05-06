import 'package:flutter/material.dart';
import 'package:my_event_app/pages/addEvent1.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Tout vos evenements ici",
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          automaticallyImplyLeading: false,  // Enlève la flèche de retour
        ),
        body: Column(
          children: [
            Divider(thickness: 0.6, color: Colors.black),  // Divider ici pour séparer l'appBar du body
            Expanded(
              child: Center(
                child: Image.asset(
                  "lib/images/intro.png",
                  width: 200,
                  height: 250,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action à effectuer lorsque le bouton est pressé
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return addEvent1();
            }));
            

          },
          child: Icon(Icons.add),
          backgroundColor: Colors.indigo,
        ),
      ),
    );
  }
}
