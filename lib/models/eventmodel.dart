import 'package:flutter/foundation.dart';
import 'places_concert.dart'; // Import de la classe ConcertPlace

class EventModel extends ChangeNotifier {
  String _eventName = '';
  String _eventDescription = '';
  String _eventDate = '';
  String _eventStartTime = '';
  String _eventEndTime = '';
  ConcertPlace? _eventLocation; // Utilisation de ConcertPlace comme type pour la localisation
  String? _eventImage; // Chemin de l'image de l'événement
  List<TicketItem> _tickets = []; // Liste des billets pour l'événement

  String get eventName => _eventName;
  String get eventDescription => _eventDescription;
  String get eventDate => _eventDate;
  String get eventStartTime => _eventStartTime;
  String get eventEndTime => _eventEndTime;
  ConcertPlace? get eventLocation => _eventLocation; // Accesseur pour la localisation de l'événement
  String? get eventImage => _eventImage; // Accesseur pour l'image de l'événement
  List<TicketItem> get tickets => _tickets; // Accesseur pour la liste des billets

  void setEventName(String value) {
    _eventName = value;
    notifyListeners();
  }

  void setEventDescription(String value) {
    _eventDescription = value;
    notifyListeners();
  }

  void setEventDate(String value) {
    _eventDate = value;
    notifyListeners();
  }

  void setEventStartTime(String value) {
    _eventStartTime = value;
    notifyListeners();
  }

  void setEventEndTime(String value) {
    _eventEndTime = value;
    notifyListeners();
  }

  void setEventLocation(ConcertPlace value) {
    _eventLocation = value;
    notifyListeners();
  }

  void setEventImage(String value) {
    _eventImage = value;
    notifyListeners();
  }

  void addTicket(TicketItem ticket) {
    _tickets.add(ticket);
    notifyListeners();
  }

  void removeTicket(TicketItem ticket) {
    _tickets.remove(ticket);
    notifyListeners();
  }
}

class TicketItem {
  final String name;
  final String price;
  final String quantity;

  TicketItem({required this.name, required this.price, required this.quantity});
}
