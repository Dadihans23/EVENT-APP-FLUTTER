// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'dart:io';
// class DisplayVideoScreen extends StatelessWidget {
//   final File? videoFile;

//   const DisplayVideoScreen({
//     Key? key,
//     this.videoFile,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Vidéo Sélectionnée"),
//       ),
//       body: Center(
//         child: videoFile != null
//             ? AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: _initializeVideoPlayer(),
//               )
//             : Text("Aucune vidéo sélectionnée"),
//       ),
//     );
//   }

//   Widget _initializeVideoPlayer() {
//     final videoController = VideoPlayerController.file(videoFile!);
//     final chewieController = ChewieController(
//       videoPlayerController: videoController,
//       autoPlay: true,
//       looping: true,
//     );

//     return Chewie(controller: chewieController);
//   }
// }
