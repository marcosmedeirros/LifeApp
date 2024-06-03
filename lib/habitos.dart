import 'package:flutter/material.dart';
import 'package:lifeprojeto/calendario.dart';
import 'package:lifeprojeto/home.dart';
import 'package:lifeprojeto/infos.dart';

class Habitos extends StatefulWidget {
  const Habitos({Key? key});

  @override
  State<Habitos> createState() => _HabitosState();
}

class _HabitosState extends State<Habitos> {
  final List<Map<String, dynamic>> habits = [
    {'name': 'Meditar', 'days': 3},
    {'name': 'Caminhar', 'days': 5},
  ];

  void _incrementHabitDays(int index) {
    setState(() {
      habits[index]['days']++;
    });
  }

  void _addHabit(String habitName) {
    setState(() {
      habits.add({'name': habitName, 'days': 0});
    });
  }

  void _editHabit(int index, String newName) {
    setState(() {
      habits[index]['name'] = newName;
    });
  }

  void _deleteHabit(int index) {
    setState(() {
      habits.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController habitController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Habitos',
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
            Text(
              'Seus Hábitos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B4568),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Color(0xFF2B4568),
                    child: ListTile(
                      title: Text(
                        habits[index]['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${habits[index]['days']} dias',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              _incrementHabitDays(index);
                            },
                            color: Colors.white,
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              // Remove o hábito apenas se ele tiver mais de 0 dias
                              if (habits[index]['days'] > 0) {
                                _incrementHabitDays(index);
                              }
                            },
                            color: Colors.white,
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Abre um diálogo para editar o nome do hábito
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Editar Hábito'),
                                    content: TextField(
                                      controller: TextEditingController(text: habits[index]['name']),
                                      onChanged: (newName) {
                                        _editHabit(index, newName);
                                      },
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancelar', style: TextStyle(color: Colors.blue[900])),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Salvar'),
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white, backgroundColor: Color(0xFF2B4568),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            color: Colors.white,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteHabit(index);
                            },
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: habitController,
                      decoration: InputDecoration(
                        labelText: 'Novo Hábito',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (habitController.text.isNotEmpty) {
                        _addHabit(habitController.text);
                        habitController.clear();
                      }
                    },
                    color: Colors.blue[900],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
        color: Color(0xFF2B4568), // Cor de fundo azul
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.assignment),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Infos()),
                    );
                  },
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Calendario()),
                    );
                  },
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Habitos()),
                    );
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
