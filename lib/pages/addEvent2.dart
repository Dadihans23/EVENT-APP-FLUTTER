
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_event_app/pages/addEvent3.dart';
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:video_player/video_player.dart';


class addEvent2 extends StatefulWidget {
  final String eventName;
  final String eventDescription;
  final String eventDate;
  final String eventStartTime;
  final String eventEndTime;
  final String eventLocation ;

  const addEvent2({
    Key? key,
    required this.eventName,
    required this.eventDescription,
    required this.eventDate,
    required this.eventStartTime,
    required this.eventEndTime,
    required this.eventLocation,
  }) : super(key: key);

  @override
  _addEvent2State createState() => _addEvent2State();
}

class _addEvent2State extends State<addEvent2> {
  Uint8List? _image;
  File? selectedImage;
  File? _videoFile;
  File? _cameraVideoFile;
  

  VideoPlayerController? _videoPlayerController;
  VideoPlayerController? _cameraVideoPlayerController;

  @override
  void initState() {
    super.initState();
  
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _cameraVideoPlayerController?.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Vos visuels",
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      SizedBox(height:20),
                      Text(
                        "Choisissez votre flyer pour la cover de l'événement",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap: () {
                            showImagePickerOption(context);
                          },
                          child: Container(
                            height: 280,
                            width: 280,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade700,
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: _image == null
                                ? Center(
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Icon(Icons.image_rounded, size: 50, color: Colors.black),
                                          Text(
                                            "Cliquez ici",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Image.file(
                                    selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        
              
                SizedBox(height: 30),
               
                 Container(
                   
                      child: Container(
                        height: 100,
                        child: 
                             Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context , MaterialPageRoute(builder: (context)=> addEvent3(
                                      image: selectedImage,
                                      eventName: widget.eventName,
                                      eventDescription: widget.eventDescription,
                                      eventDate: widget.eventDate ,
                                      eventStartTime: widget.eventStartTime,
                                      eventEndTime:widget.eventEndTime,
                                      eventLocation : widget.eventLocation ,
        
                                ))
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 20,
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
                    
                  ),
            ],
          ),
        ),
      )
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.indigo[800],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 70,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 70,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    setState(() {
      selectedImage = File(pickedFile.path);
      _image = File(pickedFile.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); // Fermer le modal
  }

  Future _pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return;
    setState(() {
      selectedImage = File(pickedFile.path);
      _image = File(pickedFile.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); // Fermer le modal
  }

  void showVideoPickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.indigo[800],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickVideo();
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.video_library,
                            color: Colors.white,
                            size: 70,
                          ),
                          Text(
                            "Galerie vidéo",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickVideoFromCamera();
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.videocam,
                            color: Colors.white,
                            size: 70,
                          ),
                          Text(
                            "Caméra",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _pickVideo() async {
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedFile == null) return;

    _videoFile = File(pickedFile.path);
    _videoPlayerController?.dispose();
    _videoPlayerController = VideoPlayerController.file(_videoFile!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController!.play();
      });

    Navigator.of(context).pop();
  }

  Future _pickVideoFromCamera() async {
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.camera);
    if (pickedFile == null) return;

    _cameraVideoFile = File(pickedFile.path);
    _cameraVideoPlayerController?.dispose();
    _cameraVideoPlayerController = VideoPlayerController.file(_cameraVideoFile!)
      ..initialize().then((_) {
        setState(() {});
        _cameraVideoPlayerController!.play();
      });

    Navigator.of(context).pop();
  }
}





     