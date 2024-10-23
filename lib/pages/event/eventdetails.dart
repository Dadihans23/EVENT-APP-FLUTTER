import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_event_app/models/event/pasteevent.dart';
import 'package:my_event_app/models/eventmodel.dart';
import 'package:intl/intl.dart'; // Importez la bibliothèque intl

class EventDetailsPage extends StatelessWidget {
  final Event event;

  EventDetailsPage({required this.event});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Définissez la taille de la police en fonction de la largeur de l'écran
    double fontSize = screenWidth * 0.06;


    DateTime eventDate = DateTime.parse(event.date);
    
    String day = DateFormat('dd', 'fr_FR').format(eventDate);
    String month = DateFormat('MMMM', 'fr_FR').format(eventDate);
    String hour = DateFormat('HH', 'fr_FR').format(eventDate);
    String weekday = DateFormat('EEEE', 'fr_FR').format(eventDate); // Récupérez le jour de la semaine en français
    String year = DateFormat('yyyy', 'fr_FR').format(eventDate); // Récupérez l'année
    print("image");
    print(" voici l'image ${event.image}" ); 

    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("http://192.168.160.151:8000${event.image!}"), // Utilisez l'image de l'événement
                        fit: BoxFit.cover,

                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 15,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.share, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.indigo,
                      Colors.black.withOpacity(.9),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              event.name,
                              style: TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      " ${day} ${month} - ${event.locationPlace}",
                                      style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text('A propos', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    event.description,
                                    style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),
                                        image: DecorationImage(
                                          image: AssetImage("lib/images/salle.png") , 
                                          fit: BoxFit.cover
                                          ) ,
                                      
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(event.locationPlace,
                                              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                                          Text(" ${event.locationCommune} , ${event.locationVille}",
                                              style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100),
                                         image: DecorationImage(
                                          image: AssetImage("lib/images/hand.jpg") , 
                                          fit: BoxFit.cover
                                          ) ,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(" ${weekday} , ${day} ${month} , ${year}",
                                              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                                          Text(" ${event.startTime} - ${event.endTime}",
                                              style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(thickness: 1, color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Text("Billetterie ",
                                          style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
                                      Icon(Icons.payments, color: Colors.white),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Divider(thickness: 1, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          event.ticketTypes.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius:  BorderRadius.circular(100),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                    "Entrée gratuit",
                                    style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(Icons.payment_rounded , color: Colors.black,)
                                    ],
                                  ),
                                ),
                              )
                            )
                          : Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Table(
                              border: TableBorder(horizontalInside: BorderSide(color: Colors.white) , verticalInside: BorderSide(color: Colors.white)),
                              columnWidths: {
                                0: FlexColumnWidth(1),
                                1: FlexColumnWidth(1),
                                2: FlexColumnWidth(1),
                              },
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Nom', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Prix', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Quantité', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ],
                                ),
                                ...event.ticketTypes.map(
                                  (ticketType) => TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(ticketType.name, style: TextStyle(color: Colors.white ,)  ,textAlign: TextAlign.center,),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${ticketType.price} FCFA',  style: TextStyle(color: Colors.white ,)  ,textAlign: TextAlign.center,),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${ticketType.quantityAvailable}',  style:TextStyle(color: Colors.white ,)  ,textAlign: TextAlign.center,),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).toList(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
