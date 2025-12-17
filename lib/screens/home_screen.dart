import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'storage_services.dart';
import 'health_screen.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _taskController = TextEditingController();
  List<String> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    tasks = await StorageService.loadTasks();
    setState(() {});
  }

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      tasks.add(_taskController.text);
      StorageService.saveTasks(tasks);
      _taskController.clear();
      setState(() {});
    }
  }

  void _deleteTask(int index) {
    tasks.removeAt(index);
    StorageService.saveTasks(tasks);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WellCome Shahzaib"),
        actions: [
          IconButton(
            icon: const Icon(Icons.water_drop),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HealthScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: "Add a task",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTask,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: tasks.isEmpty
                  ? const Center(child: Text("No tasks yet"))
                  : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(tasks[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteTask(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
