import 'package:flutter/material.dart';
import 'tasks_page.dart';
import 'completed_tasks_page.dart';
import 'calendar_page.dart';
import 'habits_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> tasks = []; // Lista de tarefas

  TextEditingController taskController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void showEditDialog(int index) {
    dateController.text = tasks[index]['date'];
    taskController.text = tasks[index]['task'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: dateController,
                decoration: InputDecoration(
                  hintText: 'dd/mm',
                ),
                onChanged: (value) {
                  if (value.length == 2) {
                    dateController.text = '$value/';
                    dateController.selection = TextSelection.fromPosition(TextPosition(offset: dateController.text.length));
                  }
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: taskController,
                decoration: InputDecoration(
                  hintText: 'Tarefa',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  tasks.add({
                    'task': taskController.text,
                    'date': dateController.text,
                    'completed': false, // Adicionando o estado da conclusão da tarefa
                  });
                  taskController.clear();
                  dateController.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2B4568),
              ),
              child: Text(
                'Salvar',
                style: TextStyle(color: Colors.white),
              ),
            ),

          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF2B4568),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                child: Image.asset('assets/images/logo.png'), // Adicione o caminho para o seu logo
              ),
              SizedBox(height: 20),
              const Text(
                'Adicione suas tarefas abaixo!',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        decoration: InputDecoration(
                          hintText: 'Adicionar tarefa',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 100,
                      child: TextField(
                        controller: dateController,
                        decoration: InputDecoration(
                          hintText: 'dd/mm',
                        ),
                        onChanged: (value) {
                          if (value.length == 2) {
                            dateController.text = '$value/';
                            dateController.selection = TextSelection.fromPosition(TextPosition(offset: dateController.text.length));
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          tasks.add({
                            'task': taskController.text,
                            'date': dateController.text,
                            'completed': false, // Adicionando o estado da conclusão da tarefa
                          });
                          taskController.clear();
                          dateController.clear();
                        });
                      },
                      color: Color(0xFF2B4568),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: tasks[index]['completed'],
                      onChanged: (bool? value) {
                        setState(() {
                          tasks[index]['completed'] = value;
                          if (value!) {
                            // Remover a tarefa da lista quando marcada como concluída
                            Future.delayed(Duration(milliseconds: 300), () {
                              setState(() {
                                tasks.removeAt(index);
                              });
                            });
                          }
                        });
                      },
                      activeColor: Color(0xFF2B4568),
                    ),
                    title: Text('${tasks[index]['date']} - ${tasks[index]['task']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            showEditDialog(index);
                          },
                          color: Color(0xFF2B4568),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                          color: Color(0xFF2B4568),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
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
                  Navigator.pushNamed(context, '/tasks');
                },
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  Navigator.pushNamed(context, '/completed_tasks');
                },
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  Navigator.pushNamed(context, '/calendar');
                },
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.star),
                onPressed: () {
                  Navigator.pushNamed(context, '/habits');
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
