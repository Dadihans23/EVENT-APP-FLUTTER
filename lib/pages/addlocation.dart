// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:latlong2/latlong.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Location Autocomplete',
//       home: LocationAutocomplete(),
//     );
//   }
// }

// class LocationAutocomplete extends StatefulWidget {
//   @override
//   _LocationAutocompleteState createState() => _LocationAutocompleteState();
// }

// class _LocationAutocompleteState extends State<LocationAutocomplete> {
//   final MapController mapController = MapController();
//   final TextEditingController searchController = TextEditingController();

//   // List of sample locations for autocomplete
//   final List<String> locations = [
//     'New York, USA',
//     'London, UK',
//     'Paris, France',
//     'Tokyo, Japan',
//     // Add more locations as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Autocomplete'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(10.0),
//             child: TypeAheadField(
//               textFieldConfiguration: TextFieldConfiguration(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   labelText: 'Enter location',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               suggestionsCallback: (pattern) async {
//                 // Filter suggestions based on user input
//                 return locations.where((location) =>
//                     location.toLowerCase().contains(pattern.toLowerCase()));
//               },
//               itemBuilder: (context, suggestion) {
//                 return ListTile(
//                   title: Text(suggestion),
//                 );
//               },
//               onSuggestionSelected: (suggestion) {
//                 // Navigate to selected location or update map
//                 // For simplicity, just print the selected location
//                 print('Selected location: $suggestion');
//               },
//             ),
//           ),
//           Expanded(
//             child: FlutterMap(
//               mapController: mapController,
//               options: MapOptions(
//                 center: LatLng(0, 0), // Initial center of the map
//                 zoom: 2, // Initial zoom level
//               ),
//               layers: [
//                 TileLayerOptions(
//                   urlTemplate:
//                       'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   subdomains: ['a', 'b', 'c'],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
