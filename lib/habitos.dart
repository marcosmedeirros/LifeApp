import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final TextEditingController habitController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Hábitos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(habits[index]['name']),
                  subtitle: Text('${habits[index]['days']} dias'),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      _incrementHabitDays(index);
                    },
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
