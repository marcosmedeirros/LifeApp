import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GoogleCalendarService.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key? key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendário'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Adicione um evento ao Google Agenda
            GoogleCalendarService.addEvent('Tarefa', DateTime.now(), DateTime.now().add(Duration(hours: 1)));
          },
          child: Text('Adicionar evento ao Google Agenda'),
        ),
      ),
    );
  }
}
