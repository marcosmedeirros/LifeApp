import 'package:flutter/material.dart';
import 'package:lifeprojeto/calendario.dart';
import 'package:lifeprojeto/habitos.dart';
import 'package:lifeprojeto/home.dart';

class Infos extends StatefulWidget {
  const Infos({Key? key}) : super(key: key);

  @override
  State<Infos> createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  int totalTasks = 50; // Número total de tarefas
  int dailyTasks = 5; // Número de tarefas diárias
  List<int> tasksByDay = [3, 6, 2, 5, 4, 7, 8]; // Número de tarefas por dia

  void navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informações',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF2B4568),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: Image.asset('assets/images/logo.png'), // Adicione o caminho para o seu logo
          ),
          SizedBox(height: 20),
          Card(
            elevation: 4,
            color: Color(0xFF2B4568), // Cor de fundo azul escuro
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total de Tarefas Feitas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    totalTasks.toString(),
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Tarefas da Semana',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: tasksByDay.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text('${index + 1}/05 - ${tasksByDay[index]} tarefas'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF2B4568), // Cor de fundo azul escuro
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.assignment),
                onPressed: () {
                  navigateToPage(Home());
                },
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  navigateToPage(Infos());
                },
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  navigateToPage(Calendario());
                },
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.star),
                onPressed: () {
                  navigateToPage(Habitos());
                },
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
