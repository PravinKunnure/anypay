import 'package:flutter/material.dart';

class NetBankingScreen extends StatelessWidget {
  final List<String> banks;
  final Function(String bank) onSelect;
  const NetBankingScreen(
      {super.key, required this.banks, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Net Banking'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: banks.length,
        itemBuilder: (_, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.account_balance),
              title: Text(banks[index]),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => onSelect(banks[index]),
            ),
          );
        },
      ),
    );
  }
}
