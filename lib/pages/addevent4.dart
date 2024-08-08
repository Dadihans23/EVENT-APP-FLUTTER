import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/models/authprovider.dart';
import 'package:my_event_app/models/eventmodel.dart';
import 'package:my_event_app/models/tycket_item.dart'; // Assurez-vous d'importer la classe tycketItem
import 'package:my_event_app/pages/addEvent4.dart'; // Importez addEvent4 au lieu de addEvent3
import 'package:my_event_app/pages/home_page.dart';
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:video_player/video_player.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:my_event_app/components/customtextfield.dart';
import 'package:video_player/video_player.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:my_event_app/models/authprovider.dart';
import 'package:my_event_app/data/ticket_data.dart';


import 'package:my_event_app/models/eventmodel.dart';
import 'package:provider/provider.dart'; // Importe la classe de modèle

class addEvent4 extends StatefulWidget {
 


  const addEvent4({
    
    Key? key,

  }) : super(key: key);
  @override
  _addEvent4State createState() => _addEvent4State();
}
class _addEvent4State extends State<addEvent4> {


  @override
  Widget build(BuildContext context) {
        final eventModel = Provider.of<EventModel>(context);
        final auth = Provider.of<AuthProvider>(context);
        final tycketdata= Provider.of<tycketData>(context);

Future<void> _uploadImage(int eventId) async {
  String? token = auth.getToken();  // Remplacez par le token de l'utilisateur

  // Construire le corps de la requête pour envoyer l'image
  var request = http.MultipartRequest('POST', Uri.parse('http://192.168.30.151:8000/users/addimage/'));
  request.headers['Authorization'] = 'Token $token';
  request.fields['event_id'] = eventId.toString();
  
  if (eventModel.eventImage != null) {
      request.files.add(await http.MultipartFile.fromPath('image', eventModel.eventImage!));
    } // ID de l'événement
    else {
      print("no image");
    }
  // request.files.add(await http.MultipartFile.fromPath('image', eventModel.eventImage!)); // Remplacez imagePath par le chemin de votre image
  
  // Envoyer la requête pour envoyer l'image
  var response = await request.send();

  if (response.statusCode == 200) {
    print('Image associée à l\'événement avec succès !');
    
  } else {
    print('Échec de l\'association de l\'image à l\'événement. Code de statut: ${response.statusCode}');
    print("failed image ");
  }
}

void _createEvent() async {
  String? token = auth.getToken();  // Remplacez par le token de l'utilisateur

  Map<String, dynamic> requestBody = {
    "name": eventModel.eventName,
    "description": eventModel.eventDescription,
    "location_place": eventModel.eventLocation?.place,
    "location_commune": eventModel.eventLocation?.commune,
    "location_ville": eventModel.eventLocation?.ville,
    "date": eventModel.eventDateIso.toIso8601String(),
    "start_time": eventModel.eventStartTime,
    "end_time": eventModel.eventEndTime,
    "ticket_types": eventModel.generateTicketTypes(),
  };

  // Convertir le corps de la requête en JSON
  String jsonBody = json.encode(requestBody);

  // Définir l'URL de ton API Django pour créer l'événement
  String apiUrl = 'http://192.168.30.151:8000/users/organisateur_create_event/';
  print(eventModel.eventDateIso.toIso8601String()) ;

  try {
    // Effectuer la requête POST pour créer l'événement
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
      body: jsonBody,
    );
     Map<String, dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));

    // Vérifier si la requête a réussi (code de statut 200)
    if (response.statusCode == 201 || response.statusCode == 200) {
      // Extraire l'ID de l'événement de la réponse JSON
      int eventId = jsonResponse["message"]["id"];

      // Utiliser l'ID de l'événement pour envoyer l'image
      await _uploadImage(eventId);

      eventModel.clearEventData();
      tycketdata.clearTycketData();
      print("Événement créé avec succès !");

      // Naviguer vers la page d'accueil après la création de l'événement
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // Traitement en cas d'échec de création de l'événement
      print('Échec de l\'inscription. Code de statut: ${response.statusCode}');
      print(jsonResponse["error"]);
      print(token) ;
    }
  } catch (error) {
    // cas d'erreurs
    print('Erreur lors de la requête POST: $error');
  }
}

// Méthode pour envoyer l'image associée à l'événement




//     VideoPlayerController _initializeVideoPlayer() {
//   final controller = VideoPlayerController.file(widget.videoFile!);
//   controller.initialize().then((_) {
//     // La vidéo est initialisée avec succès
//   }).catchError((error) {
//     print("Erreur lors de l'initialisation de la vidéo: $error");
//     // Affichez un message d'erreur ou effectuez une action appropriée
//   });
//   return controller;
// }
    
      late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    // if (widget.videoFile != null) {
    //   // Initialisez le contrôleur vidéo à partir du fichier vidéo
    //   _videoPlayerController = VideoPlayerController.file(widget.videoFile!)
    //     ..initialize().then((_) {
    //       // La vidéo est initialisée avec succès
    //       setState(() {}); // Rafraîchissez l'état pour afficher la vidéo
    //     }).catchError((error) {
    //       print("Erreur lors de l'initialisation de la vidéo: $error");
    //       // Affichez un message d'erreur ou effectuez une action appropriée
    //     });
    // } else if (widget.videoPlayerController != null) {
    //   // Utilisez le contrôleur vidéo existant
    //   _videoPlayerController = widget.videoPlayerController!;
    // }
  }

  @override
  void dispose() {
    // _videoPlayerController.dispose(); // Libérez les ressources du contrôleur vidéo
    super.dispose();
  }

    return Scaffold(
       appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline , color: Colors.indigo[900],),
                Text(
                "Details de l'evenement",
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),] 
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
          child: Column(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                     Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                      
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 0)
                        )
                      ],
                      color: Colors.black26,
                      image: DecorationImage(
                         image: eventModel.eventImage!= null ? FileImage( File(eventModel.eventImage!)) : AssetImage("assets/images/background.jpg") as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text("flyers de l'evenement " ,style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),)
                  ]
                ),
              ),
              SizedBox(height: 20,),
            
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nom", style: TextStyle(color: Colors.indigo[900] , fontSize: 15   , fontWeight:FontWeight.w700),) , 
                    SizedBox(height: 2,),
                    CustomTextField(
                      prefixIcon: Icons.event_available_outlined,
                      suffixIcon: Icons.edit,
                      initialValue:  eventModel.eventName,
                    ),
       
                  ],
                ),
              ),
              SizedBox(height:10 ,) ,
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Localisation", style: TextStyle(color: Colors.indigo[900] , fontSize: 15  , fontWeight:FontWeight.w700 ),) , 
                    SizedBox(height: 2,),
                    CustomTextField(
                      prefixIcon: Icons.location_on,
                      suffixIcon: Icons.edit,
                      initialValue: eventModel.eventLocation?.place ?? '',
                    ),
       
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description", style: TextStyle(color: Colors.indigo[900] , fontSize: 15 , fontWeight:FontWeight.w700  ),) , 
                    SizedBox(height: 2,),
                    CustomTextField(
                      prefixIcon: Icons.description_outlined,
                      suffixIcon: Icons.edit,
                      initialValue:  eventModel.eventDescription,
                    ),
       
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date", style: TextStyle(color: Colors.indigo[900] , fontSize: 15  , fontWeight:FontWeight.w700),) , 
                    SizedBox(height: 2,),
                    CustomTextField(
                      prefixIcon: Icons.today_outlined,
                      suffixIcon: Icons.edit,
                      initialValue:  eventModel.eventDate ,
                    ),
       
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Heure de debut", style: TextStyle(color: Colors.indigo[900] , fontSize: 15 , fontWeight:FontWeight.w700 ),) , 
                    SizedBox(height: 2,),
                    CustomTextField(
                      prefixIcon: Icons.access_time_filled_rounded,
                      suffixIcon: Icons.edit,
                      initialValue:  eventModel.eventStartTime,
                    ),
       
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Heure de fin", style: TextStyle(color: Colors.indigo[900] , fontSize: 15 , fontWeight:FontWeight.w700 ),) , 
                    SizedBox(height: 2,),
                    CustomTextField(
                      prefixIcon: Icons.timelapse_outlined,
                      suffixIcon: Icons.edit,
                      initialValue:  eventModel.eventEndTime,
                    ),

                    
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30 , bottom: 15),
                child: Container(
                  child: Center(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.payment , color: Colors.indigo[900],),
                Text(
                "billeterie",
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),] 
            ),
                  ),
                ),
              ),
              eventModel.tickets.isEmpty
                ? Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      "Événement gratuit",
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                :
                ListView.builder(
                shrinkWrap: true,
                itemCount: eventModel.tickets.length,
                itemBuilder: (context, index) {
                  return  Container(
                        padding: EdgeInsets.symmetric( horizontal: 2),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(color: Colors.grey.shade200 , borderRadius:BorderRadius.circular(2) ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("categorie", style:TextStyle(color: Colors.indigo[900] , fontWeight: FontWeight.w600),),
                                  Text( eventModel.tickets[index].name, style:TextStyle(color: Colors.grey , fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("prix", style:TextStyle(color: Colors.indigo[900] , fontWeight: FontWeight.w600),),
                                  Text( eventModel.tickets[index].price + " FCFA" , style:TextStyle(color: Colors.grey , fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ), 
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("quantité", style:TextStyle(color: Colors.indigo[900] , fontWeight: FontWeight.w600),),
                                  Text( eventModel.tickets[index].quantity , style:TextStyle(color: Colors.grey , fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ),  

                          ],
                        ),
                        
                      

                      );
                      
                      
                  
                },
              ),
                            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: GestureDetector(
                    onTap:  _createEvent ,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Suivant",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                   
            ],
            
          ) , 
          
          ),
          
        ),
    );

    
  }

 }




//   void _createEvent() async {
//   String? token = auth.getToken();  // Remplacez par le token de l'utilisateur

//    Map<String, dynamic> requestBody = {
//     "name": eventModel.eventName,
//     "description": eventModel.eventDescription,
//     "location": {
//       "place": eventModel.eventLocation?.place,
//       "commune": eventModel.eventLocation?.commune,
//       "ville": eventModel.eventLocation?.ville,
//     },
//     "date": eventModel.eventDate,
//     "start_time": eventModel.eventStartTime,
//     "end_time": eventModel.eventEndTime,
//     "ticket_types": eventModel.generateTicketTypes(),
//     // "image": eventModel.eventImage, // Ajoutez l'image ici
//   };


//   // Convertir le corps de la requête en JSON
  
// String jsonBody = json.encode(requestBody);
  
// // Définir l'URL de ton API Django
// String apiUrl = 'http://192.168.151.151:8000/users/organisateur_create_event/';

//   // Enregistrer l'utilisateur, etc.

// try {
//   // Effectuer la requête POST
//   final response = await http.post(
//     Uri.parse(apiUrl),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'Token $token',
//     },
//     body: jsonBody,
//   );
     
//   // Décode la réponse en tant que JSON en spécifiant l'encodage des caractères
//   Map<String, dynamic> jsonResponse = json.decode(utf8.decode(response.bodyBytes));

//   // Vérifier si la requête a réussi (code de statut 200)
//   if (response.statusCode == 201 ||  response.statusCode == 200 ) {
//     eventModel.clearEventData();
//     tycketdata.clearTycketData();
//     print(jsonResponse["message"]);
//     print("voici id");
//     print(jsonResponse["message"]["id"]);

//     // Vérifier si la réponse de l'API contient "success" à true
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

//   } else {
//     // Traitement en cas d'échec
//     print('Échec de l\'inscription. Code de statut: ${response.statusCode}');
//     print(jsonResponse["error"]);
//   }
// } catch (error) {
//   // cas d'erreurs
//   print('Erreur lors de la requête POST: $error');
// }

//   }