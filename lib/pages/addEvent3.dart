import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/data/ticket_data.dart';
import 'package:my_event_app/models/tycket_item.dart';
import 'package:my_event_app/pages/addEventLoc.dart';
import 'package:my_event_app/pages/addevent4.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';


class addEvent3 extends StatefulWidget {

  final String? eventName;
  final String? eventDescription;
  final String? eventDate;
  final String? eventStartTime;
  final String? eventEndTime;
  final String? eventLocation ;
  final File? image;
  final File? videoFile;
  final VideoPlayerController? videoPlayerController;

  addEvent3({
    this.eventName,
    this.eventDescription,
    this.eventDate,
    this.eventStartTime,
    this.eventEndTime,
    this.eventLocation,
    this.image,
    this.videoFile,
    this.videoPlayerController,

  });
  @override
  State<addEvent3> createState() => _addEvent3State();
}

class _addEvent3State extends State<addEvent3> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   
  File? _image;
  File? _videoFile;
  VideoPlayerController? _videoPlayerController;
  List<tycketItem> createdTickets = [];

  
  @override
  void initState() {
    super.initState();
    _image = widget.image;
    _videoFile = widget.videoFile;
    _videoPlayerController = widget.videoPlayerController;
  }
  bool isTicketLimitReached(List<tycketItem> tickets) {
  return tickets.length >= 3;
}
  
  void save() {
    if (_formKey.currentState!.validate()) {
      tycketItem tycket = tycketItem(
        name: namecontroller.text,
        price: pricecontroller.text,
        quantity: quantitycontroller.text,
      );
      Provider.of<tycketData>(context, listen: false).addtycket(tycket);
      createdTickets.add(tycket); // Ajouter le ticket créé à la liste
      Navigator.pop(context);
      clear();
      
    }
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  final namecontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final quantitycontroller = TextEditingController();
void addNewTycket() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        title: Text(
          "Nouveau ticket",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.indigo[900],
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      content: SingleChildScrollView(
        child: Form(  // Ajouter Form ici
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: namecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "nom",
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ),
              TextFormField(
                controller: pricecontroller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un prix';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "prix",
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ),
              TextFormField(
                controller: quantitycontroller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une quantité';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "quantité",
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        MaterialButton(onPressed: () {
          if (_formKey.currentState!.validate()) { // Vérifier si le Form est valide
            save();
          }
        }, child: Text("save")),  // Appeler save si le Form est valide
        MaterialButton(onPressed: cancel, child: Text("cancel")),
      ],
    ),
  );
}


  void clear() {
    namecontroller.clear();
    pricecontroller.clear();
    quantitycontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    var ticketData = Provider.of<tycketData>(context);


    return Consumer<tycketData>(
      builder: (context, value, child) => Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.payment , color: Colors.indigo[900],),
                Text(
                "billeterie",
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),] 
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    " vous pouvez ajouter des ticket a votre evenment ici , si vous laissez la section vide , elle sera consideré comme gratuite",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0.4,
                      decorationStyle: TextDecorationStyle.double,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    height: 250,
                    child: ListView.builder(
                        itemCount: value.getAlltycket().length,
                        itemBuilder: (context, index) => Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 10),
                             // Ajoutez un padding seulement à droite
                             child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                  value.getAlltycket()[index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Prix: ${value.getAlltycket()[index].price} FCFA',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10,) ,
                                          Expanded(
                                            child: Text(
                                              'Quantité: ${value.getAlltycket()[index].quantity}',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete, color: Colors.grey.shade900),
                                            onPressed: (){
                                                Provider.of<tycketData>(context, listen: false).deletetycket(value.getAlltycket()[index]);
                                                createdTickets.remove(value.getAlltycket()[index]);
                                            }
                                          ),
                                          
                                        ],
                                  )
                                )
                              ],
                             ),
                            
                          ),
                        ),
                      ),

                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: isTicketLimitReached(ticketData.getAlltycket())?SizedBox.shrink()
                  :GestureDetector(
                    onTap: addNewTycket,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      alignment: Alignment(1, 0.7),
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.indigo[900],
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 20,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                            Navigator.push(
                              context , MaterialPageRoute(builder: (context)=> addEvent4(
                                    image: widget.image,
                                    videoFile: _videoFile,
                                    videoPlayerController: _videoPlayerController,
                                    eventName: widget.eventName,
                                    eventDescription: widget.eventDescription,
                                    eventDate: widget.eventDate ,
                                    eventStartTime: widget.eventStartTime,
                                    eventLocation:widget.eventLocation,
                                    eventEndTime:widget.eventEndTime,
                                    createdTickets: createdTickets, // Passer la liste des tickets créés


                              ))
                            );
                          },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.indigo[900],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                                child: Text(
                                  "SUIVANT",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// child: ListTile(
        // title: Text(
        //   value.getAlltycket()[index].name,
        //   style: TextStyle(
        //     fontSize: 16,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.indigo[900],
        //   ),
        // ),
        
//         subtitle: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // children: [
          //   Text(
          //     'Prix: ${value.getAlltycket()[index].price} FCFA',
          //     style: TextStyle(
          //       fontSize: 12,
          //       color: Colors.grey[800],
          //     ),
          //   ),
          //   SizedBox(width: 25,),
          //   Text(
          //     'Quantité: ${value.getAlltycket()[index].quantity}',
          //     style: TextStyle(
          //       fontSize: 12,
          //       color: Colors.grey.shade800,
          //     ),
          //   ),
            
          // ],
//         ),
        
//       ),