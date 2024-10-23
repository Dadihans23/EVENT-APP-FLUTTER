import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatPasEvent extends StatefulWidget {
  const StatPasEvent({super.key});

  @override
  State<StatPasEvent> createState() => _StatPasEventState();
}

class _StatPasEventState extends State<StatPasEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Text("passé"),
      ),
    );
  }
}