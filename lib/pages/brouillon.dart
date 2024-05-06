// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:my_event_app/models/tycket_item.dart'; // Assurez-vous d'importer la classe tycketItem
// import 'package:my_event_app/pages/addEvent4.dart'; // Importez addEvent4 au lieu de addEvent3
// import 'package:uuid/uuid.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:video_player/video_player.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:my_event_app/components/customtextfield.dart';
// import 'package:video_player/video_player.dart';


// class addEvent4 extends StatefulWidget {
//   final String? eventName;
//   final String? eventDescription;
//   final String? eventDate;  
//   final List<tycketItem> createdTickets; // Ajouter ce paramètre

//   final String? eventStartTime;
//   final String? eventEndTime;
//   final String? eventLocation ;
  
//  final File? image;
//   final File? videoFile;
//   final VideoPlayerController? videoPlayerController;

//   const addEvent4({
    
//     Key? key,
//     this.image,
//     this.videoFile,
//     this.videoPlayerController,
//     this.eventName,
//     this.eventDescription,
//     this.eventDate,
//     this.eventStartTime,
//     this.eventEndTime,
//     this.eventLocation,
//     required this.createdTickets,
 
//   }) : super(key: key);
//   @override
//   _addEvent4State createState() => _addEvent4State();
// }
// class _addEvent4State extends State<addEvent4> {


//   @override
//   Widget build(BuildContext context) {
    
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
    
//     return Scaffold(
//        appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.info_outline , color: Colors.indigo[900],),
//                 Text(
//                 "Details de l'evenement",
//                 style: TextStyle(
//                   color: Colors.indigo[900],
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),] 
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
//           child: Column(
//             children: [
//               Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children:[
//                      Container(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     height: MediaQuery.of(context).size.height * 0.3,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       boxShadow: [
                      
//                         BoxShadow(
//                           color: Colors.white,
//                           offset: Offset(0, 0)
//                         )
//                       ],
//                       color: Colors.black26,
//                       image: DecorationImage(
//                          image: widget.image != null ? FileImage(widget.image!) : AssetImage("assets/images/background.jpg") as ImageProvider,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Text("flyers de l'evenement " ,style: TextStyle(
//                   color: Colors.indigo[900],
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                 ),)
//                   ]
//                 ),
//               ),
//               SizedBox(height: 20,),
            
//               Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Nom", style: TextStyle(color: Colors.indigo[900] , fontSize: 15   , fontWeight:FontWeight.w700),) , 
//                     SizedBox(height: 2,),
//                     CustomTextField(
//                       prefixIcon: Icons.event_available_outlined,
//                       suffixIcon: Icons.edit,
//                       initialValue: "Valeur ",
//                     ),
       
//                   ],
//                 ),
//               ),
//               SizedBox(height:10 ,) ,
//               Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Localisation", style: TextStyle(color: Colors.indigo[900] , fontSize: 15  , fontWeight:FontWeight.w700 ),) , 
//                     SizedBox(height: 2,),
//                     CustomTextField(
//                       prefixIcon: Icons.location_on,
//                       suffixIcon: Icons.edit,
//                       initialValue: "Valeur ",
//                     ),
       
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Description", style: TextStyle(color: Colors.indigo[900] , fontSize: 15 , fontWeight:FontWeight.w700  ),) , 
//                     SizedBox(height: 2,),
//                     CustomTextField(
//                       prefixIcon: Icons.description_outlined,
//                       suffixIcon: Icons.edit,
//                       initialValue: "Valeur ",
//                     ),
       
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Date", style: TextStyle(color: Colors.indigo[900] , fontSize: 15  , fontWeight:FontWeight.w700),) , 
//                     SizedBox(height: 2,),
//                     CustomTextField(
//                       prefixIcon: Icons.today_outlined,
//                       suffixIcon: Icons.edit,
//                       initialValue: "Valeur ",
//                     ),
       
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Heure de debut", style: TextStyle(color: Colors.indigo[900] , fontSize: 15 , fontWeight:FontWeight.w700 ),) , 
//                     SizedBox(height: 2,),
//                     CustomTextField(
//                       prefixIcon: Icons.access_time_filled_rounded,
//                       suffixIcon: Icons.edit,
//                       initialValue: "Valeur ",
//                     ),
       
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Heure de fin", style: TextStyle(color: Colors.indigo[900] , fontSize: 15 , fontWeight:FontWeight.w700 ),) , 
//                     SizedBox(height: 2,),
//                     CustomTextField(
//                       prefixIcon: Icons.timelapse_outlined,
//                       suffixIcon: Icons.edit,
//                       initialValue: "Valeur ",
//                     ),

                    
//                   ],
//                 ),
//               ),

//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 30),
//                 child: Container(
//                   child: Center(
//                     child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.payment , color: Colors.indigo[900],),
//                 Text(
//                 "billeterie",
//                 style: TextStyle(
//                   color: Colors.indigo[900],
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),] 
//             ),
//                   ),
//                 ),
//               ),
//              widget.createdTickets.isEmpty
//                 ? Container(
//                     padding: EdgeInsets.all(10),
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade100,
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                     child: Text(
//                       "Événement gratuit",
//                       style: TextStyle(
//                         color: Colors.indigo[900],
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   )
//                 :
//                 ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: widget.createdTickets.length,
//                 itemBuilder: (context, index) {
//                   return  Container(
//                         padding: EdgeInsets.symmetric( horizontal: 2),
//                         margin: EdgeInsets.symmetric(vertical: 10),
//                         decoration: BoxDecoration(color: Colors.grey.shade200 , borderRadius:BorderRadius.circular(2) ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                           Expanded(
//                             child: Container(
//                               padding: EdgeInsets.all(5),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("categorie", style:TextStyle(color: Colors.indigo[900] , fontWeight: FontWeight.w600),),
//                                   Text(widget.createdTickets[index].name, style:TextStyle(color: Colors.grey , fontWeight: FontWeight.w600)),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               padding: EdgeInsets.all(5),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("prix", style:TextStyle(color: Colors.indigo[900] , fontWeight: FontWeight.w600),),
//                                   Text(widget.createdTickets[index].price + " FCFA" , style:TextStyle(color: Colors.grey , fontWeight: FontWeight.w600)),
//                                 ],
//                               ),
//                             ),
//                           ), 
//                           Expanded(
//                             child: Container(
//                               padding: EdgeInsets.all(5),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("quantité", style:TextStyle(color: Colors.indigo[900] , fontWeight: FontWeight.w600),),
//                                   Text(widget.createdTickets[index].quantity , style:TextStyle(color: Colors.grey , fontWeight: FontWeight.w600)),
//                                 ],
//                               ),
//                             ),
//                           ),  

//                           ],
//                         ),
                        
                      

//                       );
                      
                      
                  
//                 },
//               ),
//                     Container(
//           decoration: BoxDecoration(
//             color: Colors.amber,
//           ),
//           child: widget.videoFile != null
//               ? AspectRatio(
//                   aspectRatio: 16 / 9, // ou tout autre ratio approprié
//                   child: VideoPlayer(_initializeVideoPlayer()),
//                 )
//               : Text("Aucune vidéo sélectionnée"),
//         ),


//             ],
            
//           ) , 
          
//           ),
          
//         ),
//     );
//   }
// }

