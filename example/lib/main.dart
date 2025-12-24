import 'package:flutter/material.dart';
import 'package:anypay/anypay.dart';

import 'dummy_gateway.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AnyPay Example",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: AnyPay(
        title: "AnyPay Demo",
        amount: 500, // Amount to pay
        gateway: DummyGateway(), // Your payment gateway
        theme: const AnyPayTheme(
          primaryColor: Colors.orange,
          successColor: Colors.green,
          failureColor: Colors.red,
        ),
      ),
    );
  }
}
