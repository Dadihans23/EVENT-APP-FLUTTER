import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_event_app/models/places_concert.dart';
import 'package:my_event_app/pages/addEvent2.dart';
import 'package:my_event_app/pages/addEvent3.dart'; // Importez la classe AddEvent2

class AddEventLoc extends StatefulWidget {
  final String eventName;
  final String eventDescription;
  final String eventDate;
  final String eventStartTime;
  final String eventEndTime;

  const AddEventLoc({
    Key? key,
    required this.eventName,
    required this.eventDescription,
    required this.eventDate,
    required this.eventStartTime,
    required this.eventEndTime,
  }) : super(key: key);

  @override
  State<AddEventLoc> createState() => _AddEventLocState();
}
class _AddEventLocState extends State<AddEventLoc> {
  final TextEditingController _locationController = TextEditingController();
  List<ConcertPlace> _filteredLocationOptions = [];
  bool _showOptions = false;
  bool _locationChosen = false; // Nouvelle variable pour suivre si une localisation a été choisie

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.indigo[900]),
              Text(
                "Localisation",
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              reverse: true, // Défilement inverse
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: _locationController,
                        onChanged: (value) {
                          setState(() {
                            _filteredLocationOptions = concertPlaces
                                .where((place) => place.place
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                            _showOptions = value.isNotEmpty;
                          });
                        },
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_on),
                          suffixIcon: IconButton(
                              onPressed: () {
                                _locationController.clear();
                              },
                              icon: Icon(Icons.clear)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Entrez le lieu de l'evenement ",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                    if (_showOptions)
                      Material(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: _filteredLocationOptions.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              color: Colors.grey.shade900,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            final ConcertPlace place =
                                _filteredLocationOptions[index];
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _locationController.text = place.place;
                                  _showOptions = false;
                                  _locationChosen = true; // Mettre à jour la variable _locationChosen lorsque l'utilisateur choisit une localisation
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${place.place}",
                                          style: TextStyle(
                                              color: Colors.indigo[900],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),
                                      Text(
                                          "${place.commune}--${place.ville}",
                                          style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 12)),
                                    ],
                                  )),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Afficher le bouton seulement si une localisation a été choisie
            if (_locationChosen)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      String selectedLocation = _locationController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => addEvent2(
                            eventName: widget.eventName,
                            eventDescription: widget.eventDescription,
                            eventDate: widget.eventDate,
                            eventStartTime: widget.eventStartTime,
                            eventEndTime: widget.eventEndTime,
                            eventLocation: selectedLocation,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
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
          ],
        ),
      ),
    );
  }
}
