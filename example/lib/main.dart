import 'package:flutter/material.dart';
import 'package:anypay/anypay.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnyPay Example',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnyPay Example")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                PaymentUI.open(
                  context: context,
                  amount: 499,
                  title: "Success Payment",
                  startPayment: () async {
                    await Future.delayed(const Duration(seconds: 2));
                    return const PaymentResult(
                      status: PaymentStatus.success,
                      message: "Payment completed successfully!",
                    );
                  },
                  theme: const PaymentTheme(
                    success: Colors.greenAccent,
                    failure: Colors.redAccent,
                    primary: Colors.orange,
                    iconSize: 120,
                    animationDuration: Duration(milliseconds: 1000),
                    textStyle: TextStyle(fontSize: 18),
                    borderRadius: 12,
                  ),
                );
              },
              child: const Text("Simulate Success"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                PaymentUI.open(
                  context: context,
                  amount: 499,
                  title: "Failure Payment",
                  startPayment: () async {
                    await Future.delayed(const Duration(seconds: 2));
                    return const PaymentResult(
                      status: PaymentStatus.failure,
                      message: "Payment failed. Try again!",
                    );
                  },
                );
              },
              child: const Text("Simulate Failure"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                PaymentUI.open(
                  context: context,
                  amount: 499,
                  title: "Pending Payment",
                  startPayment: () async {
                    await Future.delayed(const Duration(seconds: 2));
                    return const PaymentResult(
                      status: PaymentStatus.pending,
                      message: "Payment is pending...",
                    );
                  },
                );
              },
              child: const Text("Simulate Pending"),
            ),
          ],
        ),
      ),
    );
  }
}
