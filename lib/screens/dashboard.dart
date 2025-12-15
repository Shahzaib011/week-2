import 'package:flutter/material.dart';
import 'profile.dart';
import '../models/user_model.dart';
import '../widgets/info_card.dart';

class DashboardScreen extends StatelessWidget {
  final User user;
  DashboardScreen({super.key, required this.user});

  final List<String> items = [
    "Project 1",
    "Project 2",
    "Project 3",
    "Project 4",
    "Project 5"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfileScreen(user: user),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              "Welcome, ${user.name}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InfoCard(title: items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
