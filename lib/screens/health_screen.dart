import 'package:flutter/material.dart';
import 'storage_services.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  int waterCount = 0;

  @override
  void initState() {
    super.initState();
    _loadWater();
  }

  void _loadWater() async {
    waterCount = await StorageService.loadWaterCount();
    setState(() {});
  }

  void _increment() {
    waterCount++;
    StorageService.saveWaterCount(waterCount);
    setState(() {});
  }

  void _decrement() {
    if (waterCount > 0) {
      waterCount--;
      StorageService.saveWaterCount(waterCount);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Health Monitor")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Water Glasses",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "$waterCount",
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, size: 30),
                  onPressed: _decrement,
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.add, size: 30),
                  onPressed: _increment,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
