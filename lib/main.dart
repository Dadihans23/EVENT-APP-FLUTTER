import 'package:flutter/material.dart';
import 'package:my_event_app/data/ticket_data.dart';
import 'package:my_event_app/pages/addEvent1.dart';
import 'package:my_event_app/pages/addEvent2.dart';
import 'package:my_event_app/pages/addEventLoc.dart';
import 'package:my_event_app/pages/addevent4.dart';
import 'package:my_event_app/pages/intro.dart';
import 'package:my_event_app/pages/login.dart';
import 'package:my_event_app/pages/register.dart';
import 'package:provider/provider.dart';
import 'package:my_event_app/pages/addEvent3.dart';
import 'package:my_event_app/pages/register.dart';
import 'package:my_event_app/pages/sumary_screen.dart';
import 'package:my_event_app/pages/profile.dart';





void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => tycketData(), // Remplace TonChangeNotifierClass par ta classe de ChangeNotifier
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Intro(),
      // Ajoute ici d'autres configurations de MaterialApp si nécessaire
    );
  }
}

// ‎4456 9000 4666 9695‎