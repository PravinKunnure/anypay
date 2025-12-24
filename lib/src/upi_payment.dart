import 'package:flutter/material.dart';

class UpiPaymentScreen extends StatelessWidget {
  final List<String> apps;
  final Function(String app) onSelect;
  const UpiPaymentScreen(
      {super.key, required this.apps, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPI'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemCount: apps.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => onSelect(apps[index]),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 6,
              child: Center(
                  child: Text(apps[index],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold))),
            ),
          );
        },
      ),
    );
  }
}
