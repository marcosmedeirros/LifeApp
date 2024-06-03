import 'package:flutter/material.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<String> completedTasks = [
    'Fazer exercícios',
    'Ler um livro',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas Concluídas'),
      ),
      body: ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(completedTasks[index]),
          );
        },
      ),
    );
  }
}
