import 'package:flutter/material.dart';
import 'package:anypay/anypay.dart';
import 'example_adapter.dart'; // Your adapters This is example adapter you can define yours according to your need

void main() {
  // Register adapters
  AnyPay.registerAdapter('example', ExampleAdapter());
  AnyPay.registerAdapter('mock', MockAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PaymentHomePage());
  }
}

class PaymentHomePage extends StatefulWidget {
  const PaymentHomePage({super.key});

  @override
  State<PaymentHomePage> createState() => _PaymentHomePageState();
}

class _PaymentHomePageState extends State<PaymentHomePage> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnyPay Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ExampleAdapter Button
            ElevatedButton(
              onPressed: _isProcessing ? null : () => _pay('example'),
              child: const Text('Pay with ExampleAdapter'),
            ),
            const SizedBox(height: 20),
            // MockAdapter Button
            ElevatedButton(
              onPressed: _isProcessing ? null : () => _pay('mock'),
              child: const Text('Pay with MockAdapter'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pay(String providerName) async {
    setState(() {
      _isProcessing = true;
    });

    try {
      final result = await AnyPay.charge(
        providerName: providerName,
        options: PaymentOptions(
          amount: providerName == 'example' ? 5000 : 100,
          currency: providerName == 'example' ? 'INR' : 'USD',
        ),
      );

      if (!mounted) return; // Safe check before using context

      // Developer decides how to show UI based on status
      switch (result.status) {
        case PaymentStatus.success:
          _showDialog('Success', result.message ?? 'Payment succeeded');
          break;
        case PaymentStatus.failed:
          _showDialog('Failed', result.message ?? 'Payment failed');
          break;
        case PaymentStatus.pending:
          _showDialog('Pending', result.message ?? 'Payment pending');
          break;
        case PaymentStatus.error:
          _showDialog('Error', result.message ?? 'Payment error');
          break;
      }
    } catch (e) {
      if (mounted) {
        _showDialog('Error', e.toString());
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
