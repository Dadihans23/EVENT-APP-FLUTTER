import 'package:flutter/material.dart';
import 'package:my_event_app/models/eventmodel.dart';
import 'package:my_event_app/pages/addEvent2.dart';
import 'package:my_event_app/pages/addEventLoc.dart';
import 'package:my_event_app/pages/sumary_screen.dart';

import 'package:my_event_app/models/eventmodel.dart';
import 'package:provider/provider.dart'; // Importe la classe de modèle


class addEvent1 extends StatefulWidget {
  const addEvent1({Key? key}) : super(key: key);

  @override
  State<addEvent1> createState() => _addEvent1State();
}

class _addEvent1State extends State<addEvent1> {
  final TextEditingController _name_controller = TextEditingController();
  final TextEditingController _description_controller = TextEditingController();
  final TextEditingController _date_controller = TextEditingController();
  final TextEditingController _startTime_controller = TextEditingController();
  final TextEditingController _endTime_controller = TextEditingController();

  DateTime _dateTime = DateTime.now();

  void _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.indigo,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.indigo,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _dateTime) {
      setState(() {
        _dateTime = pickedDate;
        _date_controller.text =
            "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
      });
    }
  }
  

  void _showEndTimePicker() async {
    final TimeOfDay? EndpickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.indigo,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.indigo,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (EndpickedTime != null) {
      setState(() {
        // _startTime_controller.text = EndpickedTime.format(context);
        _endTime_controller.text = EndpickedTime.format(context);
      });
    }
  }

  void _showStartTimePicker() async {
    final TimeOfDay? StartpickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.indigo,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.indigo,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (StartpickedTime != null) {
      setState(() {
        _startTime_controller.text = StartpickedTime.format(context);
         print(StartpickedTime);
      });
    }
  }





  bool _validateInputs() {
  if (_name_controller.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Veuillez entrer un nom pour l\'événement.')),
    );
    return false;
  }
  if (_description_controller.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Veuillez entrer une description pour l\'événement.'),
      ),
    );
    return false;
  }
  if (_date_controller.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Veuillez choisir une date pour l\'événement.')),
    );
    return false;
  }
  if (_startTime_controller.text.isEmpty || _endTime_controller.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Veuillez choisir les heures de début et de fin pour l\'événement.'),
      ),
    );
    return false;
  }

  // Convertir les chaînes de caractères en objets TimeOfDay
  TimeOfDay startTime = TimeOfDay(
    hour: int.parse(_startTime_controller.text.split(":")[0]),
    minute: int.parse(_startTime_controller.text.split(":")[1]),
  );
  TimeOfDay endTime = TimeOfDay(
    hour: int.parse(_endTime_controller.text.split(":")[0]),
    minute: int.parse(_endTime_controller.text.split(":")[1]),
  );

  // Comparer les heures
  if (endTime.hour < startTime.hour ||
      (endTime.hour == startTime.hour && endTime.minute < startTime.minute)) {
    // Afficher une boîte de dialogue d'alerte si l'heure de fin est antérieure à l'heure de début
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        title: Text(
          "erreur ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.indigo[900],
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      content: SingleChildScrollView(
        child: Form(  // Ajouter Form ici
          child: Text('L\'heure de fin doit être postérieure à l\'heure de début.' , textAlign: TextAlign.center, style: TextStyle(
            color: Colors.indigo[900],
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            
          ),)
        ),
      ),
      actions: [
        MaterialButton( onPressed: () {
            Navigator.of(context).pop();
          }, child: Text("ok")),
      ],
    );
      },
    );
    return false;
  }

  return true;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Create event",
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Titre de l'evenement",
                  style: TextStyle(color: Colors.grey)),
              SizedBox(height: 10),
              TextField(
                controller: _name_controller,
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  hintText: 'Entrez votre nom',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => _name_controller.clear(),
                    icon: Icon(Icons.clear, color: Colors.indigo),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Description de l'evenement",
                  style: TextStyle(color: Colors.grey)),
              SizedBox(height: 10),
              TextField(
                controller: _description_controller,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  hintText: 'Entrez votre description',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => _description_controller.clear(),
                    icon: Icon(Icons.clear, color: Colors.indigo),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Date", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 10),
              TextField(
                controller: _date_controller,
                readOnly: true,
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  hintText: 'Entrez votre date',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  suffixIcon: IconButton(
                    onPressed: _showDatePicker,
                    icon: Icon(Icons.calendar_today, color: Colors.indigo),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Heure de début",
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 10),
                        TextField(
                          controller: _startTime_controller,
                          readOnly: true,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade900),
                            ),
                            hintText: '',
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            suffixIcon: IconButton(
                              onPressed: _showStartTimePicker,
                              icon:
                                  Icon(Icons.access_time, color: Colors.indigo),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Heure de fin",
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 10),
                        TextField(
                          controller: _endTime_controller,
                          readOnly: true,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade900),
                            ),
                            hintText: '',
                            hintStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            suffixIcon: IconButton(
                              onPressed: _showEndTimePicker,
                              icon:
                                  Icon(Icons.access_time, color: Colors.indigo),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (_validateInputs()) {   
                      Provider.of<EventModel>(context, listen: false).setEventName(_name_controller.text);
                      Provider.of<EventModel>(context, listen: false).setEventDescription(_description_controller.text);
                      Provider.of<EventModel>(context, listen: false).setEventDate(_date_controller.text);
                      Provider.of<EventModel>(context, listen: false).setEventDateiso(_dateTime);
                      Provider.of<EventModel>(context, listen: false).setEventStartTime(_startTime_controller.text);
                      Provider.of<EventModel>(context, listen: false).setEventEndTime(_endTime_controller.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEventLoc(
                          
                          ),
                        ),
                      );
                    }
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
            ],
          ),
        ),
      ),
    );
  }
}
