import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_event_app/pages/home_page.dart';
import 'package:my_event_app/pages/stat/futureevent.dart';
import 'package:my_event_app/pages/stat/pastevent.dart';
import 'package:provider/provider.dart';
import 'package:my_event_app/models/organizer.dart';


class StatByEvent extends StatefulWidget {
  const StatByEvent({super.key});

  @override
  State<StatByEvent> createState() => _StatByEventState();
}

class _StatByEventState extends State<StatByEvent> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final organizer = Provider.of<Organisateur>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        title: Text(
          "Statistique par événement",
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover, // Remplir tout l'espace du container
                                alignment: Alignment.center, // Centrer l'image
                          image: NetworkImage(
                              "http://192.168.131.151:8000${organizer.avatar!}"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    organizer.nomOrganisation!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.indigo[900], // Couleur du texte pour l'onglet sélectionné
            unselectedLabelColor: Colors.grey, // Couleur du texte pour les onglets non sélectionnés
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4.0, // Épaisseur de l'indicateur
            indicatorPadding: EdgeInsets.symmetric(horizontal: 20.0),
            indicatorColor: Colors.indigo[900],
            labelStyle: TextStyle(
              fontSize: 16.0, // Taille de la police pour l'onglet sélectionné
              fontWeight: FontWeight.bold,

              
            ),      
            tabs: [
              Tab(
                child: Text(
                  "À venir",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Passée",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                StatFutureEvent(),
                StatPasEvent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
